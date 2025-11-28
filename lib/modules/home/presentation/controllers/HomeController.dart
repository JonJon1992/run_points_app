import 'package:get/get.dart';

import '../../domain/entities/Desafio.dart';

class HomeController extends GetxController {
  HomeController();

  final RxList<Desafio> desafios = <Desafio>[].obs;
  final RxString dificuldadeSelecionada = 'medio'.obs;
  final RxDouble progressoGeral = 0.0.obs; // 0% para zero data

  bool get isZeroData => progressoGeral.value == 0.0;

  @override
  void onInit() {
    super.onInit();
    carregarDesafios();
  }

  void carregarDesafios() {
    desafios.value = [
      Desafio(
        id: '1',
        titulo: 'Gerenciamento de Estado',
        progressoAtual: 3,
        progressoTotal: 10,
        icone: 'state_management',
        dificuldade: 'medio',
      ),
      Desafio(
        id: '2',
        titulo: 'Construindo Interfaces',
        progressoAtual: 10,
        progressoTotal: 10,
        icone: 'laptop',
        dificuldade: 'facil',
      ),
      Desafio(
        id: '3',
        titulo: 'Integração Nativa',
        progressoAtual: 9,
        progressoTotal: 10,
        icone: 'hierarchy',
        dificuldade: 'medio',
      ),
      Desafio(
        id: '4',
        titulo: 'Widgets do Flutter',
        progressoAtual: 5,
        progressoTotal: 10,
        icone: 'blocks',
        dificuldade: 'medio',
      ),
      Desafio(
        id: '5',
        titulo: 'Construindo Interfaces',
        progressoAtual: 10,
        progressoTotal: 10,
        icone: 'laptop',
        dificuldade: 'facil',
      ),
      Desafio(
        id: '6',
        titulo: 'Gerenciamento de Estado',
        progressoAtual: 3,
        progressoTotal: 10,
        icone: 'state_management',
        dificuldade: 'medio',
      ),
    ];
  }

  /// Filtra desafios por dificuldade
  /// Por enquanto, mostra todos os desafios independente do filtro
  /// (conforme design do Figma)
  List<Desafio> get desafiosFiltrados {
    // TODO: Implementar filtro real quando necessário
    return desafios;
  }

  /// Seleciona uma dificuldade
  void selecionarDificuldade(String dificuldade) {
    dificuldadeSelecionada.value = dificuldade;
  }

  /// Obtém o nome do usuário
  String get nomeUsuario => 'Usuário';
}
