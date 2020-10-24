import 'package:brasil_fields/formatter/cpf_input_formatter.dart';
import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:contato_form/model/contato_type.dart';
import 'package:contato_form/repository/contato_repository.dart';
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
  void initState() {
    super.initState();
  }

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
                      initialValue: contato.nome,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Nome"),
                      maxLength: 100,
                    )),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
              initialValue: contato.telefone,
              keyboardType: TextInputType.number,
              onChanged: updateTelefone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Celular"),
            ),
            Observer(
                builder: (_) => TextFormField(
                      initialValue: contato.email,
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
              initialValue: contato.cpf,
              onChanged: updateCpf,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "CPF"),
            ),
            Observer(
                builder: (_) => DropdownButtonFormField<ContatoType>(
                      value: contato.tipo,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      items: ContatoType.values.map((ContatoType value) {
                        return DropdownMenuItem<ContatoType>(
                          value: value,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ContatoHelper.getIconByContatoType(value),
                              Text(ContatoHelper.getDescription(value)),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: updateTipoContato,
                    )),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    ContatoRepository().saveContato(contato.toContato());
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("/", (_) => false);
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

  void updateTipoContato(ContatoType tipoContato) =>
      contato.setTipo(tipoContato);

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
