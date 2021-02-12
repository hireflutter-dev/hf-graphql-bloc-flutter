import 'package:flutter/material.dart';
import 'package:fluttergraphql/bloc/graphql_bloc.dart';
import 'package:fluttergraphql/bloc_observer.dart';
import 'package:fluttergraphql/query/country_query.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graphql Flutter'),
      ),
      body: BlocProvider(
        create: (context) => GraphqlBloc()
          ..add(
            CountryGraphQL(
              query,
              variables: {'ID': 'AS'},
            ),
          ),
        child: BlocBuilder<GraphqlBloc, GraphqlState>(
          builder: (context, state) {
            if (state is Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LoadDataSuccess) {
              final List _repositories = state.data['continent']['countries'];
              return ListView.builder(
                itemCount: _repositories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(_repositories[index]['name'].toString());
                },
              );
            }
            if (state is LoadDataFail) {
              return Center(
                child: const Text('something went wrong'),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
