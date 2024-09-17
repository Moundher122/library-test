import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/sttman/bloc/explre_bloc.dart';
import 'package:libraryapp/sttman/bloc/user_bloc.dart';
import 'package:libraryapp/ui/screens/Homepage.dart';

import 'ui/screens/splashscreen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ExplreBloc(),
      ),
      BlocProvider(
        create: (context) => UserBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
      routes: {
        'splash': (context) => const SplashScreen(),
        'Home':(context) =>  Homepage()},
        navigatorObservers: [routeObserver],
    );
  }
}
