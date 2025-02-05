class Pet {
  final String id;
  final String name;
  final String type;
  final int age;
  final String imageUrl;

  Pet({
    required this.id,
    required this.name,
    required this.type,
    required this.age,
    required this.imageUrl,
  });

  // Chuyển từ Map (Firestore) sang Pet object
  factory Pet.fromMap(Map<String, dynamic> data, String documentId) {
    return Pet(
      id: documentId,
      name: data['name'] ?? '',
      type: data['type'] ?? '',
      age: data['age'] ?? 0,
      imageUrl: data['imageUrl'] ?? '',
    );
  }

  // Chuyển từ Pet object sang Map để lưu vào Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'age': age,
      'imageUrl': imageUrl,
    };
  }
}
