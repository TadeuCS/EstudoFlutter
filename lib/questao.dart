import 'package:flutter/material.dart';

class Questao {
  String pergunta;
  bool resposta;
  bool _ativa = true;
  Questao({@required this.pergunta, this.resposta = false});

  set ativa(bool novo) => this._ativa = novo;

  bool get ativa => _ativa;

  @override
  String toString() {
    return '$pergunta: ${resposta ? 'Verdeiro' : 'Falso'}';
  }
}
