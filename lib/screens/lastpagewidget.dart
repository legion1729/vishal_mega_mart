import 'package:flutter/material.dart';

class Commonwidget extends StatelessWidget {
  final String imglink;
  final String discription;

  const Commonwidget({required this.discription, required this.imglink});
  @override
  Widget build(BuildContext context) {
    return Container(
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
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imglink),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(discription),
          
        ],
      ),
    );
  }
}
