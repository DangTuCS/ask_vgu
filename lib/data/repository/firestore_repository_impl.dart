import 'package:ask_vgu/domain/firestore_repository.dart';
import 'package:ask_vgu/model/conversantion.dart';
import 'package:ask_vgu/model/person_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreRepositoryImpl implements FireStoreRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addPerson(PersonModel person) async {
    await _firestore.collection('users').doc(person.email).set(person.toMap());
  }

  @override
  Future<PersonModel?> getPerson(String email) async {
    var user = await _firestore.collection('users').doc(email).get();
    if (user.exists) {
      print(user.data());
      return PersonModel.fromMap(user.data()!);
    }
    return null;
  }

  @override
  Future<void> addNewConversation({required Conversation conversation, required String email}) async {
    await _firestore.collection('users').doc(email).collection('conversations').add(conversation.toMap());
  }

  @override
  Future<void> deleteConversation(String conversationId) async {
    await _firestore.collection('users').doc(conversationId).delete();
  }

  @override
  Future<List<Conversation>> getConversations(String email) async {
    var conversations = await _firestore.collection('users').doc(email).collection('conversations').get();
    return conversations.docs.map((e) => Conversation.fromMap(e.data())).toList();
  }
}
