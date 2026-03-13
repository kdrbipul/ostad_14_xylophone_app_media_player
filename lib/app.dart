import 'package:flutter/material.dart';
import 'package:ostad_14_xylophone_app_media_player/presentation/screens/home/home_screen.dart';
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
