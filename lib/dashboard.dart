import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:tugas1_flutter/homeScreen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: const Color.fromARGB(255, 243, 40, 33),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 100),
            CircularProfileAvatar(
              '',
              child: FlutterLogo(),
              borderColor: const Color.fromARGB(255, 64, 108, 251),
              borderWidth: 3,
              elevation: 2,
              radius: 50,
            ),
            const SizedBox(height: 20),
            const Text(
              "Hallo, Ajri",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Text("Saldo dana anda"),
            const SizedBox(height: 10),
            const Text("Rp 100.000.000"),
            const SizedBox(height: 20),
            ElevatedButton(
              style: style,
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Apakah yakin ingin keluar?'),
                  content: const Text('Tekan "Ok" untuk keluar'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const Homescreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: const Text('Ok'),
                    ),
                  ],
                ),
              ),
              child: const Text(
                'Keluar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
