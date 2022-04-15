
import 'content_display_model.dart';

class UserDetailsState{
  List<UserModel>? users = [];

  UserDetailsState(
      {
        this.users,

      });

  UserDetailsState copyWith({
    List<UserModel>? users,
  })

  {
    return UserDetailsState(
      users: users ?? this.users,
    );

  }
}

