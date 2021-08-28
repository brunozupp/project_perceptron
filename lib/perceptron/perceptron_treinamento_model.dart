class PerceptronTreinamentoModel {

  final List<double> entradas;
  final List<double> pesos;

  late bool correto;

  late double potencialDeAtivacao;

  PerceptronTreinamentoModel({
    required this.entradas, 
    required this.pesos
  }) {
    potencialDeAtivacao = _calcularPotencialDeAtivacao(entradas, pesos);
  }

  static double _calcularPotencialDeAtivacao(List<double> entradas, List<double> pesos) {
      
    var soma = 0.0;
    
    for(var i = 0; i < entradas.length; i++) {
      soma += (entradas[i] * pesos[i]);
    }

    return soma;
  }
}