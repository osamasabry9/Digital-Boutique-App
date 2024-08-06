import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_product_response.g.dart';

@JsonSerializable()
class GetAllProductResponse {
  GetAllProductResponse(this.data);

  factory GetAllProductResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductResponseFromJson(json);

  final ProductGetAllData data;

  List<ProductGetAllModel> get productGetAllList {
    if (data.productsList.isEmpty) {
      return [];
    }
    return data.productsList;
  }
}

@JsonSerializable()
class ProductGetAllData {
  ProductGetAllData(this.productsList);

  factory ProductGetAllData.fromJson(Map<String, dynamic> json) =>
      _$ProductGetAllDataFromJson(json);

  @JsonKey(name: 'products')
  final List<ProductGetAllModel> productsList;
}

@JsonSerializable()
class ProductGetAllModel {
  ProductGetAllModel(
    this.id,
    this.title,
    this.price,
    this.images,
    this.description,
    this.category,
  );

  factory ProductGetAllModel.fromJson(Map<String, dynamic> json) =>
      _$ProductGetAllModelFromJson(json);

  final String? id;
  final String? title;
  final double? price;
  final List<String>? images;
  final String? description;
  final CategoryProductModel? category;
}

@JsonSerializable()
class CategoryProductModel {
  CategoryProductModel(this.id, this.name);

  factory CategoryProductModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductModelFromJson(json);

  final String? id;
  final String? name;
}
