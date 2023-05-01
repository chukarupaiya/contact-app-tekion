import '../repository.dart';
import './app_events.dart';
import './app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user_class.dart';

class UserBloc extends Cubit<UserState> {
  final UserRepository _userRepository;
  final String endpoint;

  UserBloc(this._userRepository, this.endpoint) : super(UserState([])) {
    loadUser();
  }

  void loadUser() async {
    try {
      final user_temp = await _userRepository.getUsers(endpoint);
      emit(UserState(user_temp));
    } catch (e) {
      print("some thing went wrong");
    }
  }

  void addUser(user u) {
    try {
      final user_temp = state.users;
      u.id = state.users.length + 500;
      user_temp.add(u);
      emit(UserState(user_temp));
    } catch (e) {
      print("some thing went wrong");
    }
  }

  void deleteUser(int id) {
    final user_temp = state.users;
    user_temp.removeAt(findUser(id));
    emit(UserState(user_temp));
  }

  void modifyUser(int id, user u) {
    final user_temp = state.users;
    print(id);
    int index = findUser(id);
    user_temp[index] = u;
    emit(UserState(user_temp));
  }

  int findUser(int id) {
    int _index = -1;
    int index = 0;

    for (user x in state.users) {
      if (x.id == id) {
        _index = index;
        break;
      }
      index++;
    }
    return index;
  }
}
