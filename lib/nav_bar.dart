import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_color.dart';
import 'news_view (1).dart';


class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NewsView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/home.svg',
                colorFilter:
                    ColorFilter.mode(AppColor.lemonada, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset('assets/home.svg'),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/search.svg',
                colorFilter:
                    ColorFilter.mode(AppColor.lemonada, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset('assets/search.svg'),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/notification.svg',
                colorFilter:
                    ColorFilter.mode(AppColor.lemonada, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset('assets/notification.svg'),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/profile.svg',
                colorFilter:
                    ColorFilter.mode(AppColor.lemonada, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset('assets/profile.svg'),
              label: ''),
        ],
      ),
    );
  }
}
