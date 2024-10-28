import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tugas1_flutter/dashboard.dart';


class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final String _staticUsername = "ajri";
  final String _staticPassword = "ajri12345";

  void _login(){
    if (_username.text == _staticUsername && _password.text == _staticPassword) {
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Berhasil!")),
      );
       Navigator.pushReplacement<void, void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const Dashboard(),
    ),
  );
    } else {
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username atau password salah")),
      );
    }
  }
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.blue );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _username,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _password,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
           ElevatedButton(
            style: style,
             onPressed: () {
                _login();
              },
            child: const Text(
              'MASUK',
              style: TextStyle(color: Colors.white)

            ),
          ),
          ],
        ),
      ),
    );
  }
}
