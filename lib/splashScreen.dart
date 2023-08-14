
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              end: Alignment.topCenter,
              begin: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(5, 233, 35, 1.0),
                Color.fromRGBO(20, 238, 4, 1.0),
                Color.fromRGBO(94, 245, 7, 1.0),
                Colors.white,
              ]
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Lottie.asset("assets/splash.json"),
            const SizedBox(width: 34,),
            const Text("Ranuka Pharmacy",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                shadows: [BoxShadow(
                  color: Colors.black45,
                  offset: Offset(2, 4),
                  blurRadius: 3,
                ),
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(4, 9),
                  blurRadius: 12,
                ),
                ]
              ),
            ),
            const SizedBox(height: 190,),
            Container(
              width: 400,
              height: 50,
              decoration:  BoxDecoration(
                color: Colors.lightGreenAccent,
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: const [BoxShadow(
                  color: Colors.black45,
                  offset: Offset(4, 9),
                  blurRadius: 12,
                )]
              ),
              child: Row(
                children: const[
                  SizedBox(width: 39,),
                  Text("Your Path to Wellness.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      shadows: [BoxShadow(
                        color: Colors.white,
                        offset: Offset(2, 4),
                        blurRadius: 2,
                      )]
                    ),
                  ),
                  SizedBox(width: 20,),
                  Icon(Icons.navigate_next,
                    shadows: [BoxShadow(
                      color: Colors.white,
                      offset: Offset(2, 4),
                      blurRadius: 2,
                    )],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
