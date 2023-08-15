
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class emergency extends StatefulWidget {
  const emergency({Key? key}) : super(key: key);

  @override
  State<emergency> createState() => _emergencyState();
}

class _emergencyState extends State<emergency> {

  TextEditingController _name = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Lottie.asset("assets/emr.json"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: _name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: _phonenumber,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your phone number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: _address,
                decoration: const InputDecoration(
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
              onPressed: () {
                FirebaseFirestore.instance.collection('emergency').add({'dateAndTime':_name.text,'description': _phonenumber.text,'lecturer': _address.text});
              },
              child: const Text("Submit"),

            ),
          ],
        ),
      ),
    );
  }
}
