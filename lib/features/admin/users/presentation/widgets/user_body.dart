import 'package:digital_boutique/features/admin/users/presentation/widgets/search_for_users.dart';
import 'package:digital_boutique/features/admin/users/presentation/widgets/table_for_users.dart';
import 'package:flutter/material.dart';
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
              onRefresh: () async {},
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: TableForUsers()),
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
