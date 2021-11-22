class Questao {
  String? pergunta;
  bool? verdadeiroFalso;
  late bool _resposta;

  Questao({required this.pergunta, required this.verdadeiroFalso});

  void setResposta(bool resposta) => _resposta = resposta;

  bool getResposta() => _resposta;

  @override
  String toString() {
    return '$pergunta $verdadeiroFalso';
  }
}
