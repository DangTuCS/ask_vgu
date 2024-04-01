import 'dart:convert';

import 'package:ask_vgu/data/client/graphql_service.dart';
import 'package:ask_vgu/data/query/graphlit_query.dart';
import 'package:ask_vgu/domain/graphlit_repository.dart';
import 'package:ask_vgu/model/conversantion.dart';
import 'package:ask_vgu/model/message_model.dart';
import 'package:ask_vgu/utils/extensions.dart';
import 'package:get/get.dart';

class GraphlitRepositoryImpl implements GraphlitRepository {
  final _client = Get.find<GraphqlService>();

  @override
  Future<(MessageModel message,String conversationId)> postMessage({required String message, String? conversationId}) async {
    var variables = {
      "prompt": message,
      "id": conversationId,
    }.removeNull();

    var res = await _client.mutate(mutationQuery: GraphlitQuery.postMessage, variables: variables);
    var messageRes =  MessageModel.fromMap(res!['promptConversation']['message']);
    var conversationIdRes = res['promptConversation']['conversation']['id'].toString();
    return (messageRes,conversationIdRes);
  }

  @override
  Future<List<Conversation>> getConversations() async {
    var result = await _client.query(query: GraphlitQuery.getConversations);
    return conversationFromMap(jsonEncode(result?['conversations']['results']));
  }

  @override
  Future<List<MessageModel>> getMessages({required String conversationId}) async {
    var variables = {"conversationId": conversationId};
    var result = await _client.query(query: GraphlitQuery.getMessages, vars: variables);
    return messageModelFromMap(jsonEncode(result?['conversation']['messages']));
  }

  @override
  Future<void> deleteConversation(String? conversationId) async {
    var variables = {"id": conversationId};

    await _client.mutate(mutationQuery: GraphlitQuery.deleteConversation, variables: variables);
  }
}
