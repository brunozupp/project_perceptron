import 'package:project_perceptron/perceptron/perceptron_treinamento_model.dart';

class PerceptronModel {

  final int saidaDesejada;
  final double taxaDeAprendizagem;
  final int Function(double potencialDeAtivacao) funcaoDeAtivacao;

  late PerceptronTreinamentoModel treinamentoAtual;

  // Vai servir para um histórico
  final List<PerceptronTreinamentoModel> _treinamentos = List.empty(growable: true);
  List<PerceptronTreinamentoModel> get treinamentos => _treinamentos;

  PerceptronModel({
    required this.saidaDesejada, 
    required this.taxaDeAprendizagem,
    required this.funcaoDeAtivacao,
    required PerceptronTreinamentoModel treinamentoInicial
  }) {
    _addTreinamento(treinamentoInicial);
  }

  void _addTreinamento(PerceptronTreinamentoModel treinamento) {
    treinamentoAtual = treinamento;
    _treinamentos.add(treinamento);
  }

  void treinar() {

    var saida = funcaoDeAtivacao(treinamentoAtual.potencialDeAtivacao);
    
    if(saida != saidaDesejada) {

      treinamentoAtual.correto = false;

      var novoTreinamento = _recalcular(saida);
      _addTreinamento(novoTreinamento);

      treinar();
    } else {
      treinamentoAtual.correto = true;
    }
  }

  // saida = y
  PerceptronTreinamentoModel _recalcular(int saidaAtual) {

    // Want + (taxaDeAprendizagem * n * (d - y) * x)

    // (d - y)
    var diferencaSaidaAtualSaidaDesejada = saidaDesejada - saidaAtual;

    // n * diferencaSaidaAtualSaidaDesejada
    var diferencaTaxaDeAprendizagemSaida = taxaDeAprendizagem * diferencaSaidaAtualSaidaDesejada;

    var entradas = List.of(treinamentoAtual.entradas);

    // diferencaTaxaDeAprendizagemSaida * x
    for(var i = 0; i < entradas.length; i++) {
      entradas[i] = entradas[i] * diferencaTaxaDeAprendizagemSaida;
    }

    var pesosAntigos = List.of(treinamentoAtual.pesos);

    var pesosNovos = List<double>.empty(growable: true);

    // entradaMultiplicada + Want
    for(var i = 0; i < entradas.length; i++) {
      pesosNovos.add(entradas[i] + pesosAntigos[i]);
    }

    return PerceptronTreinamentoModel(
      entradas: List.of(treinamentoAtual.entradas), 
      pesos: pesosNovos
    );
  }
}