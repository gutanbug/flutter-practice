import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taba/routes/router_path.dart';
import 'package:taba/routes/router_provider.dart';
import 'package:taba/screen/main/home/home_screen.dart';
import 'package:taba/screen/main/profile/profile_screen.dart';
import 'package:taba/screen/main/upload/image_upload_screen.dart';

import '../../modules/orb/components/components.dart';

final pageControllerProvider = StateProvider<PageController>((ref) {
  return PageController(initialPage: 0);
});

final _currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: ref.watch(pageControllerProvider),
        onPageChanged: (value){
          ref.read(_currentIndexProvider.notifier).update((state) => value);
        },
        children: const [
          HomeScreen(),
          ProfileScreen(),
          ImageUploadScreen(),
        ],
      ),
      bottomNavigationBar: OrbBottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈",),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "내 정보"),
        ],
        onIndexChanged: (value) {
          ref.read(pageControllerProvider).jumpToPage(value);
        },
        currentIndex: ref.watch(_currentIndexProvider),
      ),
    );
  }

}
