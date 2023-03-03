import 'package:flutter/material.dart';
import 'package:ra_app/modules/books/components/books_header.dart';
import 'package:ra_app/modules/books/components/books_themes_list.dart';
import 'package:ra_app/styles/constraints.dart';

class BooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBackgroundColor,
      child: Column(
        children: <Widget>[BooksHeader(), BooksThemesList()],
      ),
    );
  }
}
