import 'package:estudo_flutter_basico/questao.dart';
import 'package:flutter/cupertino.dart';

class Avalicacao {
  late List<Questao> _questoes;

  Avalicacao() {
    _questoes = [];
  }

  void addQuestao(Questao? questao, {bool? resposta}) {
    questao!.setResposta(resposta ?? false);
    _questoes.add(questao);
  }

  Future<void> processarResultado() async {
    try {
      debugPrint('Processando...');
      await Future.delayed(const Duration(seconds: 5));
      throw Exception('Não acabou ainda...');
    } catch (e) {
      rethrow;
    }
  }
}
