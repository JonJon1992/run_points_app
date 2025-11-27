import 'package:get/get.dart';
import '../../data/datasources/UsuarioLocalDataSource.dart';
import '../../data/datasources/UsuarioRemoteDataSource.dart';
import '../../data/datasources/FirebaseAuthDataSource.dart';
import '../../data/repositories/UsuarioRepository.dart';
import '../../data/repositories/AuthRepository.dart';
import '../../domain/usecases/BuscarUsuarioPorEmail.dart';
import '../../domain/usecases/CriarUsuario.dart';
import '../../domain/usecases/AtualizarUsuario.dart';
import '../../domain/usecases/RemoverUsuario.dart';
import '../../domain/usecases/LoginComEmailESenha.dart';
import '../../domain/usecases/LoginComGoogle.dart';
import '../../domain/usecases/RegistrarComEmailESenha.dart';
import '../../domain/usecases/Logout.dart';
import '../../domain/usecases/ObterUsuarioAtual.dart';
import '../../domain/usecases/EnviarEmailRedefinicaoSenha.dart';
import '../controllers/UsuarioController.dart';
import '../controllers/AuthController.dart';

/// Binding responsável por injetar as dependências do módulo de autenticação.
class AuthBinding implements Bindings {
  @override
  void dependencies() {
    // Data Sources - Usuários
    final localDataSource = UsuarioLocalDataSource();
    final remoteDataSource = UsuarioRemoteDataSource();

    // Repository - Usuários
    final usuarioRepository = UsuarioRepository(
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );

    // Use Cases - Usuários
    final criarUsuario = CriarUsuario(usuarioRepository);
    final buscarUsuarioPorEmail = BuscarUsuarioPorEmail(usuarioRepository);
    final atualizarUsuario = AtualizarUsuario(usuarioRepository);
    final removerUsuario = RemoverUsuario(usuarioRepository);

    // Data Source - Autenticação
    final authDataSource = FirebaseAuthDataSource();

    // Repository - Autenticação
    final authRepository = AuthRepository(dataSource: authDataSource);

    // Use Cases - Autenticação
    final loginComEmailESenha = LoginComEmailESenha(authRepository);
    final loginComGoogle = LoginComGoogle(authRepository);
    final registrarComEmailESenha = RegistrarComEmailESenha(authRepository);
    final logout = Logout(authRepository);
    final obterUsuarioAtual = ObterUsuarioAtual(authRepository);
    final enviarEmailRedefinicaoSenha = EnviarEmailRedefinicaoSenha(
      authRepository,
    );

    // Controllers
    Get.lazyPut<UsuarioController>(
      () => UsuarioController(
        criarUsuario: criarUsuario,
        buscarUsuarioPorEmail: buscarUsuarioPorEmail,
        atualizarUsuario: atualizarUsuario,
        removerUsuario: removerUsuario,
      ),
    );

    Get.lazyPut<AuthController>(
      () => AuthController(
        loginComEmailESenha: loginComEmailESenha,
        loginComGoogle: loginComGoogle,
        registrarComEmailESenha: registrarComEmailESenha,
        logout: logout,
        obterUsuarioAtual: obterUsuarioAtual,
        enviarEmailRedefinicaoSenha: enviarEmailRedefinicaoSenha,
      ),
    );
  }
}
