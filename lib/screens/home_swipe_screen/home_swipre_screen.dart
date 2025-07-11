import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeSwipreScreen extends StatelessWidget {
  const HomeSwipreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Column(children: [Text('Home Screen')])),
        ],
      ),
    );
  }
}
