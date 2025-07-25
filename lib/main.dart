import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order/colors.dart';

void main() {
  runApp(const CategoriesPage());
}

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<Map<String, dynamic>> meals = [
    {'name': 'Lunch', 'image': 'assets/images/Categories/lunch.png'},
    {'name': 'Breakfast', 'image': 'assets/images/Categories/breakfast.png'},
    {'name': 'Dinner', 'image': 'assets/images/Categories/dinner.png'},
    {'name': 'Vegan', 'image': 'assets/images/Categories/vegan.png'},
    {'name': 'Deserts', 'image': 'assets/images/Categories/dessert.png'},
    {'name': 'Drinks', 'image': 'assets/images/Categories/drinks.png'},
    {'name': 'Lunch', 'image': 'assets/images/Categories/lunch.png'},
    {'name': 'Breakfast', 'image': 'assets/images/Categories/breakfast.png'},
    {'name': 'Dinner', 'image': 'assets/images/Categories/dinner.png'},
    {'name': 'Vegan', 'image': 'assets/images/Categories/vegan.png'},
    {'name': 'Deserts', 'image': 'assets/images/Categories/dessert.png'},
    {'name': 'Drinks', 'image': 'assets/images/Categories/drinks.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CategoryPage(meals: meals),
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.meals});

  final List<Map<String, dynamic>> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 5),
          child: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/back-arrow.svg',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
        ),
        title: Text(
          'Categories',
          style: TextStyle(
            color: const Color(0xFFFD5D69),
            fontSize: 20.sp,
            fontFamily: "Poppins",
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFFD5D69),
            ),
            child: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icons/notification.svg'),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFFD5D69),
            ),
            child: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icons/search.svg'),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: meals.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    width: 158.w,
                    height: 140.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Image.asset(
                      meals[index]['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  meals[index]['name'],
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 54),
              child: Container(
                height: 56.h,
                width: 280.w,
                decoration: BoxDecoration(
                  color: AppColors.pinkIconBack,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/home.svg'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/community.svg'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/categories.svg'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/profile.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 126.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.backgroundColor, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
