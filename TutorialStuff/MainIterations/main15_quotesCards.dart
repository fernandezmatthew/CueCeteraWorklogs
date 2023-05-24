import 'package:flutter/material.dart';
import 'quote.dart';

void main() {
  runApp(MaterialApp(
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(text: "Be yourself; everyone else is taken", author: "Oscar Wilde"),
    Quote(text: "I have nothing to declare except my genius", author: "Oscar Wilde"),
    Quote(text: "The truth is rarely pure and never simple", author: "Oscar Wilde"),
  ];

  Widget quoteTemplate(Quote quote) => Card(
    margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Text(
            "${quote.text}",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            "${quote.author}",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome Quotes"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        // map cycles through a list of data. for each item, it will
        // perform a functions, and return a value
        // in the end, we convert all the return values into a list (which are the text widgets themselves)
        // when we want to output a variable using a dot, need curly braces
        children: quotes.map((quote) => quoteTemplate(quote)).toList(),
      ),
    );
  }
}

