import 'package:ask_vgu/domain/firestore_repository.dart';
import 'package:ask_vgu/model/conversantion.dart';
import 'package:ask_vgu/model/person_model.dart';
import 'package:ask_vgu/utils/share_prefs/pref_utils.dart';
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
      return PersonModel.fromMap(user.data()!);
    }
    return null;
  }

  @override
  Future<void> addNewConversation({required Conversation conversation, required String email}) async {
    await _firestore.collection('users').doc(email).collection('conversations').doc(conversation.id).set(conversation.toMap());
  }

  @override
  Future<void> deleteConversation(String conversationId) async {
    await _firestore.collection('users').doc(appPrefs.email).collection('conversations').doc(conversationId).delete();
  }

  @override
  Future<List<Conversation>> getConversations(String email) async {
    var conversations = await _firestore.collection('users').doc(email).collection('conversations').get();
    return conversations.docs.map((e) => Conversation.fromMap(e.data())).toList();
  }

  @override
  Future<void> editConversationName(String conversationId, String name) async {
    await _firestore.collection('users').doc(appPrefs.email).collection('conversations').doc(conversationId).update({'name': name});
  }

  @override
  Future<void> submitFeedback(String feedback) async {
    // user email -> feedback
    await _firestore.collection('feedback').doc(appPrefs.email).set({'feedback': feedback});
  }
}
