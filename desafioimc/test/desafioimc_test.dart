import 'package:test/test.dart';
import '../bin/desafioimc.dart';

void main() {
  test('Teste de cálculo de IMC', () {
    final pessoa = Pessoa('Carlos', 80, 1.82);

    final imc = pessoa.calcularIMC();

    expect(imc, closeTo(24.15, 0.01));
  });
}
