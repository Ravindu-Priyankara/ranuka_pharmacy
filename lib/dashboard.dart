
import 'package:flutter/material.dart';
import 'package:ranuka_pharmacy/chan.dart';
import 'package:ranuka_pharmacy/emergency.dart';
import 'package:ranuka_pharmacy/order.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Ranuka Pharmacy"),
      ),
      body: ListView(
        children:  [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search medicine name',
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
            child: const Text("Enter"),

          ),
          const Divider(
            thickness: 3,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 20,),
                    InkWell(
                      child: Container(
                          width: 180,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.lightGreenAccent,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            children: const[
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.white,
                                foregroundImage: AssetImage("assets/tablets.jpg"),
                              ),
                              SizedBox(height: 10,),
                              Text("Tablets",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    shadows: [BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(2, 2),
                                      blurRadius: 2,
                                    ),
                                      BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(5, 9),
                                        blurRadius: 12,
                                      ),
                                    ]
                                ),
                              ),
                            ],
                          )
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const order()));
                      },
                    ),
                    const SizedBox(width: 20,),
                    InkWell(
                      child: Container(
                        width: 180,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                        ),
                          child: Column(
                            children: const[
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.white,
                                foregroundImage: AssetImage("assets/injections.jpg"),
                              ),
                              SizedBox(height: 10,),
                              Text("Injections",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    shadows: [BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(2, 2),
                                      blurRadius: 2,
                                    ),
                                      BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(5, 9),
                                        blurRadius: 12,
                                      ),
                                    ]
                                ),
                              ),
                            ],
                          )
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const order()));
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const SizedBox(width: 20,),
                    InkWell(
                      child: Container(
                        width: 180,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                        ),
                          child: Column(
                            children: const[
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.white,
                                foregroundImage: AssetImage("assets/child.jpg"),
                              ),
                              SizedBox(height: 10,),
                              Text("Child",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    shadows: [BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(2, 2),
                                      blurRadius: 2,
                                    ),
                                      BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(5, 9),
                                        blurRadius: 12,
                                      ),
                                    ]
                                ),
                              ),
                            ],
                          )
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const order()));
                      },
                    ),
                    const SizedBox(width: 20,),
                    InkWell(
                      child: Container(
                        width: 180,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                        ),
                          child: Column(
                            children: const[
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.white,
                                foregroundImage: AssetImage("assets/syrup.jpg"),
                              ),
                              SizedBox(height: 10,),
                              Text("Syrups",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    shadows: [BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(2, 2),
                                      blurRadius: 2,
                                    ),
                                      BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(5, 9),
                                        blurRadius: 12,
                                      ),
                                    ]
                                ),
                              ),
                            ],
                          )
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const order()));
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const SizedBox(width: 20,),
                    InkWell(
                      child: Container(
                        width: 180,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                        ),
                          child: Column(
                            children: const[
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.white,
                                foregroundImage: AssetImage("assets/antibiotic.jpg"),
                              ),
                              SizedBox(height: 10,),
                              Text("Antibiotic",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    shadows: [BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(2, 2),
                                      blurRadius: 2,
                                    ),
                                      BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(5, 9),
                                        blurRadius: 12,
                                      ),
                                    ]
                                ),
                              ),
                            ],
                          )
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const order()));
                      },
                    ),
                    const SizedBox(width: 20,),
                    InkWell(
                      child: Container(
                        width: 180,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                        ),
                          child: Column(
                            children: const[
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.white,
                                foregroundImage: AssetImage("assets/2t.jpg"),
                              ),
                              SizedBox(height: 10,),
                              Text("Pain Relievers",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    shadows: [BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(2, 2),
                                      blurRadius: 2,
                                    ),
                                      BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(5, 9),
                                        blurRadius: 12,
                                      ),
                                    ]
                                ),
                              ),
                            ],
                          )
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const order()));
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const SizedBox(width: 20,),
                    InkWell(
                      child: Container(
                        width: 180,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                        ),
                          child: Column(
                            children: const[
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.white,
                                foregroundImage: AssetImage("assets/doctor.jpg"),
                              ),
                              SizedBox(height: 10,),
                              Text("Channeling",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    shadows: [BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(2, 2),
                                      blurRadius: 2,
                                    ),
                                      BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(5, 9),
                                        blurRadius: 12,
                                      ),
                                    ]
                                ),
                              ),
                            ],
                          )
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const chan()));
                      },
                    ),
                    const SizedBox(width: 20,),
                    InkWell(
                      child: Container(
                        width: 180,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                        ),
                          child: Column(
                            children: const[
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.white,
                                foregroundImage: AssetImage("assets/emmergency.jpg"),
                              ),
                              SizedBox(height: 10,),
                              Text("Emergency",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    shadows: [BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(2, 2),
                                      blurRadius: 2,
                                    ),
                                      BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(5, 9),
                                        blurRadius: 12,
                                      ),
                                    ]
                                ),
                              ),
                            ],
                          )
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const emergency()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
