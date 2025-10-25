import 'package:e_commerce/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'edit_Screen.dart';
// Make sure to import your UserProfile model and dummy data
// import '../../models/user_profile_model.dart'; // Adjust path as needed

// Placeholder for UserProfile and dummyUser if the model file is not created yet
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
  phoneNumber: '0123654789',
  country: 'Bangladesh',
  city: 'Sylhet',
  address: 'Chhatak, Sunamgonj 12/8AB',
  avatarUrl: 'assets/images/Zakaria 1 (1).png', // Example URL
);
// End Placeholder


class AccountInformationScreen extends StatelessWidget {
  const AccountInformationScreen({super.key});

  // Helper widget to display each information field
  Widget _buildInfoField({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
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
        backgroundColor: Colors.white, // AppBar background matches the image
        elevation: 0, // No shadow for AppBar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Avatar
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: CircleAvatar(
                  radius: 50, // Size of the avatar
                  backgroundColor: Colors.grey.shade200, // Placeholder background
                  // Use NetworkImage for URL, or AssetImage for local assets
                  backgroundImage: NetworkImage(dummyUser.avatarUrl),
                  // If you use AssetImage: AssetImage('assets/images/your_avatar.png'),
                ),
              ),
            ),

            // Information Fields
            _buildInfoField(label: 'Name', value: dummyUser.name),
            _buildInfoField(label: 'Email', value: dummyUser.email),
            _buildInfoField(label: 'Phone Number', value: dummyUser.phoneNumber),
            _buildInfoField(label: 'Country', value: dummyUser.country),
            _buildInfoField(label: 'City', value: dummyUser.city),
            _buildInfoField(label: 'Address', value: dummyUser.address),

            const SizedBox(height: 40), // Spacing before the button

            // Edit Button
            SizedBox(
              width: double.infinity, // Button takes full width
              height: 50, // Fixed height for the button
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.to(EditScreen());
                  },
                icon: SvgPicture.asset("assets/icons/Edit.svg"),
                label: Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black ,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Purple color from your screenshots
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                    side: BorderSide(
                      color: CustomColors.primaryColor
                    )
                  ),
                  elevation: 0, // No shadow for the button
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}