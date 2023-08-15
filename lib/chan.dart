
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class chan extends StatefulWidget {
  const chan({Key? key}) : super(key: key);

  @override
  State<chan> createState() => _chanState();
}

class _chanState extends State<chan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Lottie.asset("assets/doca.json"),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a your name',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a phone number',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter an address',
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.only(left: 12,right: 12,top: 10,bottom: 10),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text("Submit"),

            ),
          ],
        ),
      ),
    );;
  }
}
