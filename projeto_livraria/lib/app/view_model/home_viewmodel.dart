import 'package:projeto_livraria/app/data/book_model.dart';
import 'package:projeto_livraria/app/data/book_repository.dart';

class HomeViewModel {
  final BookRepository _repository = BookRepository();

  List<BookModel> getAvailableBooks() {
    return _repository.getBooks();
  }
}
