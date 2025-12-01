import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:runway/models/category_model.dart';
import 'package:runway/pages/category_screen.dart';
import 'package:runway/widget/custom_appbar.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/images/videos/video1.mp4")
      ..initialize().then((_) {
        setState(() {
          // _controller.play();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<CategoryModel> categories = [
    CategoryModel(image: "assets/images/category/women.png", name: "Women"),
    CategoryModel(image: "assets/images/category/men.png", name: "Men"),
    CategoryModel(image: "assets/images/category/kids.png", name: "Kids"),
    CategoryModel(image: "assets/images/category/deals.png", name: "Deals"),
    CategoryModel(image: "assets/images/category/women.png", name: "health"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.red,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        useLegacyColorScheme: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,

        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/svg_icons/heart.svg",width: 30,height: 20,),
            label: "Likes",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/svg_icons/bag.svg"),
            label: "Bag",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          // ======= app bar ======= //
          CustomAppbar(
            title: "Runway",
            prefix: "assets/images/svg_icons/menu.svg",
            suffix: "assets/images/svg_icons/notification.svg",
            onTap: () {},
          ),

          // ======= video ======= //
          _controller.value.isInitialized
              ? Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                          }
                        });
                      },
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),


                    // شريط التقدم slider
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 10,
                      child: VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          playedColor: Colors.red,
                          backgroundColor: Colors.white30,
                          bufferedColor: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                )
              : CircularProgressIndicator(),

          // ======= && ======= //
          SizedBox(height: 20),
          // ======= && ======= //

          // ======= Categories ======= //
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),

                // ======= && ======= //
                SizedBox(height: 25),

                // ======= && ======= //
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 20,
                    children: [
                      ...List.generate(categories.length, (i) {
                        final item = categories[i];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryScreen(),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                                width: 70,
                                height: 70,
                                child: ClipOval(
                                  child: Image.asset(
                                    item.image,
                                    // "assets/images/category/image (1).png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              // ======= && ======= //
                              SizedBox(height: 10),

                              // ======= && ======= //
                              Text(
                                item.name,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // ======= video ======= //
        ],
      ),
    );
  }
}
