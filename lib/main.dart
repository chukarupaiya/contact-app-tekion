import 'package:first_app/home.dart';
import 'package:first_app/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:first_app/bloc/app_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<MyApp> createState() {
    return MyAppState();
  }
}

// class MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: RepositoryProvider(
//           create: (context) => UserRepository(),
//           child: BlocProvider(
//             create: (context) => UserBloc(
//                 RepositoryProvider.of<UserRepository>(context),
//                 "https://jsonplaceholder.typicode.com/users"),
//             child: Home(),
//           )),
//     );
//   }
// }

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(UserRepository(),
              "https://jsonplaceholder.typicode.com/users"),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
