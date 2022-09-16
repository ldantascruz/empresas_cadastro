import 'package:empresas_cadastro/pessoa.dart';
import 'package:empresas_cadastro/pessoa_juridica.dart';
import 'package:uuid/uuid.dart';

class Empresa extends PessoaJuridica {
  final _id = Uuid().v4();
  final String telefone;
  final _dataCadastro = DateTime.now();
  Pessoa socio;

  Empresa({
    required super.nome,
    required super.nomeFantasia,
    required super.numeroCadastro,
    required super.logradouro,
    required super.numero,
    required super.complemento,
    required super.bairro,
    required super.cidade,
    required super.estado,
    required super.cep,
    required this.telefone,
    required this.socio,
  });

  String get id => _id;

  DateTime get dataCadastro => _dataCadastro;

  String get telefoneFormatado {
    String stringTelefone = telefone.toString();
    return '(${stringTelefone.substring(0, 2)})${stringTelefone.substring(2, 7)}-${stringTelefone.substring(7)}';
  }

  String get conteudo {
    return '''
    ID: $id
    Cadastro: $dataCadastro
    CNPJ: $numeroCadastroFormatado
    Razão Social: $razaoSocial
    Nome Fantasia: $nomeFantasia
    Telefone: $telefoneFormatado
    Endereço: $endereco
    Sócio: ${socio.tipo}
    CPF/CNPJ: ${socio.numeroCadastroFormatado}
    Nome/Razão Social: ${socio.nome}
    Endereço: ${socio.endereco}
    ''';
  }
}
