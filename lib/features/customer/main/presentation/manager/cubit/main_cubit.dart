import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/core/enums/nav_bar_enum.dart';

part 'main_state.dart';
part 'main_cubit.freezed.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState.initial());
  NavBarEnum navBarEnum = NavBarEnum.home;
  void changeBottomNav(NavBarEnum viewEnum) {
    navBarEnum = viewEnum;
    // if (viewEnum == NavBarEnum.home) {
    //   navBarEnum = NavBarEnum.home;
    // } else if (viewEnum == NavBarEnum.categories) {
    //   navBarEnum = NavBarEnum.categories;
    // } else if (viewEnum == NavBarEnum.favorites) {
    //   navBarEnum = NavBarEnum.favorites;
    // } else if (viewEnum == NavBarEnum.profile) {
    //   navBarEnum = NavBarEnum.profile;
    // }
    emit(MainState.barSelectedIcon(navBarEnum: navBarEnum));
  }
}
