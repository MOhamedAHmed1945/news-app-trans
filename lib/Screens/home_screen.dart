import 'package:flutter/material.dart';
import 'package:flutter_application_news/Screens/category_fragment_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = 'homeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
          style: Theme.of(context).textTheme.titleLarge!,
        ),
      ),
      body: CategoryFragmentScreen(),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//   static String routeName = 'homeScreen';
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           color: ThemeApp.whiteColor,
//           child: Image.asset(''),
//         ),
//       ],
//     );
//   }
// }
