// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testing_json_serializable/models/user_model.dart';

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

  Future<UserModel?> getDataUser() async {
    Uri url = Uri.parse("https://reqres.in/api/users/5");
    var response = await http.get(url);

    print(response.statusCode);

    if (response.statusCode != 200) {
      print("Data Tidak Ditemukan");
      return null;
    } else {
      Map<String, dynamic> data =
          (jsonDecode(response.body) as Map<String, dynamic>);
      print(response.body);
      // return (jsonDecode(response.body) as Map<String, dynamic>)['data'];
      return UserModel.fromJson(data);
      // return UserModel(
      //   id: data["id"],
      //   email: data["email"],
      //   first_name: data["first_name"],
      //   last_name: data["last_name"],
      //   avatar: data["avatar"],
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan Json Serializable"),
      ),
      body: FutureBuilder<UserModel?>(
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
                      backgroundImage: NetworkImage(snapshot.data!.data.avatar),
                    ),
                    Text("ID : ${snapshot.data!.data.id}"),
                    Text("Email : ${snapshot.data!.data.email}"),
                    Text(
                        "Name : ${snapshot.data!.data.first_name} ${snapshot.data!.data.last_name}"),
                    SizedBox(height: 30),
                    Text("URL : ${snapshot.data!.support.url}"),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "Text : ${snapshot.data!.support.text}",
                        textAlign: TextAlign.center,
                      ),
                    ),
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
