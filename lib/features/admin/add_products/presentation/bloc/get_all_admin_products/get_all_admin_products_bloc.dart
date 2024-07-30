import 'dart:async';
import 'package:digital_boutique/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:digital_boutique/features/admin/add_products/data/repos/products_admin_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_admin_products_event.dart';
part 'get_all_admin_products_state.dart';
part 'get_all_admin_products_bloc.freezed.dart';

class GetAllAdminProductsBloc extends Bloc<GetAllAdminProductsEvent, GetAllAdminProductsState> {
  GetAllAdminProductsBloc(this._repo)
      : super(const GetAllAdminProductsState.loading()) {
    on<FetchAllAdminProductsEvent>(_getAllProducts);
  }

  final ProductsAdminRepo _repo;

  FutureOr<void> _getAllProducts(
    FetchAllAdminProductsEvent event,
    Emitter<GetAllAdminProductsState> emit,
  ) async {
    if (event.isNotLoading) {
      emit(const GetAllAdminProductsState.loading());
    }

    final result = await _repo.getAllProducts();

    result.when(
      success: (data) {
        if (data.productGetAllList.isEmpty) {
          emit(const GetAllAdminProductsState.empty());
        } else {
          emit(
            GetAllAdminProductsState.success(
              productList: data.productGetAllList,
            ),
          );
        }
      },
      failure: (error) {
        emit(GetAllAdminProductsState.error(error: error));
      },
    );
  }
}
