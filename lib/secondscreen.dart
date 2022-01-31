// ignore_for_file: prefer_const_constructors
import 'package:asit_project/Thirdscreen.dart';
import 'package:asit_project/aboutpage.dart';
import 'package:flutter/material.dart';
import 'Settings.dart';

class Secondpage extends StatelessWidget {
  const Secondpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
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
                  title: Text("Rummon"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => userpage(
                              age: '20',
                              name: 'Rummon',
                            )));
                  },
                ),
              ),
              Card(
                elevation: 20,
                color: Colors.amber[300],
                child: ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text("Seyam"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            userpage(age: '17', name: 'Seyam')));
                  },
                ),
              ),
              Card(
                color: Colors.amber[300],
                elevation: 20,
                child: ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text("Monowar"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => userpage(
                              age: '28',
                              name: 'Karim',
                            )));
                  },
                ),
              ),
              Card(
                color: Colors.amber[300],
                elevation: 20,
                child: ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text("Baizid"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            userpage(age: '25', name: 'Baizid')));
                  },
                ),
              ),
              Card(
                color: Colors.amber[300],
                child: ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text("Mahmud"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            userpage(age: '26', name: 'Mahmud')));
                  },
                ),
              ),
              Card(
                color: Colors.amber[300],
                child: ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text("Shishir"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            userpage(age: '23', name: 'Shishir')));
                  },
                ),
              ),
              Card(
                color: Colors.amber[300],
                child: ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text("Showkhin"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            userpage(age: '24', name: 'Showkhin')));
                  },
                ),
              ),
              Card(
                color: Colors.amber[300],
                child: ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text("Maruf"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            userpage(age: '20', name: 'Maruf')));
                  },
                ),
              ),
              Card(
                color: Colors.amber[300],
                child: ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text("Delowar"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            userpage(age: '28', name: 'Delowar')));
                  },
                ),
              ),
              Card(
                color: Colors.amber[300],
                child: ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text("Hridoy"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            userpage(age: '27', name: 'Hridoy')));
                  },
                ),
              ),
              Card(
                color: Colors.amber[300],
                child: ListTile(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text("Sakib"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            userpage(age: '25', name: 'Sakib')));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MainappDrawer extends StatelessWidget {
  const MainappDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Text("Side menu bar/Drawer"),
          ),
          ListTile(
            title: Text("Home"),
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            trailing: Icon(Icons.home),
          ),
          ListTile(
            title: Text("Settings"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => settingsPage()));
            },
            trailing: Icon(Icons.settings),
          ),
          ListTile(
            title: Text("About"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => aboutsection()));
            },
            trailing: Icon(Icons.badge),
          ),
          ListTile(
            title: Text("Device Manager"),
            onTap: () {},
            trailing: Icon(Icons.accessibility_new),
          ),
        ],
      ),
    );
  }
}
