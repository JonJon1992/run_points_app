import 'package:get/get.dart';
import '../../domain/entities/Usuario.dart';
import '../../domain/usecases/LoginComEmailESenha.dart';
import '../../domain/usecases/LoginComGoogle.dart';
import '../../domain/usecases/RegistrarComEmailESenha.dart';
import '../../domain/usecases/Logout.dart';
import '../../domain/usecases/ObterUsuarioAtual.dart';
import '../../domain/usecases/EnviarEmailRedefinicaoSenha.dart';

/// Controller responsável por gerenciar o estado e lógica de autenticação.
class AuthController extends GetxController {
  final LoginComEmailESenha loginComEmailESenha;
  final LoginComGoogle loginComGoogle;
  final RegistrarComEmailESenha registrarComEmailESenha;
  final Logout logout;
  final ObterUsuarioAtual obterUsuarioAtual;
  final EnviarEmailRedefinicaoSenha enviarEmailRedefinicaoSenha;

  AuthController({
    required this.loginComEmailESenha,
    required this.loginComGoogle,
    required this.registrarComEmailESenha,
    required this.logout,
    required this.obterUsuarioAtual,
    required this.enviarEmailRedefinicaoSenha,
  });

  // Estados observáveis
  final Rx<Usuario?> usuarioAutenticado = Rx<Usuario?>(null);
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxBool isAuthenticated = false.obs;

  @override
  void onInit() {
    super.onInit();
    verificarUsuarioAutenticado();
  }

  /// Verifica se há um usuário autenticado ao inicializar
  Future<void> verificarUsuarioAutenticado() async {
    try {
      isLoading.value = true;
      final usuario = await obterUsuarioAtual.call();
      usuarioAutenticado.value = usuario;
      isAuthenticated.value = usuario != null;
    } catch (e) {
      // Silencioso na inicialização
      usuarioAutenticado.value = null;
      isAuthenticated.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  /// Realiza login com email e senha
  Future<bool> fazerLogin(String email, String senha) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final usuario = await loginComEmailESenha.call(email, senha);
      usuarioAutenticado.value = usuario;
      isAuthenticated.value = true;
      return true;
    } catch (e) {
      errorMessage.value = e.toString();
      isAuthenticated.value = false;
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// Realiza login com Google
  Future<bool> fazerLoginGoogle() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final usuario = await loginComGoogle.call();
      usuarioAutenticado.value = usuario;
      isAuthenticated.value = true;
      return true;
    } catch (e) {
      // Não mostra erro se for cancelado pelo usuário
      if (!e.toString().contains('cancelado')) {
        errorMessage.value = e.toString();
      }
      isAuthenticated.value = false;
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// Registra um novo usuário
  Future<bool> fazerRegistro(String email, String senha, String nome) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final usuario = await registrarComEmailESenha.call(email, senha, nome);
      usuarioAutenticado.value = usuario;
      isAuthenticated.value = true;
      return true;
    } catch (e) {
      errorMessage.value = e.toString();
      isAuthenticated.value = false;
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// Realiza logout
  Future<void> fazerLogout() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      await logout.call();
      usuarioAutenticado.value = null;
      isAuthenticated.value = false;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  /// Envia email de redefinição de senha
  Future<bool> enviarRedefinicaoSenha(String email) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      await enviarEmailRedefinicaoSenha.call(email);
      return true;
    } catch (e) {
      errorMessage.value = e.toString();
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  /// Limpa mensagens de erro
  void limparErro() {
    errorMessage.value = '';
  }
}
