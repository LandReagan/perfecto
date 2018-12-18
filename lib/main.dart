import 'package:flutter/material.dart';

import 'package:perfecto/themes/themes.dart';
import 'package:perfecto/pages/HomePage.dart';


void main() => runApp(PerfectOApp());

/// Entry class to build the Material App
class PerfectOApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PerfectO!',
      theme: getDefaultTheme(),
      home: HomePage(title: 'PerfectO!'),
    );
  }
}
