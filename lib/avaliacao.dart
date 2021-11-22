import 'package:flutter/material.dart';
import 'package:flutter_application/questao.dart';

class Avaliacao {
  List<Questao> questoes;
  Avaliacao({
    @required this.questoes,
  });

  //Polimorfismo
  void adicionadaQuestao(Questao questao, [bool noInicio]) {
    if (noInicio) {
      var novaLista = <Questao>[questao];
      novaLista.addAll(questoes);
      this.questoes = novaLista;
    } else {
      questoes.add(questao);
    }
  }

  void adicionarQuestao({@required String pergunta, bool resposta}) {
    questoes.add(Questao(pergunta: pergunta, resposta: resposta));
  }
}
