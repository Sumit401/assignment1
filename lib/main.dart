import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SplashScreen.dart';
import 'providers/loginPageProvider.dart';
import 'providers/registerPageProviders.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginProviders()),
    ChangeNotifierProvider(create: (_) => RegisterProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Montserrat",
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
