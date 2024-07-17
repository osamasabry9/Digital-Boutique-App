import 'package:digital_boutique/core/networking/api_result.dart';
import 'package:digital_boutique/core/service/upload_image/data_source/upload_image_data_source.dart';
import 'package:digital_boutique/core/service/upload_image/model/upload_image_response.dart';
import 'package:digital_boutique/core/utils/error/error_helper.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageRepo {
  const UploadImageRepo(this._dataSource);

  final UploadImageDataSource _dataSource;

  Future<ApiResult<UploadImageResponse>> uploadImage(XFile imageFile) async {
    try {
      final response = await _dataSource.uploadImage(imageFile: imageFile);

      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(ErrorHelper.errorMessage);
    }
  }
}
