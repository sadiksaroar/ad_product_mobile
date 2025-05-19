import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: AddProductScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String selectedLocation = 'Barisal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8EBE0),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Use arrow_back for a back icon
          onPressed: () {
            Navigator.pop(context); // Usually used to go back
          },
        ),
        title: Center(child: Text('AgribBridge')),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Image Upload Placeholder
              GestureDetector(
                onTap: () {
                  // TODO: Add image picker
                },
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Product Name
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Price
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Price (BDT/kg)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Quantity
              TextFormField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantity (kg)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Description
              TextFormField(
                controller: descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Location Dropdown
              DropdownButtonFormField<String>(
                value: selectedLocation,
                items:
                ['Barisal', 'Patuakhali', 'Jhalokathi', 'Bhola', 'Barguna']
                    .map(
                      (loc) =>
                      DropdownMenuItem(value: loc, child: Text(loc)),
                )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLocation = value!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Select Location',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Submit form logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Product submitted",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Submit Product',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}