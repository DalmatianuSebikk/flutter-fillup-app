import 'package:carList/models/fill-up-model.dart';
import 'package:carList/pages/fill-up-page-add.dart';
import 'package:carList/pages/fill-up-page-list.dart';
import 'package:carList/services/fill-up-data.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() {
  Hive.registerAdapter(FillUpModelAdapter());
  runApp(MyApp());
}

Future _initHive() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path.toString());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FillUpData(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          routes: {
            "/": (context) => FutureBuilder(
                future: _initHive(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.error != null) {
                      print(snapshot.error);
                      return Scaffold(
                        body: Center(child: Text("Eroare stabilire conexiune")),
                      );
                    } else {
                      return FillUpPageList();
                    }
                  } else {
                    return Scaffold();
                  }
                }),
            "/addFillUp": (context) => FillUpAdd(),
          }),
    );
  }
}
