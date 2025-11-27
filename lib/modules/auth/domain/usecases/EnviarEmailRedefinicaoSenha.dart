import '../repositories/IAuthRepository.dart';

/// Caso de uso para enviar email de redefinição de senha.
class EnviarEmailRedefinicaoSenha {
  final IAuthRepository repository;

  EnviarEmailRedefinicaoSenha(this.repository);

  Future<void> call(String email) async {
    if (email.isEmpty) {
      throw Exception('Email não pode ser vazio');
    }
    if (!email.contains('@')) {
      throw Exception('Email inválido');
    }

    return await repository.enviarEmailRedefinicaoSenha(email);
  }
}
