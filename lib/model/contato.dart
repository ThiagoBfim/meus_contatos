import 'package:flutter/widgets.dart';

import 'contato_type.dart';

class Contato {
  final String nome;
  final String telefone;
  final ContatoType tipo;

  Contato({@required this.nome, @required this.telefone, @required this.tipo});
}
