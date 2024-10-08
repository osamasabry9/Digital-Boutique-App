import 'package:digital_boutique/core/common/loading/empty_screen.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/bloc/get_all_notification_admin/get_all_notification_admin_bloc.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/widgets/add_notification_item.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/widgets/create/create_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNotificationBody extends StatelessWidget {
  const AddNotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 30.h,
      ),
      child: Column(
        children: [
          // button create new product
          const CreateNotification(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                SliverToBoxAdapter(
                  child: BlocBuilder<GetAllNotificationAdminBloc,
                      GetAllNotificationAdminState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        },
                        success: (notificationsList) {
                          return ListView.separated(
                            itemCount: notificationsList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return AddNotificationItem(
                                notification: notificationsList[index],
                                index: index,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 15.h),
                          );
                        },
                        empty: EmptyScreen.new,
                        error: Text.new,
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 20.h),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
