import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pet_model.dart';
import '../services/pet_service.dart';

class AddEditPetScreen extends StatefulWidget {
  final Pet? pet;

  const AddEditPetScreen({super.key, this.pet});

  @override
  _AddEditPetScreenState createState() => _AddEditPetScreenState();
}

class _AddEditPetScreenState extends State<AddEditPetScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _type;
  late int _age;
  late String _imageUrl;

  @override
  void initState() {
    super.initState();
    _name = widget.pet?.name ?? '';
    _type = widget.pet?.type ?? 'Dog'; // Giá trị mặc định
    _age = widget.pet?.age ?? 0;
    _imageUrl = widget.pet?.imageUrl ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pet == null ? 'Add Pet' : 'Edit Pet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value == null || value.isEmpty ? 'Please enter a name' : null,
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                initialValue: _type,
                decoration: InputDecoration(labelText: 'Type'),
                validator: (value) => value == null || value.isEmpty ? 'Please enter a type' : null,
                onSaved: (value) => _type = value!,
              ),
              TextFormField(
                initialValue: _age.toString(),
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty || int.tryParse(value) == null
                    ? 'Please enter a valid number'
                    : null,
                onSaved: (value) => _age = int.parse(value!),
              ),
              TextFormField(
                initialValue: _imageUrl,
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) => value == null || value.isEmpty ? 'Please enter an image URL' : null,
                onSaved: (value) => _imageUrl = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Save'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final petService = Provider.of<PetService>(context, listen: false);

                    if (widget.pet == null) {
                      petService.addPet(_name, _type, _age, _imageUrl);
                    } else {
                      final pet = Pet(
                        id: widget.pet!.id,
                        name: _name,
                        type: _type,
                        age: _age,
                        imageUrl: _imageUrl,
                      );
                      petService.updatePet(pet);
                    }

                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
