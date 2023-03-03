import 'package:flutter/material.dart';
import 'package:ra_app/modules/books/books_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BooksScreen(),
    );
  }
}
