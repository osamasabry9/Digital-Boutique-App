part of 'get_all_admin_products_bloc.dart';

@freezed
class GetAllAdminProductsState with _$GetAllAdminProductsState {
  const factory GetAllAdminProductsState.loading() = LoadingState;
  const factory GetAllAdminProductsState.success({
    required List<ProductGetAllModel> productList,
  }) = SuccessState;
  const factory GetAllAdminProductsState.empty() = EmptyState;
  const factory GetAllAdminProductsState.error({required String error}) =
      ErrorState;
}