import 'package:digital_boutique/core/common/loading/empty_screen.dart';
import 'package:digital_boutique/features/admin/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';
import 'package:digital_boutique/features/admin/users/presentation/widgets/search_for_users.dart';
import 'package:digital_boutique/features/admin/users/presentation/widgets/table_for_users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserBody extends StatelessWidget {
  const UserBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        children: [
          // search for users
          const SearchForUsers(),
          SizedBox(height: 20.h),

          // Table
          Flexible(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<GetAllUsersBloc>().add(
                      const GetAllUsersEvent.getAllUsers(isNotLoading: true),
                    );
              },
              child: CustomScrollView(
                slivers: [
                  BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        },
                        search: (searchUserList) {
                          return TableForUsers(userList: searchUserList);
                        },
                        success: (userList) {
                          return TableForUsers(userList: userList);
                        },
                        empty: EmptyScreen.new,
                        error: Text.new,
                      );
                    },
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 25.h)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
