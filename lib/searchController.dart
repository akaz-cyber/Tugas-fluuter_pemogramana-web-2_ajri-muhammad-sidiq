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

  Widget createListView(List<String> list) {
    return Expanded(
      child: ListView.separated(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 35,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                list[index],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.lightBlue,
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
            TextField(
              controller: searchControl,
              decoration: const InputDecoration(
                hintText: "Search Tanaman",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              textAlign: TextAlign.left,
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
