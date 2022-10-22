import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spajam2022/ui/pages/home_page.dart';
import 'package:spajam2022/ui/pages/room_enter_page.dart';
import 'package:spajam2022/ui/pages/room_roby_page.dart';
import 'package:spajam2022/ui/pages/writing_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.from(
            colorScheme: const ColorScheme.light(
              primary: Color(0xffFC7D3C),
              background: Color(0xfff2f2f7),
            ),
            textTheme: TextTheme(
              headline1: GoogleFonts.shipporiMincho(
                  fontSize: 96,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -1.5),
              headline2: GoogleFonts.shipporiMincho(
                  fontSize: 60,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.5),
              headline3: GoogleFonts.shipporiMincho(
                  fontSize: 48,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
              headline4: GoogleFonts.shipporiMincho(
                  fontSize: 36,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.25),
              headline5: GoogleFonts.shipporiMincho(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.25),
              headline6: GoogleFonts.shipporiMincho(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.15),
              subtitle1: GoogleFonts.shipporiMincho(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.15),
              subtitle2: GoogleFonts.shipporiMincho(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1),
              bodyText1: GoogleFonts.shipporiMincho(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5),
              bodyText2: GoogleFonts.shipporiMincho(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25),
              button: GoogleFonts.shipporiMincho(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.25),
              caption: GoogleFonts.shipporiMincho(
                  fontSize: 19,
                  color: Color(0xffD26919),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4),
              overline: GoogleFonts.shipporiMincho(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5),
            )),
        home: WritingPage(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomePage(),
          '/roomenter': (BuildContext context) => RoomEnterPage(),
          '/roomroby': (BuildContext context) => RoomRobyPage(),
          '/writing': (BuildContext context) => const WritingPage(),
        });
  }
}
