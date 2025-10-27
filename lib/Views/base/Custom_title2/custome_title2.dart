import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomeTitle2 extends StatelessWidget {
   CustomeTitle2 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "365 Items",
                style:TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 5),
              Text(
                "Available in stock",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ],
          ),
          Container(
            height: 37,
            width: 68,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF5F6FA),
            ),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/sort.svg", fit: BoxFit.scaleDown),
                 SizedBox(width: 5),
                Text(
                  "Sort",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
