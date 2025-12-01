import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:runway/models/product_model.dart';
import 'package:runway/pages/category_screen.dart';
import 'package:runway/pages/single_produt.dart';

class YouMightAlsoLiks extends StatefulWidget {
  const YouMightAlsoLiks({super.key});

  @override
  State<YouMightAlsoLiks> createState() => _YouMightAlsoLiksState();
}

class _YouMightAlsoLiksState extends State<YouMightAlsoLiks> {
  List<ProductModel> YouMightAlsoLiksModel = [
    ProductModel(
      image: "assets/images/models/image 3.png",
      name: "Top man black",
      price: "20",
      allLikes: '580',
    ),
    ProductModel(
      image: "assets/images/models/Frame 72.png",
      name: "Classic Tailored Fit Men's Dress Shirt",
      price: "40",
      allLikes: '400',
    ),
    ProductModel(
      image: "assets/images/models/image 2.png",
      name: "Lightweight Men's Puffer Jacket",
      price: "20",
      allLikes: '525',
    ),
    ProductModel(
      image: "assets/images/models/image 4 (1).png",
      name: "Deep gray essential regul..",
      price: "35",
      allLikes: '150',
    ),
    ProductModel(
      image: "assets/images/models/image 6.png",
      name: "Top man black with Trous..",
      price: "47",
      allLikes: '604',
    ),
    ProductModel(
      image: "assets/images/models/image 4.png",
      name: "Gray coat and white T-sh",
      price: "50",
      allLikes: '251',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      child: Row(
        spacing: 5,
        children: [
          ...List.generate(YouMightAlsoLiksModel.length, (i) {
            final items = YouMightAlsoLiksModel[i];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SingleProdut(item: items),
                  ),
                );
              },
              child: SizedBox(
                width: 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 170,
                      height: 180,
                      child: Image.asset(items.image, fit: BoxFit.contain),
                    ),

                    Gap(10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items.name,
                            maxLines: 1,

                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),

                          Gap(5),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "£${items.price}",
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
              ),
            );
          }),
        ],
      ),
    );
  }
}
