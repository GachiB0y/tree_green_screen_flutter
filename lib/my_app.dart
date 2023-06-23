import 'package:flutter/material.dart';
import 'package:tree_green_screen_flutter/ui/screen/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const UserMainScreen(),
    );
  }
}
