import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'my_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List getLocalList = [2];
  String languageCode = 'en';
  bool switchState = false;
  final Future<SharedPreferences> _sharedPreference = SharedPreferences.getInstance();

  Future<void>setLocal(String languageCode, bool switchState) async {
    SharedPreferences sharedPreference = await _sharedPreference;
    sharedPreference.setString("languageCode", languageCode);
    sharedPreference.setBool('switchState', switchState);
    getLocal();
  }

  Future<void>getLocal() async {
    SharedPreferences sharedPreference = await _sharedPreference;
    languageCode = sharedPreference.getString('languageCode') ?? 'en';
    switchState = sharedPreference.getBool('switchState') ?? false;
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    getLocal();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Localizations and Shared Preferences Sample Translation App ',
      locale: Locale(languageCode),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('bn'),
      ],
      home: MyHomeScreen(setLocal: setLocal, switchState: switchState),
    );
  }
}
