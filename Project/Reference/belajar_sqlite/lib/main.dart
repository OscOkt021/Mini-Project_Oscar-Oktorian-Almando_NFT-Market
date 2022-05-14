import 'package:belajar_sqlite/presentation/home/main_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Latihan SQLite",
      home: const MainHome(),
    );
  }
}
