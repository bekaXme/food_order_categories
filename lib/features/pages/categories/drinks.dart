import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order/colors.dart';
import '../../../main.dart';
import 'package:food_order/features/pages/categories/breakfast.dart';
import 'package:food_order/features/pages/categories/lunch.dart';
import 'package:food_order/features/pages/categories/dinner.dart';
import 'package:food_order/features/pages/categories/vegan.dart';
import 'package:food_order/features/pages/categories/desserts.dart';

class DrinksPage extends StatefulWidget {
  const DrinksPage({super.key});

  @override
  State<DrinksPage> createState() => _DrinksPageState();
}

class _DrinksPageState extends State<DrinksPage> {
  List<Map<String, dynamic>> meals = [
    {
      'name': 'Fresh Orange Juice',
      'definition': 'Freshly squeezed oranges',
      'rating': '4.5',
      'time': '5',
      'image': 'assets/images/Categories/breakfast.png',
    },
    {
      'name': 'Green Smoothie',
      'definition': 'Spinach and fruit blend',
      'rating': '4.4',
      'time': '10',
      'image': 'assets/images/Categories/cookies.png',
    },
    {
      'name': 'Iced Coffee',
      'definition': 'Chilled coffee with milk',
      'rating': '4.6',
      'time': '8',
      'image': 'assets/images/Categorie/salads.png',
    },
    {
      'name': 'Fresh Orange Juice',
      'definition': 'Freshly squeezed oranges',
      'rating': '4.5',
      'time': '5',
      'image': 'assets/images/Categories/vegan.png',
    },
    {
      'name': 'Green Smoothie',
      'definition': 'Spinach and fruit blend',
      'rating': '4.4',
      'time': '10',
      'image': 'assets/images/Categories/smoothie.png',
    },
    {
      'name': 'Iced Coffee',
      'definition': 'Chilled coffee with milk',
      'rating': '4.6',
      'time': '8',
      'image': 'assets/images/Categories/iced_coffee.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CategoryItemPage(meals: meals, category: 'Drinks', selectedIndex: 5);
  }
}

class CategoryItemPage extends StatefulWidget {
  const CategoryItemPage({
    super.key,
    required this.meals,
    required this.category,
    required this.selectedIndex,
  });
  final List<Map<String, dynamic>> meals;
  final String category;
  final int selectedIndex;

  @override
  State<CategoryItemPage> createState() => _CategoryItemPageState();
}

class _CategoryItemPageState extends State<CategoryItemPage> {
  bool isFavorite = false;
  late int selectedIndex;

  final List<String> appBarItems = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Vegan',
    'Desserts',
    'Drinks',
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  void _navigateToCategory(int index) {
    setState(() {
      selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const BreakfastPage()));
        break;
      case 1:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LunchPage()));
        break;
      case 2:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const DinnerPage()));
        break;
      case 3:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const VeganPage()));
        break;
      case 4:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const DessertsPage()));
        break;
      case 5:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const DrinksPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/icons/back-arrow.svg',
              width: 24,
              height: 24,
            ),
          ),
        ),
        title: Text(
          widget.category,
          style: TextStyle(
            color: AppColors.pinkIcon,
            fontSize: 20.sp,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.pinkIcon,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset('assets/icons/notification.svg'),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.pinkIcon,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset('assets/icons/search.svg'),
            ),
          ),
          const SizedBox(width: 10),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Row(
              children: List.generate(appBarItems.length, (index) {
                bool isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () => _navigateToCategory(index),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.pinkIcon
                            : const Color(0xFFEAEAEA),
                      ),
                      color: isSelected
                          ? AppColors.pinkIconBack
                          : Colors.transparent,
                    ),
                    child: Text(
                      appBarItems[index],
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFFA0A0A0),
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: GridView.builder(
          itemCount: widget.meals.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            final meal = widget.meals[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.asset(
                        meal['image'],
                        width: double.infinity,
                        height: 140.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10.h,
                      right: 10.w,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/icons/heart.svg',
                          width: 24.w,
                          height: 24.h,
                          color: isFavorite ? Colors.red : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal['name'],
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        meal['definition'],
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star,
                                  size: 14.sp, color: Colors.amber),
                              SizedBox(width: 4.w),
                              Text(
                                meal['rating'],
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.access_time,
                                  size: 14.sp, color: Colors.grey),
                              SizedBox(width: 4.w),
                              Text(
                                '${meal['time']} min',
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomButton(),
    );
  }
}