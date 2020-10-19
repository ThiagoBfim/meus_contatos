import 'package:brasil_fields/formatter/cpf_input_formatter.dart';
import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'contato_model.dart';

class ContatoForm extends StatefulWidget {
  final ContatoModel contato;

  const ContatoForm({Key key, this.contato}) : super(key: key);

  @override
  _ContatoFormState createState() => _ContatoFormState(this.contato);
}

class _ContatoFormState extends State<ContatoForm> {
  final ContatoModel contato;
  final _formKey = GlobalKey<FormState>();

  _ContatoFormState(this.contato);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 20, // to apply margin in the main axis of the wrap
          runSpacing: 10, // to apply margin in the cross axis of the wrap
          children: <Widget>[
            Observer(
                builder: (_) => TextFormField(
                      validator: nomeValidator(),
                      onChanged: updateNome,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Nome"),
                      maxLength: 100,
                    )),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
              keyboardType: TextInputType.number,
              onChanged: updateTelefone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Celular"),
            ),
            Observer(
                builder: (_) => TextFormField(
                      validator: emailValidator(),
                      onChanged: contato.setEmail,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "E-mail",
                          errorText: emailTextValidator()),
                    )),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
              onChanged: updateCpf,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "CPF"),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    print(contato.toJson());
                  }
                },
                child: Text('Salvar'))
          ],
        ),
      ),
    );
  }

  String emailTextValidator() =>
      contato.email != null ? emailValidator().call(contato.email) : null;

  void updateCpf(cpf) => contato.cpf = cpf;

  void updateTelefone(telefone) => contato.telefone = telefone;

  void updateNome(nome) {
      contato.setNome(nome);
  }

  TextFieldValidator emailValidator() {
    return EmailValidator(errorText: 'e-mail inválido');
  }

  FieldValidator nomeValidator() {
    return MultiValidator([
      RequiredValidator(errorText: 'campo obrigatório'),
      MinLengthValidator(4, errorText: 'tamanho mínimo de 4 caracteres'),
    ]);
  }
}
