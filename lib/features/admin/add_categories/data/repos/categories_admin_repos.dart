import 'package:digital_boutique/core/networking/api_result.dart';
import 'package:digital_boutique/core/utils/error/error_helper.dart';
import 'package:digital_boutique/features/admin/add_categories/data/data_source/categories_admin_data_source.dart';
import 'package:digital_boutique/features/admin/add_categories/data/models/create_category_request_body.dart';
import 'package:digital_boutique/features/admin/add_categories/data/models/create_category_response.dart';
import 'package:digital_boutique/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:digital_boutique/features/admin/add_categories/data/models/update_category_request_body.dart';

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

  // Create Category
  Future<ApiResult<CreateCategoryResponse>> createCategory(CreateCategoryRequestBody requestBody) async {
    try {
      final response = await _dataSource.createCategory(body: requestBody);
      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure(ErrorHelper.errorMessage);
    }
  }

  // Delete Category
  Future<ApiResult<void>> deleteCategory(String categoryId) async {
    try {
      await _dataSource.deleteCategory(categoryId: categoryId);
      return const ApiResult.success(null);
    } catch (error) {
      return const ApiResult.failure(ErrorHelper.errorMessage);
    }
  }

  Future<ApiResult<void>> updateCategory(UpdateCategoryRequestBody requestBody) async {
    try {
      await _dataSource.updateCategory(body: requestBody);
      return const ApiResult.success(null);
    } catch (error) {
      return const ApiResult.failure(ErrorHelper.errorMessage);
    }
  }
}
