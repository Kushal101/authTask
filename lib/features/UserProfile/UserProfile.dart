import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Container(
      height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
         Text(auth.currentUser!.email.toString()),
         Text(auth.currentUser!.displayName.toString()),
        Image.network(auth.currentUser!.photoURL.toString())
    ],)));
  }
}
