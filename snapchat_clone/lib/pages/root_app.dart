// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:snapchat/data/bottom_items.dart';
import 'package:snapchat/pages/camera_page.dart';
import 'package:snapchat/pages/stories_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: getFooteer(), body: getBody());
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        CamerePage(),
        CamerePage(),
        CamerePage(),
        StoriesPage(),
        StoriesPage(),
      ],
    );
  }

  Widget getFooteer() {
    return Container(
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
          top: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(iconItems.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = index;
                });
              },
              child: Column(
                children: [
               
                  Icon(
                    iconItems[index],
                    color: pageIndex == index
                        ? colorItems[index]
                        : Colors.white.withOpacity(0.5),
                  ),
                  SizedBox(height: 5),
                  Text(
                    textItems[index],
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: pageIndex == index
                          ? colorItems[index]
                          : Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
