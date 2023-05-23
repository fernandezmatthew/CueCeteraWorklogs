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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Image.asset(
              "assets/canyon.jpg"
            ),
          ),
          Expanded(
            // the higher the flex value, the more space it takes up
            // this example can be interpreted as: split the screen into 6 spaces,
            // fill 3/6 with 1, 2/6 with 2, and 1/6 with 3
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.cyan,
              child: Text("1"),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.pinkAccent,
              child: Text("2"),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.amber,
              child: Text("3"),
            ),
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Text("click"),
      ),
    );
  }
}

