import 'package:flutter/material.dart';
import 'package:projeto_camiseta_outisder/app/data/camisa_model.dart';
import 'package:projeto_camiseta_outisder/app/data/compra_model.dart';
import 'package:projeto_camiseta_outisder/app/utils/extensions.dart';
import 'package:projeto_camiseta_outisder/app/view/home_viewmodel.dart';
// Mantendo a importação do arquivo em inglês conforme a nomenclatura do projeto
import 'package:projeto_camiseta_outisder/app/view/widgets/purchase_success_dialog.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> _corSelecionada;
  late String _caminhoImagem;
  late String _tamanhoSelecionado;
  bool _paraPresente = false;
  int _parcelas = 1;
  int _quantidade = 1;

  final HomeViewmodel _viewmodel = HomeViewmodel();
  late CamisaModel _productModel;
  @override
  void initState() {
    super.initState();
    _productModel = _viewmodel.getProduct();
    _corSelecionada = _productModel.modelos.first;
    _caminhoImagem = _corSelecionada['imagePath'] ?? '';

    _tamanhoSelecionado = _productModel.tamanhosDisponiveis.first;
  }

  double get _valorTotal {
    //Getter para calcular o valor total em um único lugar "valor computado"
    double subtotal = _productModel.precoBase * _quantidade;

    if (_paraPresente) {
      subtotal += _productModel.valorPresente;
    }

    if (_parcelas > 1) {
      double jurosPorcentagem = _parcelas * _productModel.jurosPorParcela;
      return subtotal + (subtotal * jurosPorcentagem);
    }

    return subtotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Loja Outsider',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    //Bloco imagem e RadioButton
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Selecione a Cor:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _productModel.modelos.map((Map map) {
                              return Row(
                                children: [
                                  Radio<Map>(
                                    value: map,
                                    groupValue: _corSelecionada,
                                    onChanged: (valor) {
                                      setState(() {
                                        _corSelecionada =
                                            valor as Map<String, dynamic>;
                                        _caminhoImagem =
                                            valor['imagePath'] ?? '';
                                      });
                                    },
                                  ),
                                  // Capitaliza a primeira letra da cor de forma segura
                                  Text(
                                    map['cor'].toString().firstCharUpperCase(),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 180,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Image.asset(
                            _caminhoImagem,
                            errorBuilder: (context, error, stackTrace) =>
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.checkroom,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      _caminhoImagem,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    //Escolhar do tamanho
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tamanho:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DropdownButton<String>(
                        value: _tamanhoSelecionado,
                        items: _productModel.tamanhosDisponiveis.map((
                          String tamanho,
                        ) {
                          return DropdownMenuItem<String>(
                            value: tamanho,
                            child: Text(tamanho),
                          );
                        }).toList(),
                        onChanged: (String? novoTamanho) {
                          if (novoTamanho != null) {
                            setState(() => _tamanhoSelecionado = novoTamanho);
                          }
                        },
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    //Escolha da quantidade
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Quantidade:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Colors.red,
                            ),
                            onPressed: _quantidade > 1
                                ? () => setState(() => _quantidade--)
                                : null,
                          ),
                          Text(
                            '$_quantidade',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.green,
                            ),
                            onPressed: () => setState(() => _quantidade++),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    //Checbox se é pra presente
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Embalar para presente? (+ R\$ ${_productModel.valorPresente.toStringAsFixed(2)})',
                      ),
                      Checkbox(
                        value: _paraPresente,
                        onChanged: (bool? valor) {
                          setState(() => _paraPresente = valor ?? false);
                        },
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(
                    'Parcelas: $_parcelas x',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Slider(
                    value: _parcelas.toDouble(),
                    min: 1,
                    max: _productModel.maxParcelas.toDouble(),
                    divisions: _productModel.maxParcelas - 1,
                    label: _parcelas.toString(),
                    onChanged: (double novoValor) {
                      setState(() => _parcelas = novoValor.toInt());
                    },
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Total: R\$ ${_valorTotal.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          '($_parcelas x de R\$ ${(_valorTotal / _parcelas).toStringAsFixed(2)})',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final novaCompra = CompraModel(
                          cor: _corSelecionada['cor'] as String,
                          tamanho: _tamanhoSelecionado,
                          quantidade: _quantidade,
                          paraPresente: _paraPresente,
                          parcelas: _parcelas,
                          valorTotal: _valorTotal,
                        );

                        print(novaCompra);

                        // Chamando o Diálogo com o parâmetro em inglês e exibição tratada
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) =>
                              PurchaseSuccessDialog(totalValue: _valorTotal),
                        );
                      }
                    },
                    child: const Text(
                      'Finalizar Comra',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
