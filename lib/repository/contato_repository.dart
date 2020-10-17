import 'package:contato_form/model/contato.dart';
import 'package:contato_form/model/contato_type.dart';

class ContatoRepository {
  static List<Contato> contatos = [];

  ContatoRepository() {
    if (contatos.isEmpty) {
      contatos.add(new Contato(
          nome: "Joao", telefone: "99879-8778", tipo: ContatoType.CELULAR));

      contatos.add(new Contato(
          nome: "Lucas", telefone: "99879-8888", tipo: ContatoType.CELULAR));

      contatos.add(new Contato(
          nome: "Maria", telefone: "98798-7777", tipo: ContatoType.FAVORITO));

      contatos.add(new Contato(
          nome: "Thiago", telefone: "3379-9999", tipo: ContatoType.CASA));

      contatos.add(new Contato(
          nome: "Mariana", telefone: "3379-9999", tipo: ContatoType.CASA));

      contatos.add(new Contato(
          nome: "Beatriz", telefone: "98887-7777", tipo: ContatoType.FAVORITO));

      contatos.add(new Contato(
          nome: "Liz", telefone: "3661-9999", tipo: ContatoType.TRABALHO));

      contatos.add(new Contato(
          nome: "Matheus", telefone: "3344-9999", tipo: ContatoType.TRABALHO));

      contatos.sort((a, b) => a.nome.compareTo(b.nome));
    }
  }

  findAllContatos() {
    return contatos;
  }
}
