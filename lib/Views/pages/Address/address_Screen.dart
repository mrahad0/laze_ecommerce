import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  var isPrimary = true.obs;
}

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});

  final AddressController controller = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade100,
            child: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.arrow_back, color: Colors.black))
          ),
        ),
        title: const Text(
          "Address",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Country & City
              Row(
                children: [
                  Expanded(
                    child: _buildInputField("Country", "Bangladesh"),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildInputField("City", "Sylhet"),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Phone Number
              _buildInputField("Phone Number", "+880 1453-987533"),
              const SizedBox(height: 16),

              // Address
              _buildInputField("Address", "Chhatak, Sunamgonj 12/8AB"),
              const SizedBox(height: 20),

              // Save as primary
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Save as primary address",
                    style: TextStyle(fontSize: 15),
                  ),
                  Switch(
                    value: controller.isPrimary.value,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      controller.isPrimary.value = value;
                    },
                  ),
                ],
              )),

              const SizedBox(height: 40),

              // Save Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9B6EFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Save Address",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            )),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
