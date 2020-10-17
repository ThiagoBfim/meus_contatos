import 'package:contato_form/lista_contato/list_contato_page.dart';
import 'package:contato_form/novo_contato/new_contato_page.dart';
import 'package:flutter/material.dart';

class ContatoDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('thiago@gmail.com'),
            accountName: Text('Thiago'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "T",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          ListTile(
            title: Text('Novo Contato'),
            onTap: () => sendTo(context, NewContatoPage()),
          ),
          ListTile(
            title: Text('Contatos'),
            onTap: () => sendTo(context, ListContatoPage()),
          ),
          ListTile(
            title: Text('Termos de uso'),
            onTap: () => sendTo(context, Container()),
          ),
        ],
      ),
    );
  }

  sendTo(BuildContext context, Widget page) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) => page));
  }
}
