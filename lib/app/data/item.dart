class Item {
  int? id;
  String? name;
  String? description;

  Item({this.id, this.name, this.description});

  // Constructor untuk membuat Item dari JSON
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  // Method untuk mengubah Item menjadi Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
