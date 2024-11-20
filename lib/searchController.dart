import 'package:flutter/material.dart';

class Searchcontroller extends StatefulWidget {
  const Searchcontroller({super.key});

  @override
  State<Searchcontroller> createState() => _SearchcontrollerState();
}

class _SearchcontrollerState extends State<Searchcontroller> {
  TextEditingController searchControl = TextEditingController(); 
  List<String> originList = [
    "Tanaman hias",
    "Janda Bolong",
    "Bonsai",
    "Cactus",
    "Miana",
    "Lidah buaya",
    "Tanaman Pot"
  ];
  List<String> filteredList = []; 
  String keyword = ""; 

  @override
  void initState() {
    super.initState();
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
    filteredList = [];
    for (int i = 0; i < originList.length; i++) {
      var item = originList[i];
      if (item.toLowerCase().contains(keyword.toLowerCase())) {
        filteredList.add(item);
      }
    }
  }
@override
Widget createListView(List<String> list) {
  return Expanded(
    child: ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
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
                  "assets/images/tanaman/${index + 1}.png",
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Text(
                  list[index],
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
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