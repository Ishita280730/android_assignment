
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth/auth_repository.dart';
import 'content_display_event.dart';
import 'content_display_model.dart';
import 'content_display_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState>{

  UserDetailsBloc(): super(UserDetailsState());
  final AuthRepository authRepo = AuthRepository();

  @override
  Stream <UserDetailsState> mapEventToState (UserDetailsEvent event) async*{
    if(event is GetUserData)
    {
      var response= await authRepo.userDetails() ;
      var jsonData = jsonDecode(response.body);
      List<UserModel> users = fromJsonToUser(jsonData);
      yield state.copyWith(users: users);
      // returning json data

    }
  }
}