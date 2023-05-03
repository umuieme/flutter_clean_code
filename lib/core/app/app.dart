import 'package:clean_code_architecture/features/user_listing/presentation/screens/user_list_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const UserListScreen(),
    );
  }
}
