import 'package:mobx/mobx.dart';

part 'contato_model.g.dart';

class ContatoModel = BaseContatoModel with _$ContatoModel;

abstract class BaseContatoModel with Store {
  String nome;

  @observable
  String email;

  String cpf;
  String telefone;
  ContatoType tipo;

  @action
  setEmail(String email) {
    this.email = email;
  }

  String toJson() {
    return '{nome: $nome, email: $email, cpf: $cpf, telefone: $telefone, tipo: $tipo}';
  }
}

enum ContatoType { CELULAR, TRABALHO, FAVORITO, CASA }