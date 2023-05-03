part of 'user_list_bloc.dart';

abstract class UserListEvent extends Equatable {
  const UserListEvent();
}

class UserListFetchEvent extends UserListEvent {
  @override
  List<Object?> get props => [];
}
