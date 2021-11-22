import 'package:flutter/material.dart';
import 'package:flutter_application/questao.dart';

class QuestaoCorreta extends Questao {
  QuestaoCorreta({@required pergunta})
      : super(
          pergunta: pergunta,
          resposta: true,
        );
}
