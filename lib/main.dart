import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'package:componentes/src/pages/home_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es', 'MX')
      ],
      title: 'Componentes App',
      initialRoute: '/',
      routes: getAppRoutes(),
      onGenerateRoute: ( RouteSettings settings){
        print('Ruta Llamada ${settings.name}');
        return MaterialPageRoute(builder: (context) => AlertPage());
      },
    );
  }
}