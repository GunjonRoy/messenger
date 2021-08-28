import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user_name_page.dart';

//var loginuser = FirebaseAuth.instance.currentUser;

class Signuppage extends StatefulWidget {
  @override
  _SignuppageState createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final auth=FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //final CollectionReference vaultCollection = FirebaseFirestore.collection('users').document('uid').collection('vault');

//  getCurrentUser() async{
//    final user =await auth.currentUser;
//    if (user != null) {
//      loginuser = user;
//    }
//  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getCurrentUser();
  }
  String email="";
  String password="";
  String userName="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Signup"),
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                height: MediaQuery.of(context).size.height * .08,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Username"
                    ),
                    onChanged: (value){
                      setState(() {
                        userName=value;
                      });
                    },

                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .08,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
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
              ),
              Container(
                height: MediaQuery.of(context).size.height * .08,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Password"
                    ),
                    onChanged: (value){
                      setState(() {
                        password=value;
                      });
                    },

                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .08,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Confirm Password"
                    ),
                    onChanged: (value){
                      setState(() {
                        password=value;
                      });
                    },

                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed:()async{
                    try{
                      UserName username=new UserName();
                      username.setUser(userName);

                      await auth.createUserWithEmailAndPassword(
                          email: email,
                          password: password
                      );
                      final user = await FirebaseAuth.instance.currentUser;
                      final CollectionReference vaultCollection = FirebaseFirestore.instance.collection('User');

                      await vaultCollection.doc(user!.uid).set({
                        'Username': userName,
                        'timeStamp': Timestamp.now()
                      }).then((value) => print("User Added"))
                          .then((value) => Navigator.pushNamed(context, '/signin'));
//                      await firestore
//                          .collection('Data')
//                          .doc(user!.uid)
//                          .collection('info').
//                          .add({
//                        //'Username':uname,
//                        'messageTime': DateTime.now(),
//                        'username': username,
//                        //'user': loginuser!.email,
//                      }).then((value) => print("User Added"))
//                          .then((value) => Navigator.pushNamed(context, '/signin'));

                    }catch(e){
                      print(e);
                    }
                  },
                  child: Text("Sign up")
              )
            ],
          ),
        ),
      ),
    );
  }
}
