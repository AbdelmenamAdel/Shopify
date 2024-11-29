import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/core/services/hive/hive_database.dart';
import 'package:shopify/features/customer/favorites/data/models/favorites_model.dart';

part 'favorites_state.dart';
part 'favorites_cubit.freezed.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState.initial());
  HiveDatabase hiveDatabase = HiveDatabase();
  Future<void> addAndRemoveFavorite(FavoritesModel model) async {
    emit(const FavoritesState.initial());
    // ! existing index check if the product is already in favorites or not
    // ! by get the index of the product if it is already in favorites
    final existingIndex = hiveDatabase.favoritesBox!.values
        .toList()
        .indexWhere((element) => element.id == model.id);
    if (existingIndex != -1) {
      await hiveDatabase.favoritesBox!.deleteAt(existingIndex);
    } else {
      await HiveDatabase().favoritesBox!.add(
            FavoritesModel(
              id: model.id,
              title: model.title,
              image: model.image,
              price: model.price,
              categoryName: model.categoryName,
            ),
          );
    }
    emit(const FavoritesState.addAndRemoveFavorites());
  }

  bool isFavorite(String id) {
    return hiveDatabase.favoritesBox!.values
        .toList()
        .any((element) => element.id == id);
  }

  List<FavoritesModel> get favoritesList =>
      hiveDatabase.favoritesBox!.values.toList();
}
