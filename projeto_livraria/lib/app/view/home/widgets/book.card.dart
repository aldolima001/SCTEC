import 'package:flutter/material.dart';
import 'package:projeto_livraria/app/data/book_model.dart';

class BookCard extends StatelessWidget {
  final BookModel book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    // Definimos a largura base para o card caber no Wrap lado a lado
    double cardWidth = MediaQuery.of(context).size.width * 0.43;

    return Container(
      width: cardWidth,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Verificação da Imagem Quebrada (Requisito da imagem atividade.jpg)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: book.imagePath.startsWith('assets/')
                ? Image.asset(
                    book.imagePath,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 150,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Text(
                        'Capa indisponível',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
          ),
          const SizedBox(height: 8),
          Text(
            book.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            book.author,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  print('Livro clicado: ${book.title}');
                },
                style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                child: const Text('Ler Mais', style: TextStyle(fontSize: 10)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
