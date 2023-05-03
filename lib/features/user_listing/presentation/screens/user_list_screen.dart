import 'package:clean_code_architecture/core/di/dependency_injector.dart';
import 'package:clean_code_architecture/features/common/loading_view.dart';
import 'package:clean_code_architecture/features/common/error_view.dart';
import 'package:clean_code_architecture/features/user_listing/presentation/bloc/user_list_bloc.dart';
import 'package:clean_code_architecture/features/user_listing/presentation/widgets/user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User list"),
      ),
      body: BlocProvider(
        create: (context) => sl<UserListBloc>(),
        child:
            BlocBuilder<UserListBloc, UserListState>(builder: (context, state) {
          if (state is UserListLoading) {
            return const LoadingView();
          }
          if (state is UserListLoadFailure) {
            return ErrorView(
              message: state.message,
            );
          }
          if (state is UserListLoadSuccess) {
            return ListView.builder(
              itemCount: state.userList.length,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemBuilder: (context, index) => UserItem(
                user: state.userList[index],
              ),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
