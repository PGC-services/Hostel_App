import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/models/user.dart';
import 'core/models/wrapper.dart';
import 'core/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Person>.value(
      value: AuthService().person,
      child: new MaterialApp(
        home: Wrapper(),
        theme: FlexColorScheme.light(scheme: FlexScheme.aquaBlue).toTheme,
        darkTheme: FlexColorScheme.dark(scheme: FlexScheme.aquaBlue).toTheme,
      ),
    );
  }
}
