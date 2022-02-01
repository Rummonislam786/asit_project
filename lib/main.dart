// ignore_for_file: prefer_const_constructors
import 'package:asit_project/aboutpage.dart';
import 'package:flutter/material.dart';
import 'Settings.dart';
import 'secondscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final title = 'Home Page';

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ASIT Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.mochiyPopOneTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: homepage(title: title),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String location = "";
  String Address = "";
  //Position? position;

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROJECT"),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Text("Side menu bar/Drawer $Address"),
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
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
              title: Text("Device Information"),
              onTap: () {},
              trailing: Icon(Icons.accessibility_new),
            ),
            ListTile(
              title: Text("Address: $Address"),
            ),
            ListTile(
              title: Text("Latitude: } "),
            ),
            Center(
              child: ListTile(
                  onTap: () async {
                    Position position = await _getGeoLocationPosition();
                    location =
                        'Lat: ${position.latitude} , Long: ${position.longitude}';
                    GetAddressFromLatLong(position);
                  },
                  title: Text("Get Location $location")),
            )
          ],
        ),
      ),
      body: MainMenuBody(),
    );
  }
}

class MenuData {
  MenuData(this.title);
  final String title;
}

class MainMenuBody extends StatelessWidget {
  const MainMenuBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MenuData> menu = [
      MenuData('Menu 1'),
      MenuData('Menu 2'),
      MenuData('Menu 3'),
      MenuData('Menu 4'),
      MenuData('Menu 5'),
      MenuData('Menu 6'),
      MenuData('Menu 7'),
      MenuData('Menu 8'),
      MenuData('Menu 9'),
      MenuData('Menu 10')
    ];
    void pressedthegrid(BuildContext context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Secondpage()));
    }

    return Scrollbar(
      thickness: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: menu.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.indigo[100],
                    elevation: 0.2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: InkWell(
                      onTap: () {
                        pressedthegrid(context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 20),
                          Text(
                            menu[index].title,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 20, color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
