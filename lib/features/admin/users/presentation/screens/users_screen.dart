import 'package:digital_boutique/app/di.dart';
import 'package:digital_boutique/core/common/widgets/admin_app_bar.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';
import 'package:digital_boutique/features/admin/users/presentation/widgets/user_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetAllUsersBloc>()
            ..add(const GetAllUsersEvent.getAllUsers(isNotLoading: true)),
        ),
      ],
      child: const Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          title: 'Users',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
        body: UserBody(),
      ),
    );
  }
}
