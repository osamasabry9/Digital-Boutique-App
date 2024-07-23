import 'package:digital_boutique/core/networking/api_result.dart';
import 'package:digital_boutique/core/utils/error/error_helper.dart';
import 'package:digital_boutique/features/admin/add_categories/data/data_source/categories_admin_data_source.dart';
import 'package:digital_boutique/features/admin/add_categories/data/models/get_all_categories_response.dart';

class CategoriesAdminRepos {

  CategoriesAdminRepos(this._dataSource);
  final CategoriesAdminDataSource _dataSource;


// get all categories 
  Future<ApiResult<CategoriesGetAllResponse>> getAllCategories() async {
    try {
      final response = await _dataSource.getAllCategories();
      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure(ErrorHelper.errorMessage);
    }
  }
}
