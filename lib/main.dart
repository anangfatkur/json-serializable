// ignore_for_file: avoid_print, prefer_const_constructors

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
      return (jsonDecode(response.body) as Map<String, dynamic>)['data'];
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
          } else {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(snapshot.data!['avatar']),
                    ),
                    Text("ID : ${snapshot.data!['id']}"),
                    Text("Email : ${snapshot.data!['email']}"),
                    Text(
                        "First Name : ${snapshot.data!['first_name']} ${snapshot.data!['last_name']}"),
                  ],
                ),
              );
            } else {
              return Center(child: Text("Tidak ada data"));
            }
          }
        },
      ),
    );
  }
}
