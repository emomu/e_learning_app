import 'package:elearningapp/data/repo/auth/login/login_repo.dart';
import 'package:elearningapp/views/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white10),
          useMaterial3: true,
        ),
        home: RepositoryProvider(
          create: (context) => LoginRepo(),
            child: LoginScreen())
    );
  }
}

