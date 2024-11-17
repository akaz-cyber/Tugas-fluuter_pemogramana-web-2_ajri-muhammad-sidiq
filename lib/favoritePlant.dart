import 'package:flutter/material.dart';

class Favoriteplant extends StatefulWidget {
  const Favoriteplant({super.key});

  @override
  State<Favoriteplant> createState() => _FavoriteplantState();
}

class _FavoriteplantState extends State<Favoriteplant> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark_outline,
              size: 50,
              color: Colors.blueGrey,
              ),
              const SizedBox(height: 9),
              Text(
                "Tanaman belum ada yang di favoritkan",
                style: TextStyle(
                  fontSize: 18
                ),
                )
          ],
        ),
      ),
    );
  }
}