part of 'watch_list_bloc.dart';

@freezed
class WatchListEvent with _$WatchListEvent {
  const factory WatchListEvent.getUserWatchList() = _getUserWatchList;

  const factory WatchListEvent.addToUserWatchList({required String playerId}) =
      _addToUserWatchList;

  const factory WatchListEvent.removeFromUserWatchList(
      {required String playerId}) = _removeFromUserWatchList;

  const factory WatchListEvent.clearUserWatchList() = _clearUserWatchList;

  const factory WatchListEvent.setFilter(
      {required String filterBy, required String filterValue}) = _setFilter;

  const factory WatchListEvent.setSortFilter({required String sortBy}) =
      _setSortFilter;

  const factory WatchListEvent.setPriceFilter(
      {required double minValue, required double maxValue}) = _setPriceFilter;

  const factory WatchListEvent.filterByPrice() = _filterByPrice;
}
