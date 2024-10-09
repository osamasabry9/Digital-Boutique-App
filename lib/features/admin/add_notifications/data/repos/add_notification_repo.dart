import 'package:digital_boutique/core/networking/api_result.dart';
import 'package:digital_boutique/features/admin/add_notifications/data/data_source/add_notificaion_data_source.dart';

class AddNotificationRepo {
  AddNotificationRepo({required this.addNotificationDataSource});
  final AddNotificationDataSource addNotificationDataSource;

  Future<ApiResult<void>> sendNotifications({
    required String body,
    required String title,
    required int productId,
  }) async {
    try {
      final response = await addNotificationDataSource.sendNotifications(
        body: body,
        title: title,
        productId: productId,
      );
      return ApiResult.success( response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
