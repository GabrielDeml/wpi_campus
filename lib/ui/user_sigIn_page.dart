import 'package:flutter/material.dart';
import 'package:wpi_campus/services/sign_in.dart';

class SignInDemo extends StatefulWidget {
  @override
  State createState() => SignInDemoState();
}

class SignInDemoState extends State<SignInDemo> {
  Widget _buildBody() {
    if (SignIn.currentUser != null) {
      return Center(
          child:
              Text("You are signed in. Your ID is: " + SignIn.currentUser.id));
    } else {
      return Center(child: Text("Not signed in"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign In'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  }
}
