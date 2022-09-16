import 'dart:io';
import 'package:empresas_cadastro/empresa.dart';
import 'package:empresas_cadastro/pessoa_fisica.dart';
import 'package:empresas_cadastro/pessoa_juridica.dart';

class RegistroEmpresas {
  List<Empresa> empresas = [];

  void executar() {
    print(
        'Bem vindo ao Sistema de registro de empresas! Para continuar escolha uma das opções abaixo:');

    int escolha = 0;
    do {
      print(
          '\n 1. Cadastrar uma nova empresa;\n 2. Buscar Empresa cadastrada por CNPJ;\n 3. Buscar Empresa por CPF do Sócio; \n 4. Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social);\n 5. Excluir uma empresa (por ID);\n 6. Sair.');

      escolha = _escolhaTrataErro();

      switch (escolha) {
        case 1:
          _cadastrar();
          break;
        case 2:
          _buscar();
          break;
        case 3:
          _buscarSocio();
          break;
        case 4:
          _empresasCadastradas();
          break;
        case 5:
          _excluirEmpresa();
          break;
      }
    } while (escolha != 6);
  }

  //Trata erro escolha
  int _escolhaTrataErro() {
    int? escolha = int.tryParse(stdin.readLineSync()!);

    while (escolha == null) {
      print(
          'Valor inválido. Por favor escolha um número válido de acordo com o apresentado acima (apenas números): ');

      escolha = int.tryParse(stdin.readLineSync()!);
    }
    return escolha;
  }

  //Trata erro escolha(String)
  String _stringTrataErro() {
    String? string = stdin.readLineSync();

    while (string == null || string == '') {
      stdout.write('Valor inválido. Por favor, informe novamente:');

      string = stdin.readLineSync();
    }
    return string;
  }

  //Trata erro escolha(int)
  int _intTrataErro() {
    int? num = int.tryParse(stdin.readLineSync()!);

    while (num == null) {
      stdout.write(
          'Valor inválido. Por iforme o número corretamente (apenas número): ');

      num = int.tryParse(stdin.readLineSync()!);
    }

    return num;
  }

  //Trata erro telefone
  String _intTrataTel() {
    int? num = int.tryParse(stdin.readLineSync()!);

    while (num == null) {
      print(
          'Valor inválido. Por iforme o número corretamente (apenas número): ');

      num = int.tryParse(stdin.readLineSync()!);
    }

    return num.toString();
  }

  //Trata erro sócio
  int _intSocio() {
    int? num = int.tryParse(stdin.readLineSync()!);

    while (num != 1 && num != 2 || num == null) {
      stdout.write(
          'Opção inválida. O sócio da empresa é Pessoa Física(1) ou Pessoa Jurídica(2)? (Informe apenas o número): ');

      num = int.tryParse(stdin.readLineSync()!);
    }
    return num;
  }

  //Veririfica CNPJ/CPF
  String _verificaCadastro() {
    String? cnpj = (stdin.readLineSync()!);

    int? cnpjInt = int.tryParse(cnpj);

    while (cnpjInt == null) {
      print(
          'Valor inválido. Por favor, informe o número do CNPJ/CPF corretamente (apenas números): ');

      cnpj = (stdin.readLineSync()!);
      cnpjInt = int.tryParse(cnpj);
    }

    return cnpj.toString();
  }

  //Veririfica CEP
  String _verificaCEP() {
    int? cep = int.tryParse(stdin.readLineSync()!);

    while (cep == null) {
      print(
          'Valor inválido. Por favor, informe o número do CEP corretamente (apenas números): ');

      cep = int.tryParse(stdin.readLineSync()!);
    }

    return cep.toString();
  }

