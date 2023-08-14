
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}
bool passwordVisible=false;

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                ///make a routing for signup page
                Navigator.pop(context);
                },
            );
          },
        ),
        backgroundColor: Colors.white30,
        title: const Text("Login Screen"),
      ),
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
          children: [
            Lottie.asset("assets/login.json"),
            const SizedBox(),
            TextField(
              controller: _emailController,
              style: const TextStyle(
                color: Colors.black,
              ),
              cursorColor: Colors.red,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Email Address',
                contentPadding: EdgeInsets.all(25.0),
                isDense: true,                      // Added this
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12
              ),
            ),
            const SizedBox(height: 12,),
            TextField(
              controller: _passwordController,
              style: const TextStyle(
                color: Colors.black,
              ),
              cursorColor: Colors.red,
              obscureText: passwordVisible,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Enter Password',
                helperText:"Password must contain special character",
                helperStyle:const TextStyle(color:Colors.blue),
                contentPadding: const EdgeInsets.all(25.0),
                isDense: true,
                suffixIcon: IconButton(
                  icon: Icon(passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(
                          () {
                        passwordVisible = !passwordVisible;
                      },
                    );
                  },
                ),
                alignLabelWithHint: false,
                filled: true,
              ),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 32,
              ),
            ),
          ]
        ),
      ),
    );
  }
}
