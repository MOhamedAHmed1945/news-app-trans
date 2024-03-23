import 'package:flutter/material.dart';
import 'Screens/home_screen.dart';
import 'ThemeApp/theme_app.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.lightColorTheme,
      // darkTheme: ThemeApp.darkMode,
      // themeMode: provider.appTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}