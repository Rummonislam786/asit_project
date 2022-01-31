// ignore_for_file: camel_case_types, prefer_const_constructors, duplicate_ignore, file_names

import 'package:asit_project/secondscreen.dart';
import 'package:flutter/material.dart';

class userpage extends StatelessWidget {
  final String name;
  final String age;
  const userpage({Key? key, required this.name, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
        title: Text("user Details"),
      ),
      endDrawer: MainappDrawer(),
      body: Center(
        child: Text('user name is $name and user is $age years old'),
      ),
    );
  }
}
