import 'package:contato_form/model/contato_type.dart';
import 'package:contato_form/repository/contato_repository.dart';
import 'package:flutter/material.dart';

class ListContatoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meus Contatos'),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              var contato = new ContatoRepository().findAllContatos()[index];
              return ListTile(
                leading: CircleAvatar(
                  child: ContatoHelper.getIconByContatoType(contato.tipo),
                  backgroundColor: Colors.blue[200],
                ),
                title: Text(contato.nome),
                subtitle: Text(contato.telefone),
                trailing: IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () => {},
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: new ContatoRepository().findAllContatos().length));
  }
}
