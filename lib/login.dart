import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dashboard.dart';
import 'package:ranuka_pharmacy/signup.dart';
import 'package:animate_do/animate_do.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ranuka_pharmacy/validator/form_validator.dart';



class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  ///login function
  static Future<User?> loginusingEmailPassword({required String email, required String password, required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e){
      if(e.code == "user-not-found"){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            elevation: 30,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(23),topRight: Radius.circular(23)),
                side: BorderSide(
                  width: 2,
                  color: Colors.white,
                )
            ),
            content: Center(
              child: Text("Users not Found",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    shadows: [BoxShadow(
                      color: Colors.black,
                      blurRadius: 20,
                      offset: Offset(1,10),
                    )]
                ),
              ),
            ),
          ),
        );
      }
    }
    return user;
  }
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    ///create a text controllers
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      /** stop bottom overlay issue **/
      resizeToAvoidBottomInset: false,
      /** App bar section **/
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios,size: 20,color: Colors.black),
        ),
      ),
      /** Application body section **/
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  <Widget>[
                /** Header texts **/
                FadeInDown(
                  delay: const Duration(
                    milliseconds: 500,
                  ),
                  child: const Text(
                    "Login Panel",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                FadeInDown(
                  delay: const Duration(
                    milliseconds: 1000,
                  ),
                  child: Text(
                    "Login to your account.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
            /** Define input fields **/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: <Widget>[
                  FadeInRight(
                    delay: const Duration(
                      milliseconds: 800,
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) => Validator.validateEmail(email: _emailController.text),
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
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 12
                    ),
                  ),
                  const SizedBox(height: 12,),
                  FadeInLeft(
                    delay: const Duration(
                      milliseconds: 800,
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      validator: (value) => Validator.validatePassword(password: _passwordController.text),
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
                  ),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                padding: const EdgeInsets.only(top: 3,left: 3),
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: const Border(
                    bottom: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                  ),
                ),
                /** Define login button and text **/
                child: FadeInUp(
                  delay: const Duration(
                    milliseconds: 1000,
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () async{
                      User? user = await loginusingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                      if(user != null){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: const Color.fromRGBO(
                                3, 37, 96, 1.0),
                            elevation: 30,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(23),topRight: Radius.circular(23)),
                                side: BorderSide(
                                  width: 2,
                                  color: Colors.lightGreenAccent,
                                )
                            ),
                            content: Center(
                              child: Text("${_emailController.text}\t login successfully.",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    shadows: [BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 20,
                                      offset: Offset(1,10),
                                    )]
                                ),
                              ),
                            ),
                          ),
                        );
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const dashboard()));
                      }else if(user == null){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            elevation: 30,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(23),topRight: Radius.circular(23)),
                                side: BorderSide(
                                  width: 1,
                                  color: Colors.black87,
                                )
                            ),
                            content: Center(
                              child: Text("${_emailController.text}\t login  successful!",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    shadows: [BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 20,
                                      offset: Offset(1,10),
                                    )]
                                ),
                              ),
                            ),
                            action: SnackBarAction(
                              label: 'Ok',
                              onPressed: (){},
                            ),
                          ),
                        );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context)=> const dashboard(),
                          ),
                        );
                      }
                    },
                    color: Colors.greenAccent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text("Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
                /** Bottom text and text button **/
                FadeInLeft(
                  delay: const Duration(
                    milliseconds: 1300,
                  ),
                  child: const Text("don't have an account?"),
                ),
                FadeInUp(
                  delay: const Duration(
                    milliseconds: 1500,
                  ),
                  child: TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => signup()));
                      },
                      child: const Text("Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 18,
                        ),
                      )
                  ),
                ),
              ],
            ),
            /** Bottom Image **/
            FadeInRightBig(
              delay: const Duration(
                milliseconds: 2000,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/tree.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class login extends StatefulWidget {

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return const loginPage();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      ),
    );
  }
}