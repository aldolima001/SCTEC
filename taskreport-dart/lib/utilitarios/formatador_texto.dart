class FormatadorTexto {
  static String removerEspacos(dynamic texto) {
    return texto == null ? "" : texto.toString().trim();
  }
}