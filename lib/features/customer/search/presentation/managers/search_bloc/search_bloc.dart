import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/features/admin/products/data/models/get_all_products_response.dart';
import 'package:shopify/features/customer/search/data/models/search_request_body.dart';
import 'package:shopify/features/customer/search/data/repo/search_repo.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._repo) : super(const SearchState.initial()) {
    on<SearchProductEvent>(_searchForProduct);
  }
  final SearchRepo _repo;
  FutureOr<void> _searchForProduct(
    SearchProductEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchState.loading());
    final result = await _repo.searchProducts(body: event.body);
    result.when(
      success: (data) {
        if (data.getAllProductsList.isEmpty) {
          emit(SearchState.empty());
        } else {
          emit(SearchState.success(productList: data.getAllProductsList));
        }
      },
      failure: (error) => emit(SearchState.error(error: error)),
    );
  }
}
