import 'dart:async';
import 'package:digital_boutique/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:digital_boutique/features/admin/add_products/data/repos/products_admin_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';
part 'create_product_bloc.freezed.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  CreateProductBloc(this._repo) : super(const CreateProductState.initial()) {
    on<NewCreateProductEvent>(_createProduct);
  }
  final ProductsAdminRepo _repo;
  FutureOr<void> _createProduct(
    NewCreateProductEvent event,
    Emitter<CreateProductState> emit,
  ) async {
    emit(const CreateProductState.loading());
    final result = await _repo.createProduct(event.body);

    result.when(
      success: (data) {
        emit(const CreateProductState.success());
      },
      failure: (error) {
        emit(CreateProductState.error(error));
      },
    );
  }
}
