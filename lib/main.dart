import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'My_practice/color_change_provider.dart';
import 'My_practice/color_changedemo.dart';
import 'My_practice/tic_tocdemo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return ColorChangeProvider();
          },
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TicTocDemo(),
      ),
    );
  }
}
