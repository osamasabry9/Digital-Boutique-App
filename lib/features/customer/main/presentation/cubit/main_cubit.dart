import 'package:digital_boutique/core/enums/nav_bar_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.dart';
part 'main_cubit.freezed.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState.initial());

  NavBarEnum navBarEnum = NavBarEnum.home;

  void selectedNavBarIcons(NavBarEnum viewEnum) {
    switch (viewEnum) {
      case NavBarEnum.home:
        navBarEnum = NavBarEnum.home;
      case NavBarEnum.categories:
        navBarEnum = NavBarEnum.categories;
      case NavBarEnum.favorites:
        navBarEnum = NavBarEnum.favorites;
      case NavBarEnum.profile:
        navBarEnum = NavBarEnum.profile;
    }

    emit(MainState.barSelectedIcons(navBarEnum: navBarEnum));
  }
}
