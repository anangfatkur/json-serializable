// ignore_for_file: avoid_print

import 'dart:convert';

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

  Future<Map<String, dynamic>?> getDataUser() async {
    Uri url = Uri.parse("https://reqres.in/api/users/2");
    var response = await http.get(url);

    print(response.statusCode);

    if (response.statusCode != 200) {
      print("Data Tidak Ditemukan");
      return null;
    } else {
      print(response.body);
      return jsonDecode(response.body) as Map<String, dynamic>;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan Json Serializable"),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: getDataUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Text("${snapshot.data!['data']['email']}");
        },
      ),
    );
  }
}
