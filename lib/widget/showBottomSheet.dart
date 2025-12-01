import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:runway/pages/category_screen.dart';
import 'package:runway/widget/You_might_also_liks.dart';

class Showbottomsheet extends StatefulWidget {
  const Showbottomsheet({
    super.key,
    required this.scrollController,
    required this.name,
    required this.price,
    required this.allLikes,
  });

  final ScrollController scrollController;
  final String name;
  final String price;
  final String allLikes;

  @override
  State<Showbottomsheet> createState() => _ShowbottomsheetState();
}

class _ShowbottomsheetState extends State<Showbottomsheet> {
  bool productDetails = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 150,
      width: double.infinity,
      child: ListView(
        controller: widget.scrollController,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 8,
              width: 40,
            ),
          ),

          Gap(10),

          Text(
            widget.name,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
          ),

          Gap(20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "£${widget.price}",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),

              Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/svg_icons/heart.svg",
                    width: 20,
                  ),

                  Gap(10),

                  Text(
                    widget.allLikes,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
          Gap(15),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              border: BoxBorder.all(width: 0.5, color: Colors.grey.shade500),
              borderRadius: BorderRadius.circular(8),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Select colors",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Gap(15),

                    SvgPicture.asset(
                      "assets/images/svg_icons/Frame 39639.svg",
                      width: 14,
                    ),
                  ],
                ),

                Container(width: 1, height: 30, color: Colors.grey.shade500),

                Row(
                  children: [
                    Text(
                      "Select size",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Gap(15),

                    SvgPicture.asset(
                      "assets/images/svg_icons/Frame 39639.svg",
                      width: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Gap(15),

          // ========= Add To Bag ========= //
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "Add To Bag",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          Gap(10),

          // ========= Free delivery && return ========= //
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey.shade500),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/svg_icons/solar_delivery-linear.svg",
                        width: 25,
                      ),

                      Gap(15),

                      Text(
                        "Free delivery",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 0.5,
                  color: Colors.grey.shade500,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/svg_icons/hugeicons_truck-return.svg",
                            width: 25,
                          ),

                          Gap(15),

                          Text(
                            "Free return",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),

                      Text(
                        "View return policy",
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Gap(10),

          Text(
            "About product",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),

          Gap(10),

          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey.shade500),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                // ========= Product details ======== //
                GestureDetector(
                  onTap: () {
                    setState(() {
                      productDetails = !productDetails;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/svg_icons/fluent_apps-list-detail-20-regular.svg",
                              width: 25,
                            ),

                            Gap(15),

                            Text(
                              "Product details",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),

                        productDetails == true
                            ? Icon(Icons.keyboard_arrow_up)
                            : Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ),

                // ======= && ======= //
                productDetails == true
                    ? Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 0.5,
                            color: Colors.grey.shade500,
                          ),

                          // ========= Brand ======== //
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/svg_icons/solar_hanger-2-linear.svg",
                                      width: 25,
                                    ),

                                    Gap(15),

                                    Text(
                                      "Brand",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),

                                Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),

                          Container(
                            width: double.infinity,
                            height: 0.5,
                            color: Colors.grey.shade500,
                          ),

                          // ========= Size and fit ======== //
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/svg_icons/Group (1).svg",
                                      width: 25,
                                    ),

                                    Gap(15),

                                    Text(
                                      "Size and fit",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),

                          Container(
                            width: double.infinity,
                            height: 0.5,
                            color: Colors.grey.shade500,
                          ),
                          // ========= History ======== //
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/svg_icons/Vector (1).svg",
                                      width: 25,
                                    ),

                                    Gap(15),

                                    Text(
                                      "History",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),

                                Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),

          Gap(10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "You might also liks",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CategoryScreen()),
                  );
                },
                child: Text(
                  "View all",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),

          Gap(10),

          // ========= You might also liks ======== //
          YouMightAlsoLiks(),
        ],
      ),
    );
  }
}
