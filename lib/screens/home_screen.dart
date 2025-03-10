import 'package:flutter/material.dart';
import 'package:app/screens/favourites_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/widgets/category_button.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePage createState() => _HomePage();

}

class _HomePage extends State<HomePage> with WidgetsBindingObserver {
  final PageController _pageController = PageController();
  int selectedPage = 0;
  final List<Widget> pages = [
    HomeScreen(),
    FavouritesScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
      setState(() {
        selectedPage = 0;
        _pageController.jumpToPage(selectedPage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            selectedPage = index;
          });
        },
        children: [
          HomeScreen(),
          FavouritesScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        currentIndex: selectedPage,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
          _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Избранное',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'lib/assets/icons/cooking_book.svg',
                  height: 25,
                  width: 20,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Категории',
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black,
                      ),
                    ],
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  'lib/assets/icons/cooking_book.svg',
                  height: 25,
                  width: 20,
                ),
              ], // children
            ),
          ),
        ]; // returns widget
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryButton(
              title: 'Супы',
              imagePath: 'lib/assets/images/soup.png',
              svgPath: 'lib/assets/icons/soup.svg',
            ),
            CategoryButton(
              title: 'Салаты',
              imagePath: 'lib/assets/images/salad.png',
              svgPath: 'lib/assets/icons/salad.svg',
            ),
            CategoryButton(
              title: 'Десерты',
              imagePath: 'lib/assets/images/dessert.png',
              svgPath: 'lib/assets/icons/dessert.svg',
            ),
            CategoryButton(
              title: 'Выпечка',
              imagePath: 'lib/assets/images/bakery.png',
              svgPath: 'lib/assets/icons/bakery.svg',
            ),
            CategoryButton(
              title: 'Картофельные блюда',
              imagePath: 'lib/assets/images/potato.png',
              svgPath: 'lib/assets/icons/potato.svg',
            ),
            CategoryButton(
              title: 'Мясные блюда',
              imagePath: 'lib/assets/images/meat.png',
              svgPath: 'lib/assets/icons/meat.svg',
            ),
            CategoryButton(
              title: 'Напитки',
              imagePath: 'lib/assets/images/drinks.png',
              svgPath: 'lib/assets/icons/drinks.svg',
            ),
          ],
        ),
      ),
    );
  }
}