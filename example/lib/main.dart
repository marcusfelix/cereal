import 'package:cereal/cereal.dart';
import 'package:example/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return CerealApp(
      routes: {'/': (context) => const Home()},
    );
  }
}
