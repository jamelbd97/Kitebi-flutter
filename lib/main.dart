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
    final ThemeData globalTheme = Provider.of<GlobalTheme>(context).globalTheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          systemNavigationBarColor: customLight,
          systemNavigationBarIconBrightness: Brightness.dark),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kitebi',
          themeMode: ThemeMode.light,
          theme: globalTheme,
          home: const Home()),
    );
  }
}
