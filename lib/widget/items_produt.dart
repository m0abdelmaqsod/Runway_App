import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ItemsProduct extends StatelessWidget {
  const ItemsProduct({super.key, required this.image, required this.name, required this.price,required this.onTap});

  final String image,name ,price;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 250,
                height: 240,
                child: Image.asset(image, fit: BoxFit.contain),
              ),
      
              Gap(10),
      
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
      
                  children: [
                    Text(
                      name,
                      maxLines: 1,
      
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
      
                    Gap(5),
      
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "£$price",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
      
                        SvgPicture.asset(
                          "assets/images/svg_icons/heart.svg",
                          width: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
