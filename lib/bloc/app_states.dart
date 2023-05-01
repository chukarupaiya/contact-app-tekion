import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../user_class.dart';

// @immutable
// abstract class UserState extends Equatable {}

// //this class is used to load the data
// class UserLoadingState extends UserState {
//   @override
//   List<Object?> get props => [];
// }

// //we should declare another class for loaded data and error loading
// class UserLoadedState extends UserState {
//   static List<user> users=[];

//   UserLoadedState();

//   @override
//   List<Object?> get props => [users];

//   static loadUser(user_list){
//     users=user_list;
//   }

//   static addUser(user u){
//     print(u);
//     users.add(u);
//   }

//   static removeUser(int index){
//     users.removeAt(index);
//   }
// }

// class UserErrorLoadingState extends UserState {
//   final String error;

//   UserErrorLoadingState(this.error);

//   @override
//   List<Object?> get props => [error];
// }



@immutable
class UserState{
  List<user> users;
  
  UserState(this.users);

  @override
  List<Object?> get props => [];
}




