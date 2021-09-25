import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:modul6_dar4vazifa2/model/modelclass.dart';
import 'package:modul6_dar4vazifa2/pages/secondpage.dart';
class HomePage extends StatefulWidget {
  
  static final String id = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _islogin(){

    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    
    var user = new User.from(email, password);

    var box = Hive.box("ishonch");

    box.put("user",user.toJson());


   
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[900],
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    image: DecorationImage(
                      image: AssetImage("assets/images/ayubxon.jpg"),
                      fit:BoxFit.cover
                    )
                  ),
                ),
                SizedBox(height: 10,),
                Text("Welcome",style: TextStyle(color: Colors.teal[500]),),
                Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 24),),
                ],
              ),
            ),
           Expanded(
             child: Container(
               padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
               width: double.infinity,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius:BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45))
               ),
               child: SingleChildScrollView(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 5,),
                     Text("Email",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13),),
                     TextField(
                       controller: emailController,
                       decoration: InputDecoration(
                         hintText:"E-Mail",
                         hintStyle: TextStyle(color: Colors.grey,fontSize: 12),
                         border: InputBorder.none
                       ),
                     ),
                     Container(
                       height: 1,
                       color: Colors.grey,
                     ),
                     SizedBox(height: 12,),
                      Text("Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13),),
                     TextField(
                       controller: passwordController,
                       decoration: InputDecoration(
                         hintText:"Enter Password",
                         hintStyle: TextStyle(color: Colors.grey,fontSize: 12),
                         border: InputBorder.none
                       ),
                     ),
                     Container(height: 1,color: Colors.grey,),
                     SizedBox(height: 18,),
                     Center(child: Text("Forget Password ?",style: TextStyle(color: Colors.grey[400]),)),
                     SizedBox(height: 30,),
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
                         child: Text("Sign In",style: TextStyle(color: Colors.white70,fontSize: 20),),
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
                     SizedBox(height: 40,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("Don't have an account ?",style: TextStyle(color: Colors.grey,),),
                         SizedBox(width: 10,),
                         GestureDetector(
                           onTap: (){
                                Navigator.pop(context);
                                Navigator.pushNamed(context, SecondPage.id);
                           },
                           child: Text("Sign Up",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),))
                       ],
                     )
                   ],
                 ),
               ),
             ),
           )
          ],
        )
    );
  }
}