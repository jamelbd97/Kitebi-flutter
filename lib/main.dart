import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kitebi/global_theme.dart';
import 'package:kitebi/Views/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(

    /// Providers are above [Root App] instead of inside it, so that tests
    /// can use [Root App] while mocking the providers
    MultiProvider(
      providers: [
        Provider<GlobalTheme>(
          create: (context) => GlobalTheme(),
        )
      ],
      child: const KitebiMainApp(),
    ),
  );
}

class KitebiMainApp extends StatelessWidget {
  const KitebiMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark));

    final ThemeData globalTheme = Provider
        .of<GlobalTheme>(context)
        .globalTheme;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kitebi',
        theme: globalTheme,
        home: const Home());
  }
}