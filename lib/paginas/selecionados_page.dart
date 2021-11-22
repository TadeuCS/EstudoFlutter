import 'package:estudo_flutter_basico/model/usuario.dart';
import 'package:flutter/material.dart';

class SelecionadosPage extends StatelessWidget {
  final List<Usuario> usuariosSelecionados;
  const SelecionadosPage(this.usuariosSelecionados, {Key? key})
      : super(key: key);

  Future<void> loading() async {
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loading(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return ContentSelecionados(
              usuariosSelecionados: usuariosSelecionados);
        } else {
          return const SizedBox(
            child: Text('Error'),
          );
        }
      },
    );
  }
}

class ContentSelecionados extends StatelessWidget {
  ContentSelecionados({
    Key? key,
    required this.usuariosSelecionados,
  }) : super(key: key);

  final List<Usuario> usuariosSelecionados;
  final scaffouldKey = GlobalKey<ScaffoldState>();

  AlertDialog showAlert(BuildContext context) {
    return AlertDialog(
      title: const Text("My title"),
      content: const Text("This is my message."),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Fechar')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffouldKey,
      appBar: AppBar(
        title: const Text(
          'Selecionados',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: usuariosSelecionados.length,
                itemBuilder: (_, index) {
                  var item = usuariosSelecionados[index];
                  return Card(
                    child: Text(item.nome),
                    color: Colors.green,
                    elevation: 2,
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (context) => showAlert(context));
                      },
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('A SnackBar has been shown.'),
                          ),
                        );
                      },
                      child: const Text('Notificar'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Voltar'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // body: Stack(
      //   children: [
      //     Container(
      //       decoration: BoxDecoration(
      //         image: DecorationImage(
      //           image: NetworkImage(
      //               'https://1.bp.blogspot.com/-rOFMtLgTI24/XPgkpKbZewI/AAAAAAAACgc/bSvf6P4WaOo_aTMJMUyp0lyaTmIewN26QCEwYBhgL/s1600/ice.png'),
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //     ),
      //     Center(
      //       child: Container(
      //         padding: const EdgeInsets.all(20),
      //         child: TextField(
      //           style: TextStyle(color: Colors.white),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
