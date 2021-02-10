import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/models/user.dart';
import 'authenticate.dart';
import 'home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final person = Provider.of<Person>(context);
    //print(person);

    // return either Home or Authenticate widget
    if (person == null) {
      return Authenticate(); //! when there's no user credentials
    } else {
      print(person);
      return Pace(); //! when the user has registered
    }
  }
}
