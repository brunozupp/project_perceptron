import 'package:project_perceptron/perceptron/perceptron_model.dart';
import 'package:project_perceptron/perceptron/perceptron_treinamento_model.dart';

abstract class UI {

  static void resultado(PerceptronModel model) {

    print('Quantidade de treinamento necessário = ${model.treinamentos.length}\n');

    if(model.treinamentoAtual.correto) {
      print('RESULTADO = CORRETO');

      resultadoPositivo(model.treinamentoAtual);

    } else {
      print('RESULTADO = INCORRETO');
    }
  }

  static void resultadoPositivo(PerceptronTreinamentoModel model) {
    print('Valor do u(potencial de ativação) que atendeu = ${model.potencialDeAtivacao}');

    var pesos = model.pesos.map((peso) => peso.toString());
    print('Pesos utilizados = $pesos');
  }
  
  static void historico(List<PerceptronTreinamentoModel> treinamentos) {
    
    for (var i = 0; i < treinamentos.length; i++) {

      var treinamento = treinamentos[i];

      print('Treinamento ${i + 1} ------------------');
      print('RESULTADO = ' + (treinamento.correto ? 'CORRETO' : 'INCORRETO'));

      print('Valor do u(potencial de ativação) = ${treinamento.potencialDeAtivacao}');

      var pesos = treinamento.pesos.map((peso) => peso.toString());
      print('Pesos utilizados = $pesos\n');
    }

  }

  static void resultadoNegativo() {

    
  }
}