import 'package:ask_vgu/model/conversantion.dart';
import 'package:ask_vgu/model/message_model.dart';

abstract class GraphlitRepository {
  Future<MessageModel> postMessage({required String message, String? conversationId});
  Future<List<Conversation>> getConversations();
  Future<List<MessageModel>> getMessages({required String conversationId});
}