  //1. Cadastrar
  void _cadastrar() {
    //Razão Social
    stdout.write('Por favor, informe a razão social da empresa: ');
    String razaoSocial = _stringTrataErro();

    //Nome Fantasia
    stdout.write('Por favor, informe o nome fantasia da empresa: ');
    String nomeFantasia = _stringTrataErro();

    // CNPJ
    stdout.write('Por favor, informe o número do CNPJ(apenas número): ');
    String cnpj = _verificaCadastro();

    //Logradouro
    stdout.write('Por favor, informe o nome do logradouro: ');
    String logradouro = _stringTrataErro();

    //Numero
    stdout.write('Por favor, informe o número do endereço: ');
    int numero = _intTrataErro();

    //Complemento
    stdout.write('Por favor, informe o complemento do endereço: ');
    String complemento = _stringTrataErro();

    //Bairro
    stdout.write('Por favor, informe o bairro: ');
    String bairro = _stringTrataErro();

    //Cidade
    stdout.write('Por favor, informe a cidade: ');
    String cidade = _stringTrataErro();

    //estado
    stdout.write('Por favor, informe o estado: ');
    String estado = _stringTrataErro();

    //CEP
    stdout.write('Por favor, informe o CEP (somente números): ');
    String cep = _verificaCEP();

    //Telefone
    stdout.write('Por favor, informe o telefone (somente números): ');
    String telefone = _intTrataTel();

    //Sócio
    socio() {
      stdout.write(
          'O sócio da empresa é Pessoa Física(1) ou Pessoa Jurídica(2)? (Informe apenas o número): ');
      int pessoa = _intSocio();

      if (pessoa == 1) {
        //Nome
        stdout.write('Por favor, informe o nome do Sócio: ');
        String nome = _stringTrataErro();

        //CPF
        stdout.write('Por favor, informe o CPF: ');
        String cpf = _verificaCadastro();

        //Logradouro
        stdout.write('Por favor, informe o nome do logradouro: ');
        String logradouroPF = _stringTrataErro();

        //Numero
        stdout.write('Por favor, informe o número do endereço: ');
        int numeroPF = _intTrataErro();

        //Complemento
        stdout.write('Por favor, informe o complemento do endereço: ');
        String complementoPF = _stringTrataErro();

        //Bairro
        stdout.write('Por favor, informe o bairro: ');
        String bairroPF = _stringTrataErro();

        //Cidade
        stdout.write('Por favor, informe a cidade: ');
        String cidade = _stringTrataErro();

        //estado
        stdout.write('Por favor, informe o estado: ');
        String estadoPF = _stringTrataErro();

        //CEP
        stdout.write('Por favor, informe o CEP (somente números): ');
        String cepPF = _verificaCEP();

        return PessoaFisica(
          nome: nome,
          numeroCadastro: cpf,
          logradouro: logradouroPF,
          numero: numeroPF,
          complemento: complementoPF,
          cidade: cidade,
          bairro: bairroPF,
          estado: estadoPF,
          cep: cepPF,
        );
      } else {
        //Razão Social
        stdout.write('Por favor, informe a razão social da empresa: ');
        String razaoSocialPJ = _stringTrataErro();

        //Nome Fantasia
        stdout.write('Por favor, informe o nome fantasia da empresa: ');
        String nomeFantasiaPJ = _stringTrataErro();

        // CNPJ
        stdout.write('Por favor, informe o número do CNPJ(apenas número): ');
        String cnpjPJ = _verificaCadastro();

        //Logradouro
        stdout.write('Por favor, informe o nome do logradouro: ');
        String logradouroPJ = _stringTrataErro();

        //Numero
        stdout.write('Por favor, informe o número do endereço: ');
        int numeroPJ = _intTrataErro();

        //Complemento
        stdout.write('Por favor, informe o complemento do endereço: ');
        String complementoPJ = _stringTrataErro();

        //Bairro
        stdout.write('Por favor, informe o bairro: ');
        String bairroPJ = _stringTrataErro();

        //Cidade
        stdout.write('Por favor, informe a cidade: ');
        String cidadePJ = _stringTrataErro();

        //estado
        stdout.write('Por favor, informe o estado: ');
        String estadoPJ = _stringTrataErro();

        //CEP
        stdout.write('Por favor, informe o CEP(somente números): ');
        String cepPJ = _verificaCEP();

        return PessoaJuridica(
          nome: razaoSocialPJ,
          nomeFantasia: nomeFantasiaPJ,
          numeroCadastro: cnpjPJ,
          logradouro: logradouroPJ,
          numero: numeroPJ,
          complemento: complementoPJ,
          bairro: bairroPJ,
          cidade: cidadePJ,
          estado: estadoPJ,
          cep: cepPJ,
        );
      }
    }

    final empresa = Empresa(
      nome: razaoSocial,
      nomeFantasia: nomeFantasia,
      numeroCadastro: cnpj,
      logradouro: logradouro,
      numero: numero,
      complemento: complemento,
      bairro: bairro,
      cidade: cidade,
      estado: estado,
      cep: cep,
      telefone: telefone,
      socio: socio(),
    );

    empresas.add(empresa);

    print('\nEmpresa ${empresa.razaoSocial} cadastrada com sucesso!');
  }

  //2. Busca Empresa(CNPJ)
  void _buscar() {
    stdout.write(
        'Informe o número do CNPJ da empresa para consulta (somente números): ');
    final String cnpj = _verificaCadastro();

    final verificaCNPJ = empresas.where((empresa) => empresa.cnpj == cnpj);

    if (verificaCNPJ.toString() == '()') {
      print('CNPJ não encontrado!');
    } else {
      print(verificaCNPJ.elementAt(0).conteudo);
    }
  }

  //3. Busca Empresa(CNPJ/CPF sócio)
  void _buscarSocio() {
    stdout.write(
        'Informe o número do CNPJ ou do CPF do sócio da empresa (somente números): ');

    final String numeroCadastro = _verificaCadastro();

    final verificaCadastro = empresas
        .where((empresa) => empresa.socio.numeroCadastro == numeroCadastro);

    if (verificaCadastro.toString() == '()') {
      print('CNPJ ou CPF não encontrado!');
    } else {
      print(verificaCadastro.elementAt(0).conteudo);
    }
  }

  //4. Lista empresas cadastradas
  void _empresasCadastradas() {
    if (empresas.isEmpty) {
      print('Não existem empresas Registradas. Registre uma empresa primeiro.');
    } else {
      print('Lista de empresas:');
      empresas.sort(((a, b) => a.razaoSocial.compareTo(b.razaoSocial)));

      var i = 1;
      for (var empresa in empresas) {
        print(
            '$i. Razão Social: ${empresa.razaoSocial} - CNPJ: ${empresa.numeroCadastroFormatado}');
        i++;
      }
    }
  }

  //5. Excluir uma empresa (por ID)
  void _excluirEmpresa() {
    stdout.write('Informe o número do ID da empresa a ser excluída: ');

    final String inputID = _stringTrataErro();

    String nomeEmpresaRemovida = empresas
        .where((empresa) => empresa.id == inputID)
        .map((atributos) =>
            '${atributos.razaoSocial} - CNPJ: ${atributos.numeroCadastroFormatado}.')
        .toString();

    String empresaID =
        empresas.where((empresa) => empresa.id == inputID).toList().first.id;

    if (empresaID == inputID) {
      empresas.removeWhere((empresa) => empresa.id == inputID);
      print('Empresa $nomeEmpresaRemovida removida com sucesso!');
    } else {
      print('Empresa com ID: $inputID não encontrada');
    }
  }
}
