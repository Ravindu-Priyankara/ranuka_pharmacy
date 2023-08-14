import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ranuka_pharmacy/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ranuka_pharmacy/validator/form_validator.dart';
import 'package:animate_do/animate_do.dart';

class signupPage extends StatefulWidget {
  const signupPage({Key? key}) : super(key: key);

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {

  static Future<User?> signinusingEmailPassword({required String email, required String password,required String name, required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    if(name.isNotEmpty){
      try{
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        user = userCredential.user;
        await user!.updateDisplayName(name);
        await user.reload();
        user = auth.currentUser;
      }on FirebaseAuthException catch (e){
        if (e.code == 'weak-password') {
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
                child: Text("The provided password is too weak",
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
        } else if (e.code == 'email-already-in-use') {
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
                child: Text("The account already exists for that email.",
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
      }catch(e){
        print(e);
      }
    }
    else{
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
            child: Text("Username can't be empty!",
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
    return user;
  }

  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    return Scaffold(
      ///Bottom overlay issue fixed
      resizeToAvoidBottomInset: false,
      ///Add App bar
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
      ///Add body section
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  <Widget>[
                FadeInDown(
                  delay: const Duration(
                    milliseconds: 500,
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                FadeInDown(
                  delay: const Duration(
                    milliseconds: 800,
                  ),
                  child: Text(
                    "Create an account.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: <Widget>[
                  FadeInLeft(
                    delay: const Duration(
                      milliseconds: 1000,
                    ),
                    child: TextFormField(
                      controller: _nameController,
                      validator: (value) => Validator.validateName(name: _nameController.text),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      cursorColor: Colors.red,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Your Name',
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
                  FadeInRight(
                    delay: const Duration(
                      milliseconds: 1000,
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
                  FadeInLeft(
                    delay: const Duration(
                      milliseconds: 1000,
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
                child: FadeInUp(
                  delay: const Duration(
                    milliseconds: 1500,
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () async {
                      User? user = await signinusingEmailPassword(email: _emailController.text, password: _passwordController.text,name: _nameController.text, context: context);
                      if(user?.uid != null){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.blue,
                            elevation: 30,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(23),topRight: Radius.circular(23)),
                                side: BorderSide(
                                  width: 1,
                                  color: Colors.black87,
                                )
                            ),
                            content: Center(
                              child: Text("${_nameController.text}\t registered successfully.",
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
                      }
                      else{
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
                              child: Text("${_nameController.text}\t register not successful.",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    shadows: [BoxShadow(
                                      color: Colors.black87,
                                      blurRadius: 20,
                                      offset: Offset(1,10),
                                    )]
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    color: Colors.greenAccent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text("sign up",
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
                FadeInLeft(
                  delay: const Duration(
                    milliseconds: 1600,
                  ),
                  child: const Text("Already have an account?"
                  ),
                ),
                FadeInUp(
                  delay: const Duration(
                    milliseconds: 1800,
                  ),
                  child: TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                      },
                      child: const Text("Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 18,
                        ),
                      )),
                ),
              ],
            ),
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

class signup extends StatefulWidget {

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
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
              return const signupPage();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      ),
    );
  }
}