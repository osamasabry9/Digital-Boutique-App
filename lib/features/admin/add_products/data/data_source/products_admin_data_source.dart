import 'package:digital_boutique/core/networking/api_service.dart';
import 'package:digital_boutique/core/networking/graphql_queries/admin/products_queries.dart';
import 'package:digital_boutique/features/admin/add_products/data/models/get_all_product_response.dart';

class ProductsAdminDataSource {

  ProductsAdminDataSource(this._graphql);
  final ApiService _graphql;


  Future<GetAllProductResponse> getAllProducts() async {
    final response = await _graphql.getAllProducts(
      ProductsQueries().getAllProductsMapQuery(),
    );

    return response;
  }
}
