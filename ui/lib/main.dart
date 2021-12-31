import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() {
  runApp(MaterialApp(title: 'webcrawller', home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<MyApp> {
  // This widget is the root of your application.
  List<Widget> listImages = [];

  @override
  Widget build(BuildContext context) {
    debugPrint(">>>>>>>>>>>>> teste wid >>>>>>>>>>>>>");

    return Scaffold(
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
                onPressed: () {
                  debugPrint(">>>>>>>>>>>>> press teste >>>>>>>>>>>>>");

                  listImages.add(GestureDetector(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: 'https://picsum.photos/250?image=9',
                    ),
                    onTap: () => showMaterialModalBottomSheet(
                      expand: false,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => Material(
                          child: SafeArea(
                        top: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: Text('Save'),
                              leading: Icon(Icons.save_alt),
                              onTap: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ));
                  debugPrint(" >>>>>>> lista tamanho ${listImages.length}");
                  setState(() {});
                },
              ),
            ],
          )),
          Container(
              height: 250,
              padding: const EdgeInsets.all(5),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listImages.length,
                itemBuilder: (BuildContext ctx, int index) {
                  debugPrint(">>>>>>>>>>>>> teste >>>>>>>>>>>>>${index}");

                  return listImages[index];
                },
              ))
        ],
      ),
    );
  }
}
