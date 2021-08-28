import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String firstName="";
  String lastName="";
  String gender="";
  String address="";
  String contactNo="";
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 50,right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    //keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      hintText: "massage",
                      hintStyle: TextStyle(fontStyle: FontStyle.italic,backgroundColor: Colors.limeAccent,color: Colors.black)
                    ),
                    onChanged: (value){
                      firstName=value;
                    },
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed:()async{
                        await firestore.collection('Data').add({
                          'Fiest Name':firstName,
//                          'Last Name':lastName,
//                          'Gender':gender,
//                          'Address':address,
//                          'Contact No':contactNo
                        }).then((value) => print("User Added"));
                      },
                      child: Text("Submite"),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/data');
                      },
                      child: Text("Show Data")
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
