class FormatadorMonetario {
  static double paraDouble(dynamic valorMoeda) {
    if (valorMoeda == null) return 0.0;
    
    String texto = valorMoeda.toString();
    
    bool ehNegativo = texto.contains('-');
    
    // Limpa tudo o que não é número, vírgula ou ponto
    String limpo = texto;
    limpo = limpo.replaceAll("R\$", "");
    limpo = limpo.replaceAll("-", "");
    limpo = limpo.replaceAll(".", "");
    limpo = limpo.replaceAll(",", ".");
    limpo = limpo.trim();
    
    double resultado = double.tryParse(limpo) ?? 0.0;
    
    return ehNegativo ? resultado * -1 : resultado;
  }

  static int paraInteiro(dynamic valorNumero) {
    if (valorNumero == null) return 0;
    
    String texto = valorNumero.toString();
    bool ehNegativo = texto.contains('-');
    
    String limpo = texto.replaceAll("-", "").trim();
    int resultado = int.tryParse(limpo) ?? 0;
    
    return ehNegativo ? resultado * -1 : resultado;
  }
}