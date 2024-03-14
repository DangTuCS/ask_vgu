// To parse this JSON data, do
//
//     final conversation = conversationFromMap(jsonString);

import 'dart:convert';

List<Conversation> conversationFromMap(String str) => List<Conversation>.from(json.decode(str).map((x) => Conversation.fromMap(x)));

String conversationToMap(List<Conversation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Conversation {
  final String? id;
  final String? name;

  Conversation({
    this.id,
    this.name,
  });

  factory Conversation.fromMap(Map<String, dynamic> json) => Conversation(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}
