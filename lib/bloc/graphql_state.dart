part of 'graphql_bloc.dart';

@immutable
abstract class GraphqlState extends Equatable {}

class GraphqlInitial extends GraphqlState {
  @override
  List<Object> get props => [];
}

class Loading extends GraphqlState {
  Loading() : super();

  @override
  List<Object> get props => [];
}

class LoadDataSuccess extends GraphqlState {
  final dynamic data;

  LoadDataSuccess(this.data) : super();

  @override
  List<Object> get props => [data];
}

class LoadDataFail extends GraphqlState {
  final dynamic error;

  LoadDataFail(this.error) : super();

  @override
  List<Object> get props => [error];
}
