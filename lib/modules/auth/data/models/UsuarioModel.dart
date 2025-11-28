import '../../domain/entities/Usuario.dart';
import '../../../../shared/utils/parse.dart';

class UsuarioModel extends Usuario {
  UsuarioModel({
    super.id,
    required super.nome,
    required super.email,
    super.telefone,
    super.sexo,
    super.dataNascimento,
    super.cpf,
    super.endereco,
    super.cidade,
    super.estado,
    super.cep,
    super.fotoPerfil,
    super.dataCadastro,
    super.dataAtualizacao,
    super.ativo,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      id: json['id'] as String?,
      nome: json['nome'] as String,
      email: json['email'] as String,
      telefone: json['telefone'] as String?,
      sexo: json['sexo'] as String?,
      dataNascimento: json['dataNascimento'] != null
          ? parseDateTime(json['dataNascimento'] as String)
          : null,
      cpf: json['cpf'] as String?,
      endereco: json['endereco'] as String?,
      cidade: json['cidade'] as String?,
      estado: json['estado'] as String?,
      cep: json['cep'] as String?,
      fotoPerfil: json['fotoPerfil'] as String?,
      dataCadastro: json['dataCadastro'] != null
          ? parseDateTime(json['dataCadastro'] as String)
          : null,
      dataAtualizacao: json['dataAtualizacao'] != null
          ? parseDateTime(json['dataAtualizacao'] as String)
          : null,
      ativo: json['ativo'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nome': nome,
      'email': email,
      if (telefone != null) 'telefone': telefone,
      if (sexo != null) 'sexo': sexo,
      if (dataNascimento != null)
        'dataNascimento': dataNascimento!.toIso8601String(),
      if (cpf != null) 'cpf': cpf,
      if (endereco != null) 'endereco': endereco,
      if (cidade != null) 'cidade': cidade,
      if (estado != null) 'estado': estado,
      if (cep != null) 'cep': cep,
      if (fotoPerfil != null) 'fotoPerfil': fotoPerfil,
      if (dataCadastro != null) 'dataCadastro': dataCadastro!.toIso8601String(),
      if (dataAtualizacao != null)
        'dataAtualizacao': dataAtualizacao!.toIso8601String(),
      if (ativo != null) 'ativo': ativo,
    };
  }

  factory UsuarioModel.fromEntity(Usuario usuario) {
    return UsuarioModel(
      id: usuario.id,
      nome: usuario.nome,
      email: usuario.email,
      telefone: usuario.telefone,
      sexo: usuario.sexo,
      dataNascimento: usuario.dataNascimento,
      cpf: usuario.cpf,
      endereco: usuario.endereco,
      cidade: usuario.cidade,
      estado: usuario.estado,
      cep: usuario.cep,
      fotoPerfil: usuario.fotoPerfil,
      dataCadastro: usuario.dataCadastro,
      dataAtualizacao: usuario.dataAtualizacao,
      ativo: usuario.ativo,
    );
  }

  UsuarioModel copyWith({
    String? id,
    String? nome,
    String? email,
    String? telefone,
    String? sexo,
    DateTime? dataNascimento,
    String? cpf,
    String? endereco,
    String? cidade,
    String? estado,
    String? cep,
    String? fotoPerfil,
    DateTime? dataCadastro,
    DateTime? dataAtualizacao,
    bool? ativo,
  }) {
    return UsuarioModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
      sexo: sexo ?? this.sexo,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      cpf: cpf ?? this.cpf,
      endereco: endereco ?? this.endereco,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
      cep: cep ?? this.cep,
      fotoPerfil: fotoPerfil ?? this.fotoPerfil,
      dataCadastro: dataCadastro ?? this.dataCadastro,
      dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
      ativo: ativo ?? this.ativo,
    );
  }
}
