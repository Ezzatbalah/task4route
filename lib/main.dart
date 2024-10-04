import 'package:flutter/material.dart';

import 'Screens/home_page.dart';

void main() {
  runApp(const ContantScreen());
}

class ContantScreen extends StatelessWidget {
  const ContantScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
