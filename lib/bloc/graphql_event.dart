part of 'graphql_bloc.dart';

@immutable
abstract class GraphqlEvent extends Equatable {}

class CountryGraphQL extends GraphqlEvent {
  final String query;
  final Map<String, dynamic> variables;

  CountryGraphQL(this.query, {this.variables}) : super();

  @override
  List<Object> get props => [query, variables];
}
