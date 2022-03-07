
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatelessWidget {
  const HomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FLUTTER FOOD"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _handClickButton,
          child: Text("LOAD FOODS DATA"),
        ),
      ),
    );
  }
  _handClickButton() async {
    final url = Uri.parse('https://cpsu-test-api.herokuapp.com/foods');
    var result = await http.get(url);
    print(result.body);
    var json=jsonDecode(result.body);
    String status = json['status'];
    String? message = json['message'];
    List<dynamic> data= json['data'];
    print('Status: $status, Message: $message, Number of food: ${data.length}');
  }
}

