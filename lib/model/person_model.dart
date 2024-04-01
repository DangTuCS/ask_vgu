import 'dart:convert';

import 'conversantion.dart';

List<PersonModel> personModelFromMap(String str) =>
    List<PersonModel>.from(json.decode(str).map((x) => PersonModel.fromMap(x)));

class PersonModel {
  final String? id;
  final String? name;
  final String? email;
  final List<Conversation>? conversations;

  PersonModel({
    this.id,
    this.name,
    this.email,
    this.conversations,
  });

  factory PersonModel.fromMap(Map<String, dynamic> json) => PersonModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "conversations": conversations != null ? conversationToMap(conversations!) : null,
      };
}
