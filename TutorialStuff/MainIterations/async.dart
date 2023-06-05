import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async {
    // gonna simulate a network request for a username from some kind of db
    // using this Future.delayed is giving us a nonblocking code block to execute,
    // which is sick

    //using the async tag and the await keyword allows us to not execute further code in this
    // function until the line of code is executed
    String username = await Future.delayed(Duration(seconds: 3), () {
      return "Matthew";
    });

    String bio = await Future.delayed(Duration(seconds: 2), () {
      return "Biography consisting of many words";
    });

    print("$username - $bio");
  }

  @override
  void initState() {
    super.initState();
    //print("initState function ran");
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("loading screen"),
    );
  }
}