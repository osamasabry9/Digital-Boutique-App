import 'dart:async';

import 'package:digital_boutique/features/admin/add_categories/data/models/create_category_request_body.dart';
import 'package:digital_boutique/features/admin/add_categories/data/repos/categories_admin_repos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_category_event.dart';
part 'create_category_state.dart';
part 'create_category_bloc.freezed.dart';

class CreateCategoryBloc extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  CreateCategoryBloc(this._repo) : super(const _Initial()) {
    on<NewCreateCategoryEvent>(_createCategory);
  }

  final CategoriesAdminRepos _repo;

  //Create Category
  FutureOr<void> _createCategory(
    NewCreateCategoryEvent event,
    Emitter<CreateCategoryState> emit,
  ) async {
    emit(const CreateCategoryState.loading());

    final result = await _repo.createCategory( event.body);

    result.when(
      success: (data) {
        emit(const CreateCategoryState.success());
      },
      failure: (error) {
        emit(CreateCategoryState.error(error: error));
      },
    );
  }
}
