import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('web crawller'),
        ),
        body: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'url'),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'nome das imagens '),
            ),
            TextButton(
              child: const Text("runner"),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.blueAccent,
                textStyle: const TextStyle(fontSize: 30),
              ),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
