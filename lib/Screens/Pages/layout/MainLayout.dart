import 'package:c_proto/Constants/Design/color_schemes.g.dart';
import 'package:c_proto/Screens/Pages/main/Attachment.dart';
import 'package:c_proto/Screens/Pages/main/ReportPage.dart';
import 'package:flutter/material.dart';
import 'package:c_proto/Screens/Pages/main/ProfilePage.dart';

class Mainlayout extends StatefulWidget {
  const Mainlayout({Key? key}) : super(key: key);

  @override
  State<Mainlayout> createState() => _MainlayoutState();
}

class _MainlayoutState extends State<Mainlayout> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: <Widget>[ReportPage(),Attachment(),ProfilePage(),ProfilePage(),][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index){
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: [
        NavigationDestination(icon: Icon(Icons.edit_note), label: 'Report'),
        NavigationDestination(icon: Icon(Icons.attachment), label: 'Attach'),
        NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
      ],

      ),
    );
  }
}






