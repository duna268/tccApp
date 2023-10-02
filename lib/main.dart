import 'dart:io';

import 'package:tccApp/utils/theme/fontes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tccApp/utils/theme/temas.dart';

import 'utils/named_routing/router.dart' as router;
import 'utils/named_routing/routing_constants.dart';

void main() async {
  HttpOverrides.global = new MyHttpOverrides();

  /*runApp(MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAppCheck.instance.activate();*/

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tccApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: primaryfont,
        primaryColor: Temas.primaryColor,
        scaffoldBackgroundColor: Temas.bgColor,
        backgroundColor: Temas.bgColor,
        hintColor: Colors.black,
      ),
      initialRoute: LoginViewRoute,
      onGenerateRoute: router.generateRoute,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'), // Adicionando pt
      ],
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
