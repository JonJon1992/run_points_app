import 'package:get/get.dart';

import '../../domain/entities/Usuario.dart';
import '../../domain/usecases/AtualizarUsuario.dart';
import '../../domain/usecases/BuscarUsuarioPorEmail.dart';
import '../../domain/usecases/CriarUsuario.dart';
import '../../domain/usecases/RemoverUsuario.dart';

/// Controller responsável por gerenciar o estado e lógica de apresentação
/// relacionada aos usuários.
class UsuarioController extends GetxController {
  final CriarUsuario criarUsuario;
  final BuscarUsuarioPorEmail buscarUsuarioPorEmail;
  final AtualizarUsuario atualizarUsuario;
  final RemoverUsuario removerUsuario;

  UsuarioController({
    required this.criarUsuario,
    required this.buscarUsuarioPorEmail,
    required this.atualizarUsuario,
    required this.removerUsuario,
  });

  // Estados observáveis
  final Rx<Usuario?> usuarioAtual = Rx<Usuario?>(null);
  final RxList<Usuario> usuarios = <Usuario>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  /// Cria um novo usuário
  Future<void> criarNovoUsuario(Usuario usuario) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final novoUsuario = await criarUsuario.call(usuario);
      usuarios.add(novoUsuario);
      usuarioAtual.value = novoUsuario;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  /// Busca um usuário pelo email
  Future<void> buscarPorEmail(String email) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final usuario = await buscarUsuarioPorEmail.call(email);
      usuarioAtual.value = usuario;
    } catch (e) {
      errorMessage.value = e.toString();
      usuarioAtual.value = null;
    } finally {
      isLoading.value = false;
    }
  }

  /// Atualiza um usuário existente
  Future<void> atualizarUsuarioExistente(Usuario usuario) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final usuarioAtualizado = await atualizarUsuario.call(usuario);
      usuarioAtual.value = usuarioAtualizado;

      // Atualiza na lista se existir
      final index = usuarios.indexWhere((u) => u.id == usuario.id);
      if (index != -1) {
        usuarios[index] = usuarioAtualizado;
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  /// Remove um usuário
  Future<void> removerUsuarioExistente(String id) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      await removerUsuario.call(id);
      usuarios.removeWhere((u) => u.id == id);
      if (usuarioAtual.value?.id == id) {
        usuarioAtual.value = null;
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  /// Limpa os dados do controller
  void limpar() {
    usuarioAtual.value = null;
    usuarios.clear();
    errorMessage.value = '';
  }
}
