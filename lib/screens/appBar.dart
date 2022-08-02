import 'package:flutter/material.dart';

class HeaderWithSearchBox extends StatelessWidget {
  
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      height: 30,
      child: Stack(children: [
        Container(
         
          height: 30,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            ),
          ),
          child: Row(
            children: [
              Container(
                  child: const Text(
                "Vishal Mega Mart",
                style: TextStyle(fontSize: 26 , color: Colors.white),
                
              )),
              const Spacer(),
           Image.asset("assets/f.jpg")
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            margin:  const EdgeInsets.all(2),
            padding:  const EdgeInsets.all(2),
            height: 54,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.amber.withOpacity(0.9),
                  ),
                ]),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Procurar",
                      hintStyle: TextStyle(
                        color:  Colors.amber.withOpacity(0.23),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Image.asset("assets/f.jpg")
              ],
            ),
          ),
        )
      ]),
    );
  }
}