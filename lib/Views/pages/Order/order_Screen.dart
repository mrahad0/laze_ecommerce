import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Utils/color.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:Text('Order'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Completed'),
              Tab(text: 'To Received'),
            ],
          ),
        ),
        body: TabBarView(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomCardWidget(),
                    SizedBox(height: 16),
                    CustomCardWidget(),
                  ],
                ),
              ),

            //2nd tab bar view widget

              SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomCardWidget2(),
                    SizedBox(height: 16),
                    CustomCardWidget2(),
                  ],
                ),
              ),
           ]
        )


      ),
    );
  }
}
// --- Custom Card Widget with Row and Column Nesting ---
class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ৪. Container ব্যবহার করে কার্ডের মতো লুক দেওয়া
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      // ৫. কন্টেইনারের ভেতরে Row নেওয়া
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row Child 1: Image Placeholder
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SvgPicture.asset("assets/images/img_1.png",)
          ),
          const SizedBox(width: 12.0),

          // Row Child 2: Details Column
          Expanded(
            // Row Child 2 এর ভেতরে Column নেওয়া
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Column Child 1: Product Title
                const Text(
                  "Men's Tie-Dye T-Shirt Nike Sportswear",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8.0),
                // Column Child 2: Price
                const Text(
                  "\$35.00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8.0),

          // Row Child 3: Button Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Button Column Child 1: Quantity
              Text(
                'Qty: 1',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 12.0),
              // Button Column Child 2: Action Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                ),
                child: const Text('View Again'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class CustomCardWidget2 extends StatelessWidget {
  const CustomCardWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    // ৪. Container ব্যবহার করে কার্ডের মতো লুক দেওয়া
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      // ৫. কন্টেইনারের ভেতরে Row নেওয়া
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row Child 1: Image Placeholder
          Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: SvgPicture.asset("assets/images/img_1.png",)
          ),
          const SizedBox(width: 12.0),

          // Row Child 2: Details Column
          Expanded(
            // Row Child 2 এর ভেতরে Column নেওয়া
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Column Child 1: Product Title
                const Text(
                  "Men's Tie-Dye T-Shirt Nike Sportswear",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8.0),
                // Column Child 2: Price
                const Text(
                  "\$35.00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8.0),

          // Row Child 3: Button Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Button Column Child 1: Quantity
              Text(
                'Qty: 1',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 12.0),
              // Button Column Child 2: Action Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.white ,
                  foregroundColor: CustomColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: CustomColors.primaryColor),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                ),
                child: const Text('View Again'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}