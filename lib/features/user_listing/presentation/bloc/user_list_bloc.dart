import 'dart:async';

import 'package:clean_code_architecture/core/usecases/usecase.dart';
import 'package:clean_code_architecture/features/user_listing/domain/entities/user.dart';
import 'package:clean_code_architecture/features/user_listing/domain/usecases/get_user_list_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_list_event.dart';

part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final GetUserListUseCase getUserListUseCase;

  UserListBloc({required this.getUserListUseCase}) : super(UserListInitial()) {
    on<UserListFetchEvent>(_onFetchUserList);
    add(UserListFetchEvent());
  }

  FutureOr<void> _onFetchUserList(
      UserListEvent event, Emitter<UserListState> emit) async {
    emit(UserListLoading());
    final response = await getUserListUseCase(NoParams());
    response.fold(
      (l) => emit(UserListLoadFailure(message: l.message)),
      (r) => emit(UserListLoadSuccess(userList: r)),
    );
  }
}
