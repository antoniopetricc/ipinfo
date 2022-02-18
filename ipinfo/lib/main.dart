import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipinfo/di/dependency_injector.dart';
import 'package:ipinfo/pages/home/home.dart';
import 'package:ipinfo/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DependencyInjector(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ipinfo',
        theme: ThemeData(
          scaffoldBackgroundColor: Styles.kScaffold,
          primaryColor: Styles.kPrimary,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        home: const HomeView(),
      ),
    );
  }
}
