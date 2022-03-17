import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kitebi/global_theme.dart';
import 'package:kitebi/Views/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
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
        statusBarColor: Colors.white,
        systemNavigationBarColor: customLight,
        systemNavigationBarIconBrightness: Brightness.dark));

    final ThemeData globalTheme = Provider.of<GlobalTheme>(context).globalTheme;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kitebi',
        theme: globalTheme,
        home: const Home());
  }
}
