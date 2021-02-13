import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttergraphql/src/bloc/graphql_bloc.dart';
import 'package:fluttergraphql/src/query/country_query.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Graphql Flutter'),
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
                  return ListTile(
                    title: Text(
                      _repositories[index]['name'].toString(),
                    ),
                  );
                },
              );
            }
            if (state is LoadDataFail) {
              return Center(
                child: const Text('something went wrong'),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
