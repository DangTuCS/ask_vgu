import 'package:ask_vgu/model/conversantion.dart';
import 'package:ask_vgu/model/person_model.dart';

abstract class FireStoreRepository {
  Future<PersonModel?> getPerson(String email);
  Future<void> addPerson(PersonModel person);
  Future<void> addNewConversation({required Conversation conversation, required String email});
  Future<void> deleteConversation(String conversationId);
  Future<List<Conversation>> getConversations(String email);
  Future<void> editConversationName(String conversationId, String name);
  Future<void> submitFeedback(String feedback);
}