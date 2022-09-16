import 'package:empresas_cadastro/pessoa.dart';

class PessoaJuridica extends Pessoa {
  final String nomeFantasia;

  PessoaJuridica({
    required super.nome,
    required this.nomeFantasia,
    required super.numeroCadastro,
    required super.logradouro,
    required super.numero,
    super.complemento,
    required super.bairro,
    required super.cidade,
    required super.estado,
    required super.cep,
  });

  @override
  String get tipo => 'Pessoa Jurídica';

  String get razaoSocial => super.nome;

  String get cnpj => super.numeroCadastro;

  @override
  String get numeroCadastroFormatado =>
      '${super.numeroCadastroFormatado.substring(0, 2)}.${super.numeroCadastroFormatado.substring(2, 5)}.${super.numeroCadastroFormatado.substring(5, 8)}/${super.numeroCadastroFormatado.substring(8, 12)}-${super.numeroCadastroFormatado.substring(12)}';
}
