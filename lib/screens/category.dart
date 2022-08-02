import 'package:flutter/material.dart';
import 'package:vishal_mega_mart_app/screens/productDetails.dart';

class CategoriesItem extends StatelessWidget {
  final String? image;
  final String? categoryName;
  final Color color;
  final double height;
  final double width;

   CategoriesItem({
    Key? key,
    this.image,
    this.categoryName = '',
    this.color = Colors.grey,
    this.height = 90,
    this.width = 90,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductDetails(),
          ),
        );
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.only(
          right: 1,
          // left: 5,
        ),
        child: Column(
          children: [
            Container(
              height: height,
              width: width,
              margin: const EdgeInsetsDirectional.only(end: 2, start: 3),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blueGrey,
                    offset: Offset(0.0, 5.0), //(x,y)
                    blurRadius: 5,
                  ),
                ],
              ),
              // padding: EdgeInsets.only(right: appDimen.sp5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: image != null && image!.isNotEmpty
                    ? Image.network(
                        image!,
                        fit: BoxFit.contain,
                      )
                    : Image.asset("assets/p.jpeg"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              categoryName != null ? categoryName! : '',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                shadows: [
                  Shadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 2.0), //(x,y)
                    blurRadius: 10,
                  ),
                ],
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
