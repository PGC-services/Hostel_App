import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginInfo extends Equatable {
  final String uname;
  final String pword;

  LoginInfo({
    @required this.uname,
    @required this.pword,
  });//: super([uname, pword]);

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [uname, pword];
}
