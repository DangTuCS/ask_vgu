import 'dart:developer';

import 'package:ask_vgu/data/client/graphql_client.dart';
import 'package:ask_vgu/domain/exception/base_exception.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class GraphqlService {
  Future<Map<String, dynamic>?> query({
    required String query,
    Map<String, dynamic>? vars,
    FetchPolicy? fetchPolicy,
    ErrorPolicy? errorPolicy,
  }) async {
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: vars ?? {},
      fetchPolicy: fetchPolicy ?? FetchPolicy.noCache,
      errorPolicy: errorPolicy,
    );

    final QueryResult result = await graphlitClient.query(options).timeout(const Duration(seconds: 30));

    if (result.hasException) {
      log('ERROR LOGGER: ${result.exception.toString()}');
      throw BaseException(
          errorMessage: result.exception?.graphqlErrors.first.message ?? result.exception.toString(), errorCode: 123);
    }

    return result.data;
  }

  Future<Map<String, dynamic>?> mutate({required String mutationQuery, required Map<String, dynamic> variables}) async {
    final MutationOptions options = MutationOptions(document: gql(mutationQuery), variables: variables);
    final QueryResult result = await graphlitClient.mutate(options).timeout(const Duration(seconds: 30));

    if (result.hasException) {
      throw BaseException(
          errorMessage: result.exception?.graphqlErrors.first.message ?? result.exception.toString(), errorCode: 123);
    }

    return result.data;
  }
}
