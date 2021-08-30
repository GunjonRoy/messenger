import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:messenger/signinpage.dart';

class UserLogIn extends StatelessWidget {
  Stream<DocumentSnapshot> snapshot =  FirebaseFirestore.instance.collection("User").doc().snapshots();
  @override
  Widget build(BuildContext context) {
    return Signinpage();
  }
}
