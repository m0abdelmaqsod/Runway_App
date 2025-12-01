import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:runway/models/product_model.dart';
import 'package:runway/pages/single_produt.dart';
import 'package:runway/widget/category_filter.dart';
import 'package:runway/widget/custom_appbar.dart';
import 'package:runway/widget/items_produt.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<ProductModel> Pro = [
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
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          // ========= && ========= //\
          Gap(15),

          // ========= && ========= //
          CustomAppbar(
            title: "Men",
            prefix: "assets/images/svg_icons/arrow_left.svg",
            suffix: "assets/images/svg_icons/Vector.svg",
            onTap: () {
              Navigator.pop(context);
            },
          ),

          // ========= && ========= //

          // ========= && ========= //
          CategoryFilter(),

          // ========= && ========= //
          // Gap(5),

          // ========= && ========= //
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GridView.builder(
                itemCount: Pro.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                  mainAxisExtent: 310,
                ),

                itemBuilder: (context, i) {
                  final item = Pro[i];
                  return ItemsProduct(
                    image: item.image,
                    name: item.name,
                    price: item.price,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleProdut(item: item),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          // ========= && ========= //

          // ========= && ========= //
        ],
      ),
    );
  }
}
