// import 'package:Hostel/core/Failures/failures.dart';
// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';
// import 'package:dartz/dartz.dart';

// class SignUp extends UseCase<User, SignUpParams> {
//   final SignUpRepo repository;

//   SignUp(this.repository)

//   @override
//   Future<Either<Failure, User>> call(SignUpParams params) async{
//     return await repository.signUp(
//       email: params.email,
//       pword: params.pword,
//     );
//   }
// }

// class SignUpParams extends Equatable {
//   final String email;
//   final String pword;

//   SignUpParams({this.email, this.pword});
 
//   @override
//   List<Object> get props => [email, pword];
// }