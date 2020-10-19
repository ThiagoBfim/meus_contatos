// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContatoModel on BaseContatoModel, Store {
  final _$nomeAtom = Atom(name: 'BaseContatoModel.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$emailAtom = Atom(name: 'BaseContatoModel.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$tipoAtom = Atom(name: 'BaseContatoModel.tipo');

  @override
  ContatoType get tipo {
    _$tipoAtom.reportRead();
    return super.tipo;
  }

  @override
  set tipo(ContatoType value) {
    _$tipoAtom.reportWrite(value, super.tipo, () {
      super.tipo = value;
    });
  }

  final _$BaseContatoModelActionController =
      ActionController(name: 'BaseContatoModel');

  @override
  dynamic setEmail(String email) {
    final _$actionInfo = _$BaseContatoModelActionController.startAction(
        name: 'BaseContatoModel.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$BaseContatoModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTipo(ContatoType tipo) {
    final _$actionInfo = _$BaseContatoModelActionController.startAction(
        name: 'BaseContatoModel.setTipo');
    try {
      return super.setTipo(tipo);
    } finally {
      _$BaseContatoModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNome(String nome) {
    final _$actionInfo = _$BaseContatoModelActionController.startAction(
        name: 'BaseContatoModel.setNome');
    try {
      return super.setNome(nome);
    } finally {
      _$BaseContatoModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
email: ${email},
tipo: ${tipo}
    ''';
  }
}
