import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projec_combilenation/components/card.dart';
import 'package:projec_combilenation/components/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> booklist = [
    {
      'title': 'C Programming: (For JNTU, Kakinada)',
      'img':
          'https://th.bing.com/th/id/OIP.WEh-huEEvBRopdZAEPQDmQHaKc?pid=ImgDet&rs=1',
      'year': 2015,
    },
    {
      'title': 'C Programming: (For JNTU, Kakinada)',
      'img':
          'https://th.bing.com/th/id/OIP.WvGkGaFf6lwYJ03YZi7UywAAAA?pid=ImgDet&rs=1',
      'year': 2017,
    },
    {
      'title':
          'Core Java for Beginners: A Simplified Approach (Covers Java SE 13)',
      'img':
          'https://th.bing.com/th/id/OIP.rM8wR0w4vqVnpeUXp8uRzgHaJd?pid=ImgDet&rs=1',
      'year': 2019,
    },
    {
      'title': 'The Python Book: The Ultimate Guide to Coding with Python',
      'img':
          'https://th.bing.com/th/id/OIP.1AJSRkONXap-dJLVSC0YYgAAAA?pid=ImgDet&rs=1',
      'year': 2018,
    },
    {
      'title':
          'R in the graphical capabilities of R for exploring, managing, and solving data visualization challenges.',
      'img':
          'https://th.bing.com/th/id/OIP.ud-8klePKT2G6NUe98bt5QHaKG?pid=ImgDet&rs=1',
      'year': 2017,
    },
    {
      'title': 'C# Programming.A Step-by-Step Guide for Absolute Beginners',
      'img':
          'https://th.bing.com/th/id/OIP.5q70tq-vyy0E0ZyP-NVl2QAAAA?pid=ImgDet&rs=1',
      'year': 2000,
    },
  ];

  TextEditingController _ctrlSearch = TextEditingController();
  List<dynamic> searchResults = [];

  @override
  void initState() {
    super.initState();
    searchResults = List.of(booklist);
  }

  void search(String query) {
    setState(() {
      searchResults = booklist
          .where((book) =>
              book['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                  color: Color(0xFFEDECF2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  )),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          height: 50,
                          width: 300,
                          child: TextFormField(
                            controller: _ctrlSearch,
                            onChanged: (value) => search(value),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search here....",
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {},
                          child: const Icon(
                            Icons.search,
                            size: 27,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //  Products card =======================================
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        left: 10,
                        right: 10,
                      ),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 20.0,
                          mainAxisExtent: 350,
                        ),
                        itemCount: searchResults.length,
                        itemBuilder: (context, index) => CardBook(
                          title: searchResults[index]['title'],
                          img: searchResults[index]['img'],
                          year: searchResults[index]['year'],
                          press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                indexx: index,
                                title: searchResults[index]['title'],
                                img: searchResults[index]['img'],
                                year: searchResults[index]['year'],
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
