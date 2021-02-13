const String query = r'''
  query GetCountry($ID : ID!){
    continent(code:$ID){
      name
      countries{
        name
      }
    }
  }
''';
