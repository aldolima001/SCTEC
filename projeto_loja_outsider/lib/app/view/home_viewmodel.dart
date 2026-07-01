import 'package:projeto_camiseta_outisder/app/data/camisa_model.dart';
import 'package:projeto_camiseta_outisder/app/data/camisa_repository.dart';

class HomeViewmodel {
  final _repository = CamisaRepository();

  CamisaModel getProduct() => _repository.buscarCamisa();
}
