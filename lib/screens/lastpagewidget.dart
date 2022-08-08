import 'package:flutter/material.dart';

class Commonwidget extends StatelessWidget {
  final String imglink;
  final String discription;
  final String brand;
  final String price;

  const Commonwidget(
      {required this.brand,
      required this.price,
      required this.discription,
      required this.imglink});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      //color: Colors.red[200],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 10.0,
            ),
            height: 130.0,
            width: 130.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(imglink),
              ),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              brand,
              style:const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              discription,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              price,
              style:const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
