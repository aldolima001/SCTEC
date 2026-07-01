class BookService {
  List<Map<String, String>> fetchRawBooks() {
    return [
      {
        'title': 'Crime e Castigo',
        'author': 'Fiódor Dostoiévski',
        'imagePath': 'assets/imagens/crime.webp',
      },
      {
        'title': 'O Olho Mais Azul',
        'author': 'Toni Morrison',
        'imagePath':
            'assets/imagens/oceano.webp', // Link quebrado de propósito!
      },
      {
        'title': 'Frankenstein',
        'author': 'Mary Shelley',
        'imagePath': 'assets/imagens/franks.webp',
      },
      {
        'title': 'O Médico e o Monstro',
        'author': 'Robert Louis Stevenson',
        'imagePath': 'assets/imagens/medico.jpg',
      },
    ];
  }
}
