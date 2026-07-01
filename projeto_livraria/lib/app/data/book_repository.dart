import 'package:projeto_livraria/app/data/book_model.dart';
import 'package:projeto_livraria/app/data/book_service.dart';

class BookRepository {
  final BookService _service = BookService();

  List<BookModel> getBooks() {
    final rawData = _service.fetchRawBooks();

    // Convertendo a lista de Map para lista de BookModel de forma simples
    List<BookModel> books = [];
    for (var item in rawData) {
      books.add(
        BookModel(
          title: item['title'] ?? 'Sem título',
          author: item['author'] ?? 'Sem autor',
          imagePath: item['imagePath'] ?? '',
        ),
      );
    }
    return books;
  }
}
