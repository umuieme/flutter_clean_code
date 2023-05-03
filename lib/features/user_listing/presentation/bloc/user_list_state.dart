part of 'user_list_bloc.dart';

abstract class UserListState extends Equatable {
  const UserListState();
}

class UserListInitial extends UserListState {
  @override
  List<Object> get props => [];
}

class UserListLoading extends UserListState {
  @override
  List<Object?> get props => [];
}

class UserListLoadSuccess extends UserListState {
  final List<User> userList;

  const UserListLoadSuccess({required this.userList});

  @override
  List<Object?> get props => [userList];
}

class UserListLoadFailure extends UserListState {
  final String message;

  const UserListLoadFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
