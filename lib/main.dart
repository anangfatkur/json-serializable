// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Future<String?> getDataUser() async {
    Uri url = Uri.parse("https://reqres.in/api/users/2");
    var response = await http.get(url);

    print(response.statusCode);

    if (response.statusCode != 200) {
      print("Data Tidak Ditemukan");
      return null;
    } else {
      print(response.body);
      return response.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan Json Serializable"),
      ),
      body: FutureBuilder<String?>(
        future: getDataUser(),
        builder: (context, snapshot) {
          return Text("${snapshot.data}");
        },
      ),
    );
  }
}
