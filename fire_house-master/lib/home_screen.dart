import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/biblia.dart';
import './screens/live.dart';
import './screens/programation.dart';
import './screens/localization.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;
  final _pageOptions = [
    HomePage(),
    BibliaPage(),
    LivePage(),
    ProgramationPage(),
    LocalizationPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('Fire House'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(child: _pageOptions[_selectedPage]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.import_contacts),
              title: Text('Biblia'),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.live_tv),
              title: Text('Live'),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range),
              title: Text('Programação'),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              title: Text('Localização'),
              backgroundColor: Colors.black),
        ],
      ),
    );
  }
}
