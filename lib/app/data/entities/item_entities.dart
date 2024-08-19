import 'dart:convert';

class ItemEntities {
    final int id;
    final DateTime createdAt;
    final String title;
    final String description;

    ItemEntities({
        required this.id,
        required this.createdAt,
        required this.title,
        required this.description,
    });

    factory ItemEntities.fromRawJson(String str) => ItemEntities.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ItemEntities.fromJson(Map<String, dynamic> json) => ItemEntities(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "title": title,
        "description": description,
    };
}
