import 'package:digital_boutique/core/networking/api_result.dart';
import 'package:digital_boutique/core/utils/error/error_helper.dart';
import 'package:digital_boutique/features/admin/add_products/data/data_source/products_admin_data_source.dart';
import 'package:digital_boutique/features/admin/add_products/data/models/create_product_request_body.dart';
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

  Future<ApiResult<void>> createProduct(CreateProductRequestBody body)async{

    try{
      await _productsAdminDataSource.createProduct(body: body);
      return const ApiResult.success(null);
    } catch(error)
    {
      return const ApiResult.failure(ErrorHelper.errorMessage);
    }
  }
}
