class MessageModel {
  final String id;
  final String content;
  final DateTime createdAt;

  MessageModel({required this.id, required this.content, required this.createdAt});

  factory MessageModel.fromMap(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
