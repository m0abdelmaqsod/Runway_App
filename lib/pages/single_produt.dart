import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:runway/models/product_model.dart';
import 'package:runway/widget/category_filter.dart';
import 'package:runway/widget/custom_appbar.dart';
import 'package:runway/widget/showBottomSheet.dart';

class SingleProdut extends StatefulWidget {
  const SingleProdut({super.key, this.item});

  final ProductModel? item;

  @override
  State<SingleProdut> createState() => _SingleProdutState();
}

class _SingleProdutState extends State<SingleProdut> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet();
    });
  }

  void _showBottomSheet() {
    bool productDetails = false;
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.16,
          minChildSize: 0.16,
          maxChildSize: 0.75,
          expand: false,
          builder: (context, scrollController) {
            return Showbottomsheet(
              scrollController: scrollController,
              name: widget.item!.name.toString(),
              price: widget.item!.price.toString(),
              allLikes: widget.item!.allLikes.toString(),
            );
          },
        );
      },
    );
  }

  // bool details = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          // ========= && ========= //
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

          // ========= && ========= //\

          // ========= && ========= //
          CategoryFilter(),

          // ========= && ========= //
          Center(
            child: Image.asset(
              widget.item!.image.toString(),
              height: 580,
              fit: BoxFit.contain,
            ),
          ),

          // ========= && ========= //
          Gap(30),

          GestureDetector(
            onTap: () {
              _showBottomSheet();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  // border: BoxBorder.all(width: 0.5, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Details ",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
