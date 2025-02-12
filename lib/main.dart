
import 'package:flutter/material.dart';

import 'conectivity_plus/conectivity_Page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Screens(),
      },
    );
  }
}
