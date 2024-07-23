import 'dart:async';
import 'package:digital_boutique/features/admin/add_categories/data/repos/categories_admin_repos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_category_event.dart';
part 'delete_category_state.dart';
part 'delete_category_bloc.freezed.dart';

class DeleteCategoryBloc extends Bloc<DeleteCategoryEvent, DeleteCategoryState> {
  DeleteCategoryBloc(this._repo) : super(const _Initial()) {
    on<RemoveCategoryEvent>(_deleteCategory);
  }

  final CategoriesAdminRepos _repo;


  FutureOr<void> _deleteCategory(
    RemoveCategoryEvent event,
    Emitter<DeleteCategoryState> emit,
  ) async {
    emit(DeleteCategoryState.loading(categoryId: event.categoryId));

    final result = await _repo.deleteCategory(event.categoryId);

    result.when(
      success: (_) {
        emit(const DeleteCategoryState.success());
      },
      failure: (error) {
        emit(DeleteCategoryState.error(error: error));
      },
    );
  }
}
