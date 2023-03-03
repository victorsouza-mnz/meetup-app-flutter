import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ra_app/data/useCases/get_themes_with_books.dart';
import 'package:ra_app/infra/http_client.dart';
import 'package:ra_app/models/Books.dart';
import 'package:ra_app/models/temas.dart';
import 'package:ra_app/modules/books/useCase/getThemesWithBooks.dart';
import 'dart:developer';

class BooksThemesList extends StatefulWidget {
  @override
  State<BooksThemesList> createState() => _BooksThemesListState();
}

class _BooksThemesListState extends State<BooksThemesList> {
  late Future<List<Tema>> themesWithBooks;

  @override
  void initState() {
    super.initState();
    themesWithBooks =
        GetThemesWithBooks(httpClient: HttpClient(), url: '/themes/with-books')
            .exec();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tema>>(
      future: themesWithBooks,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('deu ruim');
        } else {
          return Column(children: [
            ThemeTitle(themeName: snapshot.data![0].name),
            BooksList(books: snapshot.data![0].books),
          ]);
        }
      },
    );
  }
}

class BooksList extends StatelessWidget {
  const BooksList({super.key, required this.books});

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: books.map((book) {
            return Image(
              image: NetworkImage(book.imagePath),
              width: 150,
              height: 180,
            );
          }).toList(),
        ));
  }
}

class ThemeTitle extends StatelessWidget {
  const ThemeTitle({super.key, required this.themeName});

  final String themeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Stack(children: [
        Container(
          padding: EdgeInsets.only(left: 3, right: 3),
          child: Text(
            themeName,
            style: GoogleFonts.lato(
                color: Colors.orange,
                fontSize: 20,
                fontWeight: FontWeight.w900,
                decoration: TextDecoration.none),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 7,
              color: Color.fromARGB(255, 191, 191, 191).withOpacity(0.5),
            ))
      ]),
    );
  }
}
