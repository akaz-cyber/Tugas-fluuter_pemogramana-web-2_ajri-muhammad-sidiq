import 'package:flutter/material.dart';

class Dashboardhome extends StatefulWidget {
  const Dashboardhome({super.key});

  @override
  State<Dashboardhome> createState() => _DashboardhomeState();
}
 
class _DashboardhomeState extends State<Dashboardhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(100, (index) {
                return Center(
                  child: Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
