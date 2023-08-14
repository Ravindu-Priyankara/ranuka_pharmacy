
import 'dart:async';

import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///set time for showing splash screen
    Timer(const Duration(seconds: 8), () {
      //Navigator.of(context)
      // TODO: if you need a load another screen change this
          //.pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
