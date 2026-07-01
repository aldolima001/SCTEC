import 'package:projeto_camiseta_outisder/app/data/camisa_model.dart';
import 'package:projeto_camiseta_outisder/app/data/camisa_service.dart';

class CamisaRepository {
  final _service = CamisaService();

  CamisaModel buscarCamisa() => CamisaModel.fromJson(_service.buscarCamisa());
}
