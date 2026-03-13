import 'package:flutter/material.dart';
import 'package:ostad_14_xylophone_app_media_player/presentation/screens/home/home_screen.dart';
import 'package:ostad_14_xylophone_app_media_player/presentation/screens/home/provider/media_provider.dart';
import 'package:provider/provider.dart';
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => MediaProvider())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
