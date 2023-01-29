
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/splashScreen/SplashScreen.dart';
import 'providers/loginPageProvider.dart';
import 'providers/registerPageProviders.dart';
import 'providers/timer.dart';

void main() {

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginProviders()),
    ChangeNotifierProvider(create: (_) => RegisterProvider()),
    ChangeNotifierProvider(create: (_) => TimerProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
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
