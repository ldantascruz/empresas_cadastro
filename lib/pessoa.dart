abstract class Pessoa {
  final String nome;
  final String numeroCadastro;
  final String logradouro;
  final int numero;
  final String? complemento;
  final String bairro;
  final String cidade;
  final String estado;
  final String cep;

  Pessoa({
    required this.nome,
    required this.numeroCadastro,
    required this.logradouro,
    required this.numero,
    this.complemento,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.cep,
  });

  String get tipo => tipo;

  String get _cepFormatado => '${cep.substring(0, 5)}-${cep.substring(5)}';

  String get endereco =>
      '$logradouro, $numero, $bairro, $cidade/$estado, $_cepFormatado';

  String get numeroCadastroFormatado => numeroCadastro;
}
