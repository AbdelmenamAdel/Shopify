import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/features/customer/home/data/repo/home_repo.dart';

part 'get_banners_event.dart';
part 'get_banners_state.dart';
part 'get_banners_bloc.freezed.dart';

class GetBannersBloc extends Bloc<GetBannersEvent, GetBannersState> {
  GetBannersBloc(this._repo) : super(const GetBannersState.loading()) {
    on<FetchBannersEvent>(_getBanners);
  }
  final HomeRepo _repo;
  FutureOr<void> _getBanners(
    FetchBannersEvent event,
    Emitter<GetBannersState> emit,
  ) async {
    emit(const GetBannersState.loading());
    final result = await _repo.getBanners();
    result.when(
      success: (banners) {
        if (banners.bannerImageList.isEmpty) {
          emit(const GetBannersState.empty());
        } else {
          emit(
            GetBannersState.success(
              imageBannerList: banners.bannerImageList,
            ),
          );
        }
      },
      failure: (error) => emit(GetBannersState.error(error: error)),
    );
  }
}
