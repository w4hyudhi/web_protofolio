import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protofolio/pages/home/home.dart';
import 'package:protofolio/utils/constans.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahfud Wahyudi',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: Theme.of(context).copyWith(
          platform: TargetPlatform.android,
          scaffoldBackgroundColor: kBackgroundColors,
          primaryColor: kPrimaryColors,
          canvasColor: kBackgroundColors,
          textTheme: GoogleFonts.latoTextTheme(),
          highlightColor: Color(0xffffc600)),
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget),
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.resize(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.resize(2460, name: "4K"),
        ],
        background: Container(
          color: kBackgroundColors,
        ),
      ),
      home: Home(),
    );
  }
}
