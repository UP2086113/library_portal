import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'utils/enums/page_type_enum.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const InitialApp();
  }
}

class InitialApp extends StatelessWidget {
  const InitialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Library Portal',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue[800],
          textTheme: TextTheme(
            displayLarge: GoogleFonts.literata(
              textStyle: const TextStyle(
                fontSize: 50,
                letterSpacing: .5,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            displayMedium: GoogleFonts.literata(
              textStyle: const TextStyle(
                fontSize: 30,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            displaySmall: GoogleFonts.openSans(
              textStyle: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.blue[800],
          fontFamily: GoogleFonts.openSans().fontFamily,
          iconTheme: IconThemeData(color: Colors.grey[800]),
        ),
        initialRoute: PageType.LOGIN.name,
        routes: {
          PageType.HOME.name: (_) => PageType.HOME.getRoute(),
          PageType.COLLECTIONS.name: (_) => PageType.COLLECTIONS.getRoute(),
          PageType.GENRES.name: (_) => PageType.GENRES.getRoute(),
          PageType.AUTHOR.name: (_) => PageType.AUTHOR.getRoute(),
          PageType.MEMBERPREFS.name: (_) => PageType.MEMBERPREFS.getRoute(),
          PageType.AUTHORGALLERY.name: (_) => PageType.AUTHORGALLERY.getRoute(),
          PageType.AUTHORBOOKS.name: (_) => PageType.AUTHORBOOKS.getRoute(),
          PageType.BOOK.name: (_) => PageType.BOOK.getRoute(),
          PageType.BOOKSHELF.name: (_) => PageType.BOOKSHELF.getRoute(),
          PageType.PROFILE.name: (_) => PageType.PROFILE.getRoute(),
          PageType.LOGIN.name: (_) => PageType.LOGIN.getRoute(),
        });
  }
}
