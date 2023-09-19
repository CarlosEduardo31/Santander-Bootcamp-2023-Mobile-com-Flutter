import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);

  double calcularIMC() {
    if (altura <= 0 || peso <= 0) {
      throw Exception("Altura e peso devem ser maiores que zero.");
    }

    return peso / (altura * altura);
  }

  String interpretarIMC(double imc) {
    if (imc < 16) {
      return "Magreza grave";
    } else if (imc < 17) {
      return "Magreza Moderada";
    } else if (imc < 18.5) {
      return "Magreza Leve";
    } else if (imc < 25) {
      return "Saudável";
    } else if (imc < 30) {
      return "Sobrepeso";
    } else if (imc < 35) {
      return "Obesidade Grau 1";
    } else if (imc < 40) {
      return "Obesidade Grau 2";
    } else {
      return "Obesidade Grau 3";
    }
  }
}

void main() {
  try {
    print("Digite o nome: ");
    String nome = stdin.readLineSync()!;

    print("Digite o peso (em kg): ");
    String pesoInput = stdin.readLineSync()!;
    if (!isNumeric(pesoInput)) {
      throw Exception("O peso deve ser um número válido.");
    }
    double peso = double.parse(pesoInput);

    print("Digite a altura (em metros): ");
    String alturaInput = stdin.readLineSync()!;
    if (!isNumeric(alturaInput)) {
      throw Exception("A altura deve ser um número válido.");
    }
    double altura = double.parse(alturaInput);

    Pessoa pessoa = Pessoa(nome, peso, altura);
    double imc = pessoa.calcularIMC();
    String classificacaoIMC = pessoa.interpretarIMC(imc);

    print("Nome: ${pessoa.nome}");
    print("IMC: $imc");
    print("Classificação: $classificacaoIMC");
  } catch (e) {
    print("Ocorreu um erro: $e");
  }
}

bool isNumeric(String input) {
  // Verifica se a string pode ser convertida para um número.
  return double.tryParse(input) != null;
}
