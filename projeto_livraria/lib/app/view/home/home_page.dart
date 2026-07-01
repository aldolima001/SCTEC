import 'package:flutter/material.dart';
import 'package:projeto_livraria/app/view_model/home_viewmodel.dart';
import 'package:projeto_livraria/app/view/home/widgets/book.card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Instanciamos a nossa ViewModel que controla os dados da tela
  final HomeViewModel _viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    final bookList = _viewModel.getAvailableBooks();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Livraria Estrela Branca'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      // Dica da imagem: usar o SingleChildScrollView para o scroll da tela
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          // Dica da imagem: usar o Wrap para organizar os blocos lado a lado
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: bookList.map((book) {
              return BookCard(book: book);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
