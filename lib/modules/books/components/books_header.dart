import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ra_app/styles/constraints.dart';

class BooksHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [booksPrimaryColor, booksPrimaryColorShade],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 75, 95, 93),
                    offset: Offset(0, 5),
                    blurRadius: 4)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 15),
                child: const Icon(
                  Icons.book,
                  color: Color.fromARGB(255, 214, 232, 230),
                  size: 70,
                ),
              ),
              Flexible(
                child: Text(
                  'Livros Resolvidos',
                  style: GoogleFonts.lato(
                      decoration: TextDecoration.none,
                      fontSize: 43,
                      color: Color.fromARGB(255, 242, 242, 242)),
                ),
              ),
            ],
          ),
        ));
  }
}
