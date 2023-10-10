import 'package:flutter/material.dart';
import 'package:tester/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        'nextpage': (ctx) => const SecondPage(
              title: 'T',
              message: 'M',
            )
      },
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Teste_transição_tela"),
          ),
          body: const BodyTest()),
    );
  }
}

class BodyTest extends StatelessWidget {
  const BodyTest({super.key});

  @override
  build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Clique no botão abaixo para navegar."),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('nextpage');
              },
              child: const Text("Avançar"))
        ],
      ),
    );
  }
}
