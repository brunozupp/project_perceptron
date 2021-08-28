// x1, x2, x3 -> entradas
// w -> pesos
import 'package:project_perceptron/perceptron/perceptron_model.dart';
import 'package:project_perceptron/perceptron/perceptron_treinamento_model.dart';
import 'package:project_perceptron/util/UI.dart';

// BIAS -> constante de -1

abstract class Perceptron {

  static const double BIAS = -1;

  static void executar() {

    var model = PerceptronModel(
      saidaDesejada: -1, 
      taxaDeAprendizagem: 0.05,
      treinamentoInicial: PerceptronTreinamentoModel(
        entradas: <double>[BIAS, 0.1, 0.4, 0.7],
        pesos: <double>[0.34, -0.23, 0.94, 0.05]
      ),
      funcaoDeAtivacao: (potencialDeAtivacao) {
        if(potencialDeAtivacao >= 0) {
          return 1;
        }

        return -1;
      }
    );

    try {
      model.treinar();
      //UI.resultado(model);

      UI.historico(model.treinamentos);

    } catch (e) {
      print(e);
    }
  }

}