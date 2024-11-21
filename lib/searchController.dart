import 'package:flutter/material.dart';
import 'detailtanaman.dart';

class Searchcontroller extends StatefulWidget {
  const Searchcontroller({super.key});

  @override
  State<Searchcontroller> createState() => _SearchcontrollerState();
}

class _SearchcontrollerState extends State<Searchcontroller> {
  TextEditingController searchControl = TextEditingController();

  final Map<String, String> plantData = {
    "Tanaman hias": "assets/images/tanaman/1.png",
    "Janda Bolong": "assets/images/tanaman/2.png",
    "Bonsai": "assets/images/tanaman/3.png",
    "Cactus": "assets/images/tanaman/4.png",
    "Miana": "assets/images/tanaman/5.png",
    "Lidah buaya": "assets/images/tanaman/6.png",
    "Tanaman Pot": "assets/images/tanaman/7.png",
  };

  List<String> originList = []; 
  List<String> filteredList = []; 
  String keyword = "";

  @override
  void initState() {
    super.initState();
    originList = plantData.keys.toList(); 
    originList.sort(); 
    filteredList = List.from(originList); 
    searchControl.addListener(() {
      setState(() {
        keyword = searchControl.text;
        searchData();
      });
    });
  }

  @override
  void dispose() {
    searchControl.dispose();
    super.dispose();
  }

  void searchData() {

    filteredList = originList
        .where((plant) => plant.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

  Widget createListView(List<String> list) {
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          String plantName = list[index]; 
          String plantImage = plantData[plantName] ?? ""; 

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Detailtanaman(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      plantImage, 
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      plantName, 
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cari tanaman"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: searchControl,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search Tanaman",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 10),
            createListView(filteredList), 
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
