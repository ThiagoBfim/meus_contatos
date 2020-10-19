import 'package:flutter/widgets.dart';

import 'contato_type.dart';

class Contato {
  final String nome;
  final String telefone;
  final String cpf;
  final ContatoType tipo;

  Contato({@required this.nome, @required this.telefone, @required this.tipo, @required this.cpf});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Contato &&
          runtimeType == other.runtimeType &&
          telefone == other.telefone;

  @override
  int get hashCode => telefone.hashCode;
}
