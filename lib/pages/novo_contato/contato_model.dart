import 'package:contato_form/model/contato.dart';
import 'package:contato_form/model/contato_type.dart';
import 'package:mobx/mobx.dart';

part 'contato_model.g.dart';

class ContatoModel = BaseContatoModel with _$ContatoModel;

abstract class BaseContatoModel with Store {
  @observable
  String nome;

  @observable
  String email;

  String cpf;
  String telefone;

  @observable
  ContatoType tipo;

  @action
  setEmail(String email) {
    this.email = email;
  }

  @action
  setTipo(ContatoType tipo) {
    this.tipo = tipo;
  }

  @action
  setNome(String nome) {
    this.nome = nome;
  }

  String toJson() {
    return '{nome: $nome, email: $email, cpf: $cpf, telefone: $telefone, tipo: $tipo}';
  }

  Contato toContato() {
    return Contato(nome: nome, telefone: telefone, tipo: tipo, cpf: cpf);
  }

  static ContatoModel fromContato(Contato contato) {
    var contatoModel = ContatoModel();
    contatoModel.nome = contato.nome;
    contatoModel.telefone = contato.telefone;
    contatoModel.tipo = contato.tipo;
    contatoModel.cpf = contato.cpf;
    return contatoModel;
  }
}
