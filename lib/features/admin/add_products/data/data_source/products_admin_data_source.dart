import 'package:digital_boutique/core/networking/api_service.dart';
import 'package:digital_boutique/core/networking/graphql_queries/admin/products_queries.dart';
import 'package:digital_boutique/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:digital_boutique/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:digital_boutique/features/admin/add_products/data/models/update_product_request_body.dart';

class ProductsAdminDataSource {
  ProductsAdminDataSource(this._graphql);
  final ApiService _graphql;

  Future<GetAllProductResponse> getAllProducts() async {
    final response = await _graphql.getAllProducts(
      ProductsQueries().getAllProductsMapQuery(),
    );

    return response;
  }

  Future<void> createProduct({
    required CreateProductRequestBody body,
  }) async {
    await _graphql
        .createProduct(ProductsQueries().createProductMap(body: body));
  }

  Future<void> deleteProduct({required String productId}) async {
    await _graphql
        .deleteProduct(ProductsQueries().deleteMapQuery(productId: productId));
  }

  Future<void> updateProduct({
    required UpdateProductRequestBody body,
  }) async {
    await _graphql
        .updateProduct(ProductsQueries().updateProductMap(body: body));
  }
}
