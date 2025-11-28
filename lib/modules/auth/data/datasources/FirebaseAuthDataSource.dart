import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/UsuarioModel.dart';
import 'IAuthDataSource.dart';

/// Implementação da fonte de dados de autenticação usando Firebase Auth.
class FirebaseAuthDataSource implements IAuthDataSource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthDataSource({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
       _googleSignIn = googleSignIn ?? GoogleSignIn();

  @override
  Future<UsuarioModel> loginComEmailESenha(String email, String senha) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );

      return _converterFirebaseUserParaUsuarioModel(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      throw _tratarErroFirebase(e);
    } catch (e) {
      throw Exception('Erro ao realizar login: ${e.toString()}');
    }
  }

  @override
  Future<UsuarioModel> loginComGoogle() async {
    try {
      // Inicia o fluxo de login do Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Login com Google cancelado pelo usuário');
      }

      // Obtém os detalhes de autenticação da requisição
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Cria uma nova credencial
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Autentica no Firebase
      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);

      return _converterFirebaseUserParaUsuarioModel(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      throw _tratarErroFirebase(e);
    } catch (e) {
      if (e.toString().contains('cancelado')) {
        rethrow;
      }
      throw Exception('Erro ao realizar login com Google: ${e.toString()}');
    }
  }

  @override
  Future<UsuarioModel> registrarComEmailESenha(
    String email,
    String senha,
    String nome,
  ) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      // Atualiza o display name do usuário
      await userCredential.user?.updateDisplayName(nome);
      await userCredential.user?.reload();
      final updatedUser = _firebaseAuth.currentUser;

      return _converterFirebaseUserParaUsuarioModel(updatedUser!, nome: nome);
    } on FirebaseAuthException catch (e) {
      throw _tratarErroFirebase(e);
    } catch (e) {
      throw Exception('Erro ao registrar usuário: ${e.toString()}');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
    } catch (e) {
      throw Exception('Erro ao realizar logout: ${e.toString()}');
    }
  }

  @override
  Future<UsuarioModel?> obterUsuarioAtual() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return null;
      }

      // Recarrega os dados do usuário para garantir que estão atualizados
      await user.reload();
      final updatedUser = _firebaseAuth.currentUser;

      return _converterFirebaseUserParaUsuarioModel(updatedUser!);
    } catch (e) {
      // Se não conseguir recarregar, tenta retornar o usuário em cache se existir
      if (_firebaseAuth.currentUser != null) {
        return _converterFirebaseUserParaUsuarioModel(
          _firebaseAuth.currentUser!,
        );
      }
      return null;
    }
  }

  @override
  Future<void> enviarEmailRedefinicaoSenha(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw _tratarErroFirebase(e);
    } catch (e) {
      throw Exception('Erro ao enviar email de redefinição: ${e.toString()}');
    }
  }

  @override
  Future<void> atualizarSenha(String senhaAtual, String novaSenha) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        throw Exception('Usuário não autenticado');
      }

      // Reautentica o usuário antes de atualizar a senha
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: senhaAtual,
      );
      await user.reauthenticateWithCredential(credential);

      // Atualiza a senha
      await user.updatePassword(novaSenha);
    } on FirebaseAuthException catch (e) {
      throw _tratarErroFirebase(e);
    } catch (e) {
      throw Exception('Erro ao atualizar senha: ${e.toString()}');
    }
  }

  /// Converte um Firebase User para UsuarioModel
  UsuarioModel _converterFirebaseUserParaUsuarioModel(
    User firebaseUser, {
    String? nome,
  }) {
    return UsuarioModel(
      id: firebaseUser.uid,
      nome: nome ?? firebaseUser.displayName ?? '',
      email: firebaseUser.email ?? '',
      telefone: firebaseUser.phoneNumber,
      fotoPerfil: firebaseUser.photoURL,
      dataCadastro: firebaseUser.metadata.creationTime,
      dataAtualizacao: firebaseUser.metadata.lastSignInTime,
      ativo: !firebaseUser.emailVerified ? null : true,
    );
  }

  /// Trata erros do Firebase Auth e retorna mensagens amigáveis
  Exception _tratarErroFirebase(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return Exception('Usuário não encontrado');
      case 'wrong-password':
        return Exception('Senha incorreta');
      case 'email-already-in-use':
        return Exception('Este email já está em uso');
      case 'invalid-email':
        return Exception('Email inválido');
      case 'weak-password':
        return Exception('Senha muito fraca');
      case 'user-disabled':
        return Exception('Usuário desabilitado');
      case 'too-many-requests':
        return Exception('Muitas tentativas. Tente novamente mais tarde');
      case 'operation-not-allowed':
        return Exception('Operação não permitida');
      case 'requires-recent-login':
        return Exception('Reautenticação necessária');
      case 'credential-already-in-use':
        return Exception('Esta conta já está vinculada a outro usuário');
      default:
        return Exception(e.message ?? 'Erro de autenticação');
    }
  }
}
