import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/counter_viewmodel.dart';
import 'views/counter_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterViewModel(),
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
      title: 'MVVM Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterView(),
    );
  }
}
