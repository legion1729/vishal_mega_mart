




import 'package:flutter/material.dart';
import 'package:vishal_mega_mart_app/screens/bloc/subcatbloc.dart';
import 'package:vishal_mega_mart_app/screens/model/subcatmodel.dart';
import 'package:vishal_mega_mart_app/screens/subcategorywidget.dart';

class SubcatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchallSubcategory();
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.allsubcategory,
        builder: (context, AsyncSnapshot<SubCatModel> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) =>SubCat(text: "sometext")
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}