import 'package:flutter/material.dart';
import 'package:my_app/common/user_bottom_bar.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/auth/screens/auth_screen.dart';
import 'package:my_app/features/auth/services/auth_services.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  final AuthServices _authServices = AuthServices();
  @override
  void initState() {
    _authServices.getUserData(context: context);
    super.initState();
  }

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
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty ? const UserBottomBar() : const AuthScreen()
    );
  }
}
