// ignore_for_file: prefer_const_constructors, file_names, camel_case_types

import 'package:asit_project/secondscreen.dart';
import 'package:flutter/material.dart';

class settingsPage extends StatelessWidget {
  const settingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading:
              (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
          title: Text("Listpage")),
      endDrawer: MainappDrawer(),
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              Card(
                color: Colors.amber[300],
                elevation: 20,
                child: ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text("User Settings"),
                  onTap: () {},
                ),
              ),
              Card(
                color: Colors.amber[300],
                elevation: 20,
                child: ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text("Change Password"),
                  onTap: () {},
                ),
              ),
              Card(
                color: Colors.amber[300],
                elevation: 20,
                child: ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text("Change Banner"),
                  onTap: () {},
                ),
              ),
              Card(
                color: Colors.amber[300],
                elevation: 20,
                child: ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text("Change Info"),
                  onTap: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
