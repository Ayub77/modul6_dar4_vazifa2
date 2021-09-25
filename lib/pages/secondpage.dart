import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:modul6_dar4vazifa2/model/modelclass.dart';
import 'package:modul6_dar4vazifa2/pages/homepage.dart';
class SecondPage extends StatefulWidget {
  const SecondPage({ Key? key }) : super(key: key);
      static final String id = "SecondPage";
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {


    final emailcontroller = TextEditingController();
    final numbercontroller = TextEditingController();
    final addresscontroller = TextEditingController();



    void _islogin(){

      String email = emailcontroller.text.toString().trim();
      String number = numbercontroller.text.toString().trim();
      String address = addresscontroller.text.toString().trim();

      var user = new User(email, number, address);

      var box = Hive.box("ishonch");

      box.put("user", user.toJson());

       var user2 = new User.fromJson(box.get("user"));


    print(user2.email);
    print(user2.number);



    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.teal[900],
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome",style: TextStyle(color: Colors.teal[300]),),
                  SizedBox(height: 5,),
                  Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 25),)
                
                ],
              ),
            ),
            
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
                ),
                child:SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text("Email",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        TextField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            hintText: " E-Mail",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
                            prefixIcon: Icon(Icons.email),
                            border: InputBorder.none
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 20,),
                        Text("Number",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        TextField(
                          controller: numbercontroller,
                          decoration: InputDecoration(
                            hintText: " Phone Number",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
                            prefixIcon: Icon(Icons.phone_iphone),
                            border: InputBorder.none
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 20,),
                        Text("Address",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        TextField(
                          controller: addresscontroller,
                          decoration: InputDecoration(
                            hintText: " Address",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
                            icon: Icon(Icons.edit_road),
                            border: InputBorder.none
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),SizedBox(height: 30,),
                          Container(
                       height:50,
                       width: double.infinity,
                       margin: EdgeInsets.symmetric(horizontal: 20),
                       decoration: BoxDecoration(
                         color: Colors.teal[900],
                         borderRadius: BorderRadius.circular(15)
                       ),
                       child: FlatButton(
                         onPressed: (){
                             _islogin();
                         },
                         child: Text("Sign Up",style: TextStyle(color: Colors.white70,fontSize: 20),),
                       ),
                     ),
                     SizedBox(height: 30,),
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Container(
                           margin: EdgeInsets.symmetric(horizontal: 15),
                           height: 1,
                           width: 110,
                           color: Colors.grey,
                         ),
                         Text("OR",style: TextStyle(color: Colors.grey),),
                         Container(
                           margin: EdgeInsets.symmetric(horizontal: 15),
                           height: 1,
                           width: 109,
                           color: Colors.grey,
                         ),
                       ],
                     ),
                     SizedBox(height: 30,),
                     Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                       children: [
                         Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/facebook.png"),
                                  fit: BoxFit.cover
                                )
                              ),
                         ),
                         SizedBox(width: 50,),
                          Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/twitter.jpg"),
                                  fit: BoxFit.cover
                                )
                              ),
                         ),
                         SizedBox(width: 50,),
                         Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/instagram.png"),
                                  fit: BoxFit.cover
                                )
                              ),
                         )
                       ],
                     ),
                     SizedBox(height: 38,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("Don't have an account ?",style: TextStyle(color: Colors.grey,),),
                         SizedBox(width: 10,),
                         GestureDetector(
                           onTap: (){
                                Navigator.pop(context);
                                Navigator.pushNamed(context, HomePage.id);
                           },
                           child: Text("Sign In",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),))
                       ],
                     )
                    ],
                  ),
                )
            )
            )
        ],
      ),
    );
  }
}