import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vishal_mega_mart_app/screens/bottomBar.dart';
import 'package:vishal_mega_mart_app/screens/home.dart';
import 'package:vishal_mega_mart_app/screens/locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BottomBar(),
    );
  }
}
