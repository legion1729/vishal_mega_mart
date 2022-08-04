import 'package:flutter/material.dart';
import 'package:vishal_mega_mart_app/screens/bloc/lastbloc.dart';
import 'package:vishal_mega_mart_app/screens/lastpagewidget.dart';
import 'package:vishal_mega_mart_app/screens/model/lastmodel.dart';

class LastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchalllast();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder(
        stream: bloc.alllastapi,
        builder: (context, AsyncSnapshot<LastModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<LastModel> snapshot) {
    return GridView.builder(
        itemCount: 7,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Commonwidget(
              discription: snapshot.data!.categories![index].name!.nameDefault
                  .toString(),
              imglink: snapshot.data!.categories![index].thumbnail.toString());
        });
  }
}
