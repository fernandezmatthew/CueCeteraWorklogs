import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home()
));

// we can add images to our application in two ways:
// - Network image, linked to the web
// - Asset image, in our application files

// - stateless widgets are opposite of stateful widgets. None of their values can
// change over time.
// - build() functions called whenever there is a change in the source for that
// widget. This is how we get live updates when we save
// - Making our own widget like this makes it so we could easily add this page to any
// other widget we like
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeo'),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      body: Container(
        // when we only specify the color, container will take all given space
        color: Colors.lightGreen[600],
        // once we specify a child, the color only takes the same size as that child?
        child: Text("Hello"),
        padding: EdgeInsets.all(30.0),
        margin: EdgeInsets.all(30.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Text("click"),
      ),
    );
  }
}

