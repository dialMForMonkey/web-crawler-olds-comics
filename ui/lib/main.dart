import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'dart:ffi' as ffi;
import 'dart:io' show Directory;

import 'package:path/path.dart' as path;

typedef CrallerFunc = ffi.Void Function();
typedef Craller = void Function();
String libraryPath = "";

void main() {
  libraryPath = path.join(Directory.current.path, '../crawler', 'lib.a');
  runApp(MaterialApp(title: 'webcrawller', home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<MyApp> {
  // This widget is the root of your application.
  List<ImageHandler> listImages = [];

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
                child: const Text("call go"),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.blueAccent,
                  textStyle: const TextStyle(fontSize: 30),
                ),
                onPressed: () {
                  final dylib = ffi.DynamicLibrary.open(libraryPath);

                  // Look up the C function 'hello_world'
                  final Craller tprint = dylib
                      .lookup<ffi.NativeFunction<CrallerFunc>>('Print')
                      .asFunction();

                  tprint();
                },
              ),
              TextButton(
                child: const Text("runner"),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.blueAccent,
                  textStyle: const TextStyle(fontSize: 30),
                ),
                onPressed: () {
                  ImageHandler image = ImageHandler(
                      'https://picsum.photos/250?image=${listImages.length}');

                  listImages.add(image);
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
                  return listImages[index]
                      .widgetImage(ctx, setState, listImages);
                },
              ))
        ],
      ),
    );
  }
}

class ImageHandler {
  String url;
  ImageHandler(this.url);
  String getUrl() => url;

  GestureDetector widgetImage(
          BuildContext ctx,
          void Function(void Function()) forceSetState,
          List<ImageHandler> list) =>
      GestureDetector(
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: url,
        ),
        onTap: () {
          showMaterialModalBottomSheet(
            expand: false,
            context: ctx,
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
                    onTap: () {
                      list.removeWhere((image) {
                        debugPrint(">>>>>>>>>>>>> $url >>>>>>>>>>>>>");
                        debugPrint(
                            ">>>>>>>>>>>>> ${image.getUrl()} >>>>>>>>>>>>>");
                        debugPrint(
                            ">>>>>>>>>>>>> condicao ${image.getUrl() != url} >>>>>>>>>>>>>");

                        return image.getUrl() == url;
                      });
                      forceSetState(() {});
                      return Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            )),
          );
        },
      );
}
