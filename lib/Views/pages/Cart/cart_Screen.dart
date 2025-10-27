
import 'package:e_commerce/Utils/color.dart';
import 'package:e_commerce/Views/base/custom_button.dart';
import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart"), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder:
                    (context, index) => Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffDEDEDE),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              _cartController
                                  .myCartList
                                  .value[index]['product_image'],
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _cartController
                                      .myCartList
                                      .value[index]['product_name'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "\$${_cartController.myCartList[index]['product_price']} (-\$${_cartController.myCartList[index]['product_tax']} Tax)",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xff8F959E),
                                  ),
                                ),
                                SizedBox(height: 10),

                                Row(
                                  children: [
                                    if (_cartController
                                            .myCartList[index]['stock'] !=
                                        0)
                                      GestureDetector(
                                        onTap: () {
                                          _cartController.decrement(index);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,

                                            border: Border.all(
                                              color: Color(0xff8F959E),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.keyboard_arrow_down,
                                          ),
                                        ),
                                      ),
                                    SizedBox(width: 10),
                                    _cartController
                                                .myCartList[index]['stock'] !=
                                            0
                                        ? Text(
                                          _cartController
                                              .myCartList
                                              .value[index]['quantity']
                                              .toString(),
                                        )
                                        : Text(
                                          "Out of Stock",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                    SizedBox(width: 10),
                                    if (_cartController
                                            .myCartList[index]['stock'] !=
                                        0)
                                      GestureDetector(
                                        onTap: () {
                                          _cartController.increment(index);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,

                                            border: Border.all(
                                              color: Color(0xff8F959E),
                                            ),
                                          ),
                                          child: Icon(Icons.keyboard_arrow_up),
                                        ),
                                      ),

                                    SizedBox(width: 10),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        _cartController.delete(index);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                          border: Border.all(
                                            color: Color(0xff8F959E),
                                          ),
                                        ),
                                        child: Icon(Icons.delete_outline),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: _cartController.myCartList.length,
              ),
            ),

            SizedBox(height: 10),

            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Delivery Address",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Spacer(),

                    Icon(Icons.arrow_forward_ios_outlined, size: 15),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset("assets/images/Rectangle 584.png"),

                        SvgPicture.asset("assets/images/Ellipse 773.svg"),

                        SvgPicture.asset("assets/images/Location.svg"),
                      ],
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Chhatak, Sunamgonj 12/8AB",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Sylhet",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff8F959E),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset("assets/icons/Check.svg"),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Payment Method",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Spacer(),

                    Icon(Icons.arrow_forward_ios_outlined, size: 15),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          color: Color(0xffF5F6FA),
                        ),
                        SvgPicture.asset("assets/images/Frame.svg"),
                      ],
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Visa Classic",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "**** 7690",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff8F959E),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset("assets/icons/Check.svg"),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Subtotal",
                      style: TextStyle(fontSize: 15, color: Color(0xff8F959E)),
                    ),
                    Spacer(),
                    Text(
                      "\$110",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Shipping cost",
                      style: TextStyle(fontSize: 15, color: Color(0xff8F959E)),
                    ),
                    Spacer(),
                    Text(
                      "\$10",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(fontSize: 15, color: Color(0xff8F959E)),
                    ),
                    Spacer(),
                    Text(
                      "\$120",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomButton(title: "Check Out",onpress: (){},)
          ],
        ),
      ),
    );
  }
}
