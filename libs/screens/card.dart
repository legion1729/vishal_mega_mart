import 'package:flutter/material.dart';

class HotNotCard extends StatelessWidget {
  final String imageLocation;
  final String text1;
  final String bottomText;
 // final Function cardClick;
  //final String id;

  const HotNotCard({
    Key? key,
    required this.imageLocation,
    required this.bottomText,
    required this.text1,
    //Irequired this.cardClick,
    //required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            //cardClick(id);
          },
          child: Container(
            margin: const EdgeInsetsDirectional.only(end: 10, start: 10),
            padding: const EdgeInsetsDirectional.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(3.0, 3.0), //(x,y)
                  blurRadius: 5,
                ),
              ],
            ),
            child: SizedBox(
              width: 130,
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      // margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                      height: 100,
                      width: 90,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:
                              imageLocation != null && imageLocation.isNotEmpty
                                  ? Image.network(
                                      imageLocation,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(imageLocation)),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: SizedBox(height: 40, child: Text("AAAA")),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      bottomText + " Listing(s)",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
