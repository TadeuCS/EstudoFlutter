import 'package:estudo_flutter_basico/model/usuario.dart';
import 'package:estudo_flutter_basico/paginas/selecionados_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white70),
          backgroundColor: Colors.purple[900],
        ),
        iconTheme: IconThemeData(
          color: Colors.purple[900],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              primary: Colors.purple[900],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
        ),
      ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   /* dark theme settings */
      // ),
      // themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var lista = [
    Usuario(nome: 'Tadeu Caixeta Sousa Silva de Carvalho e etc'),
    Usuario(nome: 'Marvin'),
    Usuario(nome: 'Lucas'),
    Usuario(nome: 'Sergio'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina Principal'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                debugPrint('Notificações');
              },
              icon: const Icon(Icons.notifications))
        ],
      ),
      drawer: Drawer(
        child: Container(),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (_, index) {
                    var item = lista[index];
                    return ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: TextButton(
                          onPressed: () {
                            debugPrint(item.nome);
                          },
                          child: Row(
                            children: [
                              const Text('Nome: '),
                              Flexible(
                                child: Text(
                                  item.nome,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )),
                      trailing: Checkbox(
                          value: item.selecionado,
                          onChanged: (checked) {
                            setState(() {
                              item.selecionado = checked ?? false;
                            });
                          }),
                    );
                  }),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      var usuariosSelecionados =
                          lista.where((item) => item.selecionado).toList();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                SelecionadosPage(usuariosSelecionados)),
                      );
                    },
                    child: const Text('Confirmar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     var usuariosSelecionados =
      //         lista.where((item) => item.selecionado).toList();
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (_) => SelecionadosPage(usuariosSelecionados)),
      //     );
      //   },
      //   tooltip: 'Salvar',
      //   child: const Icon(Icons.save),
      // ),
    );
  }
}
