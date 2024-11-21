import 'package:flutter/material.dart';
import 'package:tugas1_flutter/detailtanaman.dart';

class Dashboardhome extends StatefulWidget {
  const Dashboardhome({super.key});

  @override
  State<Dashboardhome> createState() => _DashboardhomeState();
}

class _DashboardhomeState extends State<Dashboardhome> {
  @override
  final List<Map<String, String>> items = [
    {
      "title": "Janda Bolong",
      "desc": "Monstera adansonii adalah spesies tumbuhan berbunga.."
    },
    {
      "title": "Tanaman hias",
      "desc": "mencakup semua tumbuhan, baik berbentuk.."
    },
    {
      "title": "Bonsai",
      "desc": "tanaman atau pohon yang dikerdilkan di dalam pot dangkal.."
    },
    {"title": "Cactus", "desc": "Tanaman yang tidak memerlukan banyak air.."},
    {
      "title": "Miana",
      "desc": "Tanaman semak dengan tinggi dapat mencapai 1,5"
    },
    {
      "title": "Lidah buaya",
      "desc": "spesies tumbuhan dengan daun berdaging tebal dari genus Aloe."
    },
    {"title": "Tanaman Pot", "desc": "Tanaman hias mencakup,,,"},
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color(0xFFEEEDF2),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 5, top: 10),
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                "Selamat datang di halaman dashboard",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            child: const Text(
              "Jenis Tanaman",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 65, 71, 139)),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (context, index) {
                final item = items[index];
                return Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Detailtanaman(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/images/tanaman/${index + 1}.png",
                            height: 120,
                            width: 120,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item["title"]!,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF4C53A5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item["desc"]!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4C53A5),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
