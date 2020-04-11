// Mobile Application Programming (SCSJ3623)
// Semester 2, 2019/2020

// Exercise 1: Basic State Management with Stateful Widgets

// Write your name and your partner's.
// Only one submission is required per pair
// Submit only the source code file (main.dart)

//! Name 1:  Tazin Ibna Jalil
//! Name 2:  Niloy Bhattacharjee

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'MAP Exercise 1',
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _size = 150.0;
  double _angle = 0.0;

  get size => _size;
  get angle => _angle;

  set size(value) => setState(() {
        _size = value;
      });
  set angle(value) => setState(() {
        _angle = value;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.rotate(
            angle: ((_angle * 3.1415927) / 180), child: aflutterLogo()),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          aButton(
            'Small',
            Icon(Icons.photo_size_select_small),
            () {
              size = 50.0;
            },
          ),
          aButton(
            'Medium',
            Icon(Icons.image),
            () {
              size = 150.0;
            },
          ),
          aButton(
            'Large',
            Icon(Icons.photo_size_select_large),
            () {
              size = 300.0;
            },
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 150.0,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Logo size : ${_size.toStringAsFixed(0)}'),
                SizedBox(width: 8),
                Text('Rotation : ${_angle.toStringAsFixed(0)} degree'),
              ],
            ),
            aSlider(
              _size,
              (value) {
                size = value;
              },
              300.0,
            ),
            aSlider(
              _angle,
              (value) {
                angle = value;
              },
              360.0,
            ),
          ],
        ),
      ),
    );
  }

  FlutterLogo aflutterLogo() => FlutterLogo(size: _size);
}

FloatingActionButton aButton(btnName, icon, function) {
  return FloatingActionButton.extended(
    onPressed: function,
    label: Text(btnName),
    icon: icon,
  );
}

Slider aSlider(value, function, max) {
  return Slider(
    min: 0.0,
    max: max,
    value: value,
    onChanged: function,
  );
}
