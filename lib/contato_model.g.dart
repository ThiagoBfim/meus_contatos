// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContatoModel on BaseContatoModel, Store {
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
  String toString() {
    return '''
email: ${email}
    ''';
  }
}
