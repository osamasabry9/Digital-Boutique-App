import 'package:digital_boutique/core/networking/api_result.dart';
import 'package:digital_boutique/core/utils/error/error_helper.dart';
import 'package:digital_boutique/features/admin/add_products/data/data_source/products_admin_data_source.dart';
import 'package:digital_boutique/features/admin/add_products/data/models/get_all_product_response.dart';

class ProductsAdminRepo
{
  ProductsAdminRepo(this._productsAdminDataSource);
  final ProductsAdminDataSource _productsAdminDataSource;

  Future<ApiResult<GetAllProductResponse>> getAllProducts() async
  {
    try{
      final response = await _productsAdminDataSource.getAllProducts();
      return ApiResult.success(response);
    } catch(error)
    {
      return const ApiResult.failure(ErrorHelper.errorMessage);
    }
  }
}
