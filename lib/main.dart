import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/auth/screens/auth_screen.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:my_app/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tai Shopping App',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        colorScheme: const ColorScheme.light().copyWith(
          primary: GlobalVariables.secondaryColor,
        ),
      ),
      onGenerateRoute: (settings) => onGeneratedRoute(settings),
      home: const AuthScreen(),
    );
  }
}
