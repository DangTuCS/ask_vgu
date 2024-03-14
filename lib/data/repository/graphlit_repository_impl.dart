import 'dart:convert';

import 'package:ask_vgu/data/client/graphql_service.dart';
import 'package:ask_vgu/data/query/graphlit_query.dart';
import 'package:ask_vgu/domain/graphlit_repository.dart';
import 'package:ask_vgu/model/conversantion.dart';
import 'package:get/get.dart';

class GraphlitRepositoryImpl implements GraphlitRepository {
  final _client = Get.find<GraphqlService>();

  @override
  Future<void> postMessage({required String message, String? conversationId}) async {
    var variables = {
      "prompt": "What subject do I need to pass to take the SEA 2",
      "id": "621df9b1-a43a-42c0-90cf-063a15672d08"
    };

    await _client.mutate(mutationQuery: GraphlitQuery.postMessage, variables: variables);
  }

  @override
  Future<List<Conversation>> getConversations() async {
    var result = await _client.query(query: GraphlitQuery.getConversations);
    return conversationFromMap(jsonEncode(result?['conversations']['results']));
  }
}
