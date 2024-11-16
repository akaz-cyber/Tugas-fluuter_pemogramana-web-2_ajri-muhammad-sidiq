import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:tugas1_flutter/homeScreen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _DashboardState();
}

class _DashboardState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("Dashboard"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 11.0),

            decoration: const BoxDecoration(
             
              color: Color.fromARGB(255, 64, 108, 251),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                CircularProfileAvatar(
                  '',
                  child: const FlutterLogo(),
                  borderColor: Colors.white,
                  borderWidth: 3,
                  elevation: 2,
                  radius: 50,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Ajri",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Semoga harimu menyenangkan",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 1,
              padding: const EdgeInsets.all(7),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: [
                Container(
                  color: Colors.amber,
                  alignment: Alignment.center,
                  child: const Text(
                    '1',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              
              ],
            ),
          ),
       
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
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
                            builder: (BuildContext context) =>
                                const Homescreen(),
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
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
