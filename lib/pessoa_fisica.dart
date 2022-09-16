import 'package:empresas_cadastro/pessoa.dart';

class PessoaFisica extends Pessoa {
  PessoaFisica({
    required super.nome,
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
  String get tipo => 'Pessoa Física';

  @override
  String get numeroCadastroFormatado =>
      '${super.numeroCadastroFormatado.substring(0, 3)}.${super.numeroCadastroFormatado.substring(3, 6)}.${super.numeroCadastroFormatado.substring(6, 9)}-${super.numeroCadastroFormatado.substring(9)}';
}
