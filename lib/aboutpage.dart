// ignore_for_file: prefer_const_constructors

import 'package:asit_project/secondscreen.dart';
import 'package:flutter/material.dart';

class aboutsection extends StatelessWidget {
  const aboutsection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading:
              (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
          title: Text("Listpage")),
      endDrawer: MainappDrawer(),
      body: ListView(
        children: [
          ListTile(
            tileColor: Colors.purpleAccent[600],
            title: Text("Name: Rummon"),
          ),
          ListTile(
            tileColor: Colors.purpleAccent[600],
            title: Text("Age: 19"),
          ),
          ListTile(
            tileColor: Colors.purpleAccent[600],
            title: Text("Company: ASIT"),
          ),
          ListTile(
            tileColor: Colors.purpleAccent[600],
            title: Text("Details: New Intern"),
          ),
        ],
      ),
    );
  }
}
