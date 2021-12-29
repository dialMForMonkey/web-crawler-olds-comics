import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

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
            Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'url'),
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'name imagens'),
                ),
                TextButton(
                  child: const Text("runner"),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.blueAccent,
                    textStyle: const TextStyle(fontSize: 30),
                  ),
                  onPressed: () {},
                ),
              ],
            )),
            Container(
                height: 250,
                padding: const EdgeInsets.all(5),
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: 'https://picsum.photos/250?image=9',
                      ),
                      FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: 'https://picsum.photos/250?image=9',
                      ),
                      FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: 'https://picsum.photos/250?image=9',
                      ),
                      FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: 'https://picsum.photos/250?image=9',
                      ),
                      FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: 'https://picsum.photos/250?image=9',
                      ),
                      FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: 'https://picsum.photos/250?image=9',
                      ),
                      FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: 'https://picsum.photos/250?image=9',
                      ),
                      FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: 'https://picsum.photos/250?image=9',
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
