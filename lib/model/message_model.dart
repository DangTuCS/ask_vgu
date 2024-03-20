import 'dart:convert';

List<MessageModel> messageModelFromMap(String str) =>
    List<MessageModel>.from(json.decode(str).map((x) => MessageModel.fromMap(x)));

String messageModelToMap(List<MessageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class MessageModel {
  final String? message;
  final Role? role;

  MessageModel({
    this.message,
    this.role,
  });

  factory MessageModel.fromMap(Map<String, dynamic> json) => MessageModel(
    message: json["message"],
    role: json["role"] == null ? null : roleValues.map[json["role"]],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "role": role == null ? null : roleValues.reverse[role],
  };
}

enum Role { USER, ASSISTANT }

// Utility class for converting Role enum to/from string
class RoleValues {
  Map<String, Role> map;
  Map<Role, String> reverseMap;

  RoleValues(this.map)
      : reverseMap = map.map((k, v) => MapEntry(v, k));

  Map<Role, String> get reverse => reverseMap;
}

final roleValues = RoleValues({
  "USER": Role.USER,
  "ASSISTANT": Role.ASSISTANT,
});
