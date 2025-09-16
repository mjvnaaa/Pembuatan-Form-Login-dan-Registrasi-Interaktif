import 'package:flutter/material.dart';
import 'package:pembuatan_form_login_dan_registrasi_interaktif/home_page.dart';
import 'package:pembuatan_form_login_dan_registrasi_interaktif/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  final fullName = prefs.getString('fullName');
  runApp(MyApp(isLoggedIn: isLoggedIn, fullName: fullName));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final String? fullName;

  const MyApp({super.key, required this.isLoggedIn, this.fullName});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? HomePage(fullName: fullName ?? '') : LoginPage(),
    );
  }
}
