import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/counter_viewmodel.dart';
import 'viewmodels/counter_viewmodelmotos.dart';
import 'views/screens/main_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MotorsViewModel()),
        ChangeNotifierProvider(create: (_) => UsersViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          secondary: Colors.orange,
          tertiary: Colors.teal,
        ),
      ),
      home: const MainScreen(),
    );
  }
}