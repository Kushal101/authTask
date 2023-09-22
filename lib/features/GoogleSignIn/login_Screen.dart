import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'GoogleSignIn.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
          FlutterLogo(size: 100,),


            ElevatedButton(onPressed: (){
              final provider=Provider.of<GoogleSignInProvider>(context,listen:false);
              provider.googleLogin(context);
            }, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
                children:[IconButton(

                icon: const FaIcon(FontAwesomeIcons.google),
                onPressed: () {  }
            ),Text("SignIn with Google")]))]),



    ));
  }
}
