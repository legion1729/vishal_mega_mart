import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vishal_mega_mart_app/screens/bloc/productbloc.dart';
import 'package:vishal_mega_mart_app/screens/productdetailsapipage.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    bloc.fetchallproduct();
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(70),
                bottomLeft: Radius.circular(70))),
        title: const Center(
          child: Text(
            "Vishal mega mart",
          ),
        ),
        backgroundColor: Colors.lightBlueAccent.withOpacity(0.4),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: 1700,
          child:MovieListss()
        ),
      ),
    );
  }
}
