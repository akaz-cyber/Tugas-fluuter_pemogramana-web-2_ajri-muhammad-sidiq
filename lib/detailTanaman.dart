import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';

class Detailtanaman extends StatefulWidget {
  const Detailtanaman({super.key});

  @override
  State<Detailtanaman> createState() => _DetailtanamanState();
}

class _DetailtanamanState extends State<Detailtanaman> {
  bool isLoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail tanaman"),
        actions: const [
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: 30,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    "assets/images/tanaman/1.png",
                    height: 300,
                  ),
                ),
                Arc(
                  edge: Edge.TOP,
                  arcType: ArcType.CONVEY,
                  height: 30,
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 50,
                              bottom: 20,
                            ),
                            child: Text(
                              "Nama Tanaman",
                              style: TextStyle(
                                fontSize: 28,
                                color: Color.fromARGB(255, 65, 71, 139),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 65, 71, 139),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 5,
                              bottom: 10,
                            ),
                            child: Text(
                              "Lubang-lubang pada daun monstera adansonii ini hanya di permukaan tengahnya saja. Jadi tak sampai sobek-sobek yang membentuk jari-jari pada pinggir daun. Ukuran daunnya relatif kecil serta memiliki gradasi warna hijau tua dan muda. Dalam pertumbuhannya, batang tanaman monstera adansonii ini tidak terlalu kaku, sehingga kamu bisa menjadikannya sebagai tanaman gantung yang menjuntai. Selain itu, jenis monstera ini juga dapat tumbuh merambat.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 65, 71, 139),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rata-Rata harga : 23.000",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 65, 71, 139),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
