import 'package:ra_app/models/Books.dart';

class Tema {
  final int id;
  final String name;
  final String color;
  final int position;
  final List<Book> books;

  const Tema({
    required this.id,
    required this.color,
    required this.name,
    required this.position,
    required this.books,
  });

  factory Tema.fromResponse(resp) {
    List<Book> books = [];

    for (Map<String, dynamic> book in resp['books']) {
      books.add(Book.fromResponse(book));
    }

    return Tema(
      id: resp['id'],
      color: resp['color'],
      name: resp['name'],
      position: resp['position'],
      books: books,
    );
  }
}
