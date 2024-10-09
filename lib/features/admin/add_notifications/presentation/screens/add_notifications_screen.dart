import 'package:digital_boutique/app/di.dart';
import 'package:digital_boutique/core/common/widgets/admin_app_bar.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/bloc/add_notification/add_notification_bloc.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/bloc/get_all_notification_admin/get_all_notification_admin_bloc.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/bloc/send_notification/send_notification_bloc.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/widgets/add_notification_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNotificationsScreen extends StatelessWidget {
  const AddNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetAllNotificationAdminBloc>()
            ..add(const GetAllNotificationAdminEvent.getAllNotification()),
        ),
        BlocProvider(create: (context) => getIt<AddNotificationBloc>()),
        BlocProvider(create: (context) => getIt<SendNotificationBloc>()),
      ],
      child: const Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          title: 'Add Notifications',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
        body: AddNotificationBody(),
      ),
    );
  }
}
