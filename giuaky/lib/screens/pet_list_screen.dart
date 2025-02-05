import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pet_model.dart';
import '../services/pet_service.dart';
import 'add_edit_pet_screen.dart';

class PetListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pets")),
      body: StreamBuilder<List<Pet>>(
        stream: Provider.of<PetService>(context).getPets(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          final pets = snapshot.data!;
          return ListView.builder(
            itemCount: pets.length,
            itemBuilder: (context, index) {
              final pet = pets[index];
              return ListTile(
                title: Text(pet.name),
                subtitle: Text('${pet.type} - ${pet.age} years old'),
                leading: Image.network(pet.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => Provider.of<PetService>(context, listen: false).deletePet(pet.id),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddEditPetScreen(pet: pet)),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditPetScreen())),
      ),
    );
  }
}
