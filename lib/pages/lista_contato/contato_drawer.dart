import 'package:contato_form/pages/novo_contato/new_contato_page.dart';
import 'package:flutter/material.dart';

import 'list_contato_page.dart';

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
    Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (_) => page), ModalRoute.withName('/'));
  }
}
