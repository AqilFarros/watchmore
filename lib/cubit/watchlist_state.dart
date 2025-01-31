part of 'watchlist_cubit.dart';

sealed class WacthlistState extends Equatable {
  const WacthlistState();

  @override
  List<Object> get props => [];
}

final class WacthlistInitial extends WacthlistState {
  const WacthlistInitial();

  @override
  List<Object> get props => [];
}

final class WacthlistLoaded extends WacthlistState {
  final List<Watchlist> movie;

  const WacthlistLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}

final class WatchlistLoadedFailed extends WacthlistState {
  final String messsage;

  const WatchlistLoadedFailed(this.messsage);

  @override
  List<Object> get props => [messsage];
}
