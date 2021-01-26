import 'package:Hostel/core/models/user.dart';
import 'package:Hostel/features/presentation/pages/authentication.dart';
import 'package:Hostel/features/presentation/pages/home.dart';
import 'package:Hostel/features/presentation/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final person = Provider.of<Person>(context);
    //print(person);

    // return either Home or Authenticate widget
    // return Authenticate();
    if (person == null) {
      return Authenticate();
    } else {
      return Homepage();
    }
  }
}
