import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:vishal_mega_mart_app/screens/appBar.dart';
import 'package:vishal_mega_mart_app/screens/category.dart';
import 'package:vishal_mega_mart_app/screens/model/category_section.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final url =
      "https://www.vishalmegamart.com/s/-/dw/data/v20_10/catalogs/vmm-storefront-catalog/categories/root";

  var postjson;

  final token ="eyJ0eXAiOiJKV1QiLCJraWQiOiJEMWhPUDdEODN4TjBqZWlqaTI3WWFvZFRjL0E9IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiI5ODA0ZjhiNC1lNDMxLTQ5NTAtYTc0My1iZGEyMmYwOWViYjgiLCJjdHMiOiJPQVVUSDJfU1RBVEVMRVNTX0dSQU5UIiwiYXVkaXRUcmFja2luZ0lkIjoiZjBkY2U0OTEtNjBjMi00NDlhLWJkMWYtZDYyMTVjNDIwN2ZjLTM5NzczNTkzNCIsInN1Ym5hbWUiOiI5ODA0ZjhiNC1lNDMxLTQ5NTAtYTc0My1iZGEyMmYwOWViYjgiLCJpc3MiOiJodHRwczovL2FjY291bnQuZGVtYW5kd2FyZS5jb206NDQzL2R3c3NvL29hdXRoMiIsInRva2VuTmFtZSI6ImFjY2Vzc190b2tlbiIsInRva2VuX3R5cGUiOiJCZWFyZXIiLCJhdXRoR3JhbnRJZCI6Il8yTUsxYnI2RVNrcGlQOExwaFdYZHU2M18xZyIsImF1ZCI6Ijk4MDRmOGI0LWU0MzEtNDk1MC1hNzQzLWJkYTIyZjA5ZWJiOCIsIm5iZiI6MTY1OTQ1NjA5MiwiZ3JhbnRfdHlwZSI6ImNsaWVudF9jcmVkZW50aWFscyIsInNjb3BlIjpbIm1haWwiXSwiYXV0aF90aW1lIjoxNjU5NDU2MDkyLCJyZWFsbSI6Ii8iLCJleHAiOjE2NTk0NTc4OTIsImlhdCI6MTY1OTQ1NjA5MiwiZXhwaXJlc19pbiI6MTgwMCwianRpIjoickJrYkRCZmpsNC1wZG1MaUM1N0tLbEJ6ZXRFIiwiY2xpZW50X2lkIjoiOTgwNGY4YjQtZTQzMS00OTUwLWE3NDMtYmRhMjJmMDllYmI4In0.hdGPaC0EqKhjq9fBJWS0YaMyswjiBch_rFT2fDMPJN6C5PLHS_XAtmt1ZF0Hq8m66-i_E1BTgGvFkI_QzRSA9n3E0ooxcJBhmxg2V0lrQj8ouf0RmRVt-yzQ4zGMYUtTyNy6DAa-IEQh-3ijd6wp4xtOWAcfJJH4IX2UQv87hqiHbDrS4QPlHYA-DVKZpnD0qAJcN5a2VM41T8MX4kzd76x5RCur-OK56e9aSPLtEd9N8ndyxOYra3VpM7jyoSsY4R2GJKKlmVsHoxcJvPAUvs__5UFhCpGbumt8rZCbGwLNO63o5AoZnBXYelZaEI5MuXfkQUp3hVGKxn3ptgBCGQ";
  

  Future<CategorySection> getpost() async {
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final jsondata = jsonDecode(response.body.toString());
    print("=========${jsondata.length}");
    print("======== ${response.body}");
    setState(() {
      postjson = jsondata;
    });

    return CategorySection.fromJson(jsonDecode(response.body));
  }

  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getpost();
    print("+++++++++++++++++++++++");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //     bottomRight: Radius.circular(70),
        //     bottomLeft: Radius.circular(70),
        //   ),
        // ),
        title: const Center(
          child: Text(
            "Vishal mega mart",
          ),
        ),
        backgroundColor: Colors.lightBlueAccent.withOpacity(0.4),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [],
              ),
              TextField(
                controller: myController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  {
                    log("++++ BUTTON CLICKED ++++++");
                  }
                  ;
                },
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Shop by category",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                //decoration: BoxDecoration(color: Colors.red[100]),
                height: 130,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: postjson?.length,
                  itemBuilder: (BuildContext context, int index) =>
                      const CategoriesItem(
                    categoryName: "aaaaa",
                    image: "",
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular Products",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  viewportFraction: 1,
                  autoPlay: true,
                ),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 1.0),
                        // decoration: BoxDecoration(color: Colors.red[100]),
                        child: ClipRRect(
                          child: Image.asset("assets/img.png"),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Best Deals",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 1000,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        //color: Colors.red[100],
                        child: Image.asset("assets/thor.jpg"),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
