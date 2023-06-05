import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async {
    Response response = await get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));
    // get gives us a json string. we now need to convert that into some kind
    // of format we can use. so we import dart:convert to automatically convert
    // our json file to a map
    Map data = jsonDecode(response.body);
    print(data["title"]);
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
