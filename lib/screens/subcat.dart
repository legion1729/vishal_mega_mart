import 'package:flutter/material.dart';
import 'package:vishal_mega_mart_app/screens/bloc/subcatbloc.dart';
import 'package:vishal_mega_mart_app/screens/model/subcatmodel.dart';
import 'package:vishal_mega_mart_app/screens/subcategorywidget.dart';

class SubcatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchallSubcategory();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      // backgroundColor: Color.fromARGB(255, 204, 246, 255),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 40),
          child: StreamBuilder(
            stream: bloc.allsubcategory,
            builder: (context, AsyncSnapshot<SubCatModel> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) => SubCat(
                        image: snapshot.data!.categories![index].thumbnail
                            .toString(),
                        text: snapshot
                            .data!.categories![index].name!.nameDefault
                            .toString()));
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
