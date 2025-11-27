class Usuario {
  final String? id;
  final String nome;
  final String email;
  final String? telefone;
  final String? sexo;
  final DateTime? dataNascimento;
  final String? cpf;
  final String? endereco;
  final String? cidade;
  final String? estado;
  final String? cep;
  final String? fotoPerfil;
  final DateTime? dataCadastro;
  final DateTime? dataAtualizacao;
  final bool? ativo;

  Usuario({
    this.id,
    required this.nome,
    required this.email,
    this.telefone,
    this.sexo,
    this.dataNascimento,
    this.cpf,
    this.endereco,
    this.cidade,
    this.estado,
    this.cep,
    this.fotoPerfil,
    this.dataCadastro,
    this.dataAtualizacao,
    this.ativo,
  });

  @override
  String toString() {
    return 'Usuario(id: $id, nome: $nome, email: $email, telefone: $telefone, sexo: $sexo, dataNascimento: $dataNascimento, cpf: $cpf, endereco: $endereco, cidade: $cidade, estado: $estado, cep: $cep, fotoPerfil: $fotoPerfil, dataCadastro: $dataCadastro, dataAtualizacao: $dataAtualizacao, ativo: $ativo)';
  }
}
