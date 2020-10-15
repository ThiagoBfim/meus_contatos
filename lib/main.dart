import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contato Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ContatoModel contato = new ContatoModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contato.nome ?? ''),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 20, // to apply margin in the main axis of the wrap
            runSpacing: 10, // to apply margin in the cross axis of the wrap
            children: <Widget>[
              TextFormField(
                validator: nomeValidator(),
                onChanged: updateNome,
                decoration: InputDecoration(labelText: "Nome"),
                maxLength: 100,
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
                keyboardType: TextInputType.number,
                onChanged: updateTelefone,
                decoration: InputDecoration(labelText: "Celular"),
              ),
              TextFormField(
                validator: emailValidator(),
                onChanged: updateEmail,
                decoration: InputDecoration(labelText: "E-mail"),
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
                onChanged: updateCpf,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "CPF"),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print(contato);
                    }
                  },
                  child: Text('Salvar'))
            ],
          ),
        ),
      ),
    );
  }

  void updateCpf(cpf) => contato.cpf = cpf;

  void updateEmail(email) => contato.email = email;

  void updateTelefone(telefone) => contato.telefone = telefone;

  void updateNome(nome) {
    setState(() {
      contato.nome = nome;
    });
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

class ContatoModel {
  String nome;
  String email;
  String cpf;
  String telefone;
  ContatoType tipo;

  @override
  String toString() {
    return '{nome: $nome, email: $email, cpf: $cpf, telefone: $telefone, tipo: $tipo}';
  }
}

enum ContatoType { CELULAR, TRABALHO, FAVORITO, CASA }
