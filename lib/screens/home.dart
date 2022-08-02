import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:vishal_mega_mart_app/screens/appBar.dart';
import 'package:vishal_mega_mart_app/screens/bloc/categorybloc.dart';
import 'package:vishal_mega_mart_app/screens/category.dart';
import 'package:vishal_mega_mart_app/screens/categoryss.dart';
import 'package:vishal_mega_mart_app/screens/model/category_section.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getpost();
  //   print("+++++++++++++++++++++++");
  // }

  @override
  Widget build(BuildContext context) {
    bloc.fetchallcategory();
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
          //     Container(
          //       //decoration: BoxDecoration(color: Colors.red[100]),
          //       height: 130,
          //       child: StreamBuilder(
          //           stream: bloc.allcategory,
          //           builder:
          //               (context, AsyncSnapshot<CategorySection> snapshot) {
          //                 if (snapshot.hasData) {
          //   return Text("====================");
          // } else if (snapshot.hasError) {
          //   return Text(snapshot.error.toString());
          // }
          // return Center(child: CircularProgressIndicator());
                     
          //           }),
          //     ),
              Container(
                height: 130,
                child: MovieList()
                // buildList(AsyncSnapshot<>)
                // child:   ListView.builder(
                //         shrinkWrap: true,
                //         scrollDirection: Axis.horizontal,
                //         itemCount: 5,
                //         itemBuilder: (BuildContext context, int index) =>
                //             const CategoriesItem(
                //           categoryName: "aaaaa",
                //           image: "",
                //         ),
                //       ),
                // 
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
