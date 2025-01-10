import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_list/view/home_page.dart';

import 'controller/user_controller.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
      ChangeNotifierProvider(create: (_) => UserController()),
    ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User list',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

