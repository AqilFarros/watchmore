part of 'cast_cubit.dart';

sealed class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

final class CastInitial extends CastState {
  @override
  List<Object> get props => [];
}

final class CastLoaded extends CastState {
  final List<Cast> cast;

  const CastLoaded(this.cast);

  @override
  List<Object> get props => [cast];
}

final class CastLoadingFailed extends CastState {
  final String message;

  const CastLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
