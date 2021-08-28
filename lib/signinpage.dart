import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger/ChatBoxPage.dart';
class Signinpage extends StatefulWidget {


  String name="";
  username(String name){
    this.name=name;
  }
  @override
  _SigninpageState createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {

  bool isHiddenPassword=true;
  final auth= FirebaseAuth.instance;
  String email="";
  String password="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 50,right: 50),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Email"
                ),
                onChanged: (value){
                  setState(() {
                    email=value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50,right: 50,top: 10),
              child: TextField(
                obscureText: isHiddenPassword,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                        onTap: togglePasswordViwe,
                        child: Icon(
                            Icons.visibility_off,
                            color: Colors.black38
                        )
                    ),
                    hintText: "Password"
                ),
                onChanged: (value){
                  setState(() {
                    password=value;
                  });
                },

              ),
            ),
            ElevatedButton(
                onPressed:()async{
                  try{
                    //ChatBoxPage uname=new ChatBoxPage();
                     await auth.signInWithEmailAndPassword(
                        email: email,
                        password: password
                    ).then((value) => Navigator.pushNamed(context, '/chat'));
                  }catch(e){
                    print(e);
                  }
                },
                child: Text("Sign in")
            ),
            SizedBox(height: 20,),


            ElevatedButton(
                onPressed:(){
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text("Sign up",
                )
            ),
          ],
        ),
      ),
    );
  }

  void togglePasswordViwe() {
    setState(() {
      isHiddenPassword=!isHiddenPassword;
      //var visibility_off = Icons.visibility_off;
    });
  }
}
