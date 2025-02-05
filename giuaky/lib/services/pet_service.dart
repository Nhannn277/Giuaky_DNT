import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/pet_model.dart';

class PetService {
  final CollectionReference _petsCollection =
      FirebaseFirestore.instance.collection('pets');

  // Thêm pet vào Firestore
  Future<void> addPet(String name, String type, int age, String imageUrl) async {
    try {
      final docRef = _petsCollection.doc(); // Tạo document có ID
      final pet = Pet(
        id: docRef.id,
        name: name,
        type: type,
        age: age,
        imageUrl: imageUrl,
      );
      await docRef.set(pet.toMap()); // Lưu vào Firestore
      print("Pet added successfully!");
    } catch (e) {
      print("Error adding pet: $e");
    }
  }

  // Cập nhật pet
  Future<void> updatePet(Pet pet) async {
    try {
      await _petsCollection.doc(pet.id).update(pet.toMap());
      print("Pet updated successfully!");
    } catch (e) {
      print("Error updating pet: $e");
    }
  }

  // Lấy danh sách pets từ Firestore
  Stream<List<Pet>> getPets() {
    return _petsCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Pet.fromMap(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    });
  }

  // Xóa pet
  Future<void> deletePet(String id) async {
    try {
      await _petsCollection.doc(id).delete();
      print("Pet deleted successfully!");
    } catch (e) {
      print("Error deleting pet: $e");
    }
  }
}
