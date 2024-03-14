import 'package:ask_vgu/model/conversantion.dart';

abstract class GraphlitRepository {
  Future<void> postMessage({required String message, String? conversationId});
  Future<List<Conversation>> getConversations();
}