import 'package:digital_boutique/core/networking/api_service.dart';
import 'package:digital_boutique/core/networking/graphql_queries/admin/categories_queries.dart';
import 'package:digital_boutique/features/admin/add_categories/data/models/create_category_request_body.dart';
import 'package:digital_boutique/features/admin/add_categories/data/models/create_category_response.dart';
import 'package:digital_boutique/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:digital_boutique/features/admin/add_categories/data/models/update_category_request_body.dart';

class CategoriesAdminDataSource {
  CategoriesAdminDataSource(this._graphql);
  final ApiService _graphql;

  Future<CategoriesGetAllResponse> getAllCategories() async {
    final response = await _graphql
        .getAllCategories(CategoriesQueries().getAllCategoriesMapQuery());
    return response;
  }

  Future<CreateCategoryResponse> createCategory({
    required CreateCategoryRequestBody body,
  }) async {
    final response = await _graphql
        .createCategory(CategoriesQueries().createCategoryMapQuery(body: body));
    return response;
  }

  Future<void> deleteCategory({required String categoryId}) async {
    await _graphql.deleteCategory(
        CategoriesQueries().deleteMapQuery(categoryId: categoryId),);
  }

  Future<void> updateCategory({required UpdateCategoryRequestBody body}) async {
    await _graphql.updateCategory(
      CategoriesQueries().updateMapQuery(body: body),
    );
  }
}
