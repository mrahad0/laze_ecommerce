import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// --- Placeholder Model (Replace with your actual import) ---
class UserProfile {
  final String name;
  final String email;
  final String phoneNumber;
  final String country;
  final String city;
  final String address;
  final String avatarUrl;

  UserProfile({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.address,
    required this.avatarUrl,
  });
}

final UserProfile dummyUser = UserProfile(
  name: 'Zakaria Rabby',
  email: 'name@example.com',
  phoneNumber: '+880 1453-987533',
  country: 'Bangladesh',
  city: 'Sylhet',
  address: 'Chhatak, Sunamgonj 12/8AB',
  avatarUrl: 'assets/images/Zakaria 1 (1).png',
);
// --------------------------------------------------------


class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  // TextEditingControllers to manage input for each field
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _countryController;
  late TextEditingController _cityController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with dummy data
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _countryController = TextEditingController();
    _cityController = TextEditingController();
    _addressController = TextEditingController();
  }

  @override
  void dispose() {
    // Dispose controllers to free up resources
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  // Helper widget to build each input field
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    bool isReadOnly = false,
    Widget? suffixIcon,
    String? hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          readOnly: isReadOnly,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF5F6FA), // Light grey background
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: TextStyle( // <--- hintStyle যোগ করা হলো
              fontSize: 16,
              color: Colors.grey, // হালকা ধূসর কালার দিন
              fontWeight: FontWeight.w400, // রেগুলার বা হালকা ফন্ট ওয়েট
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none, // No border line
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          style:TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20), // Spacing between fields
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Account Information',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Avatar with Edit Icon
            Center(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(dummyUser.avatarUrl),
                      radius: 50,
                      backgroundColor: Colors.grey.shade200,
                    ),
                  ),
                  Positioned(
                    bottom: 25, // Adjust to position the icon
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Implement logic to change avatar (e.g., open image picker)
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8A53E0), // Purple color
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2), // White border
                        ),
                        child: const Icon(
                          Icons.edit_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Name Field
            _buildTextField(
                label: 'Name',
                controller: _nameController,
                hintText: "Zakaria Rabby"
            ),

            // Email Field with Lock Icon
            _buildTextField(
              label: 'Email',
              controller: _emailController,
              isReadOnly: true,
              suffixIcon: Icon(Icons.lock_outline, color: Colors.grey.shade600, size: 20),
              hintText: "name@gmail.com"
            ),

            // Phone Number Field
            _buildTextField(
              label: 'Phone Number',
              controller: _phoneController,
              hintText: "+880 1453-987533"
            ),

            // Country and City in a Row
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    label: 'Country',
                    controller: _countryController,
                    hintText: "Bangladesh"
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildTextField(
                    label: 'City',
                    controller: _cityController,
                    hintText: "Sylhet"
                  ),
                ),
              ],
            ),

            // Address Field
            _buildTextField(
                label: 'Address',
                controller: _addressController,
                hintText: "Chhatak, Sunamgonj 12/8AB"
            ),

            const SizedBox(height: 20),

            // Save Changes Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Implement logic to save changes
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8A53E0), // Purple color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}