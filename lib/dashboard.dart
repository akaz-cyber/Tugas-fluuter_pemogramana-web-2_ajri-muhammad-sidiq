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
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20), backgroundColor: const Color.fromARGB(255, 243, 40, 33) );
    return Scaffold(
       body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget> [
        Text("ini halaman dashboard"),
          const SizedBox(height: 20),
               ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Homescreen(),
                  ),
                );
              },
              child: const Text(
                'keluar',
                style: TextStyle(color: Colors.white),
              ),
            ),

       ],
        ) 
      
         
       ),

    );
  }
}