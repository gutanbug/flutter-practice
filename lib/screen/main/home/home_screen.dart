import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taba/routes/router_path.dart';
import 'package:taba/routes/router_provider.dart';

import '../../../modules/orb/components/components.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  createState() => _HomeScreen();
}

class _HomeScreen extends ConsumerState<HomeScreen> {
  late final TextEditingController searchController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    searchController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return OrbScaffold(
      orbAppBar: const OrbAppBar(
        title: 'Home',
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 10,
                textDirection: TextDirection.ltr,
                children: [
                  TextButton(onPressed: () {}, child: Text('버튼1')),
                  TextButton(onPressed: () {}, child: Text('버튼2')),
                  TextButton(onPressed: () {}, child: Text('버튼3')),
                  TextButton(onPressed: () {}, child: Text('버튼4')),
                  TextButton(onPressed: () {}, child: Text('버튼5')),
                  TextButton(onPressed: () {}, child: Text('버튼6')),
                  TextButton(onPressed: () {}, child: Text('버튼7')),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list),
                  color: themeData.colorScheme.onSurface,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: OrbTextFormField(
                    controller: searchController,
                    labelText: '',
                    textInputAction: TextInputAction.next,
                    helperText: "",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '검색어를 입력해주세요';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 18),
                OrbButton(
                  buttonSize: OrbButtonSize.compact,
                  buttonRadius: OrbButtonRadius.small,
                  enabledBackgroundColor: themeData.colorScheme.secondary,
                  enabledForegroundColor: themeData.colorScheme.onSecondary,
                  onPressed: () async {
                    //TODO : 검색 기능 구현
                    return;
                  },
                  buttonText: '검색',
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            CarouselSlider(
              items: [
                Image.asset(
                  "assets/icons/test/test1.jpeg",
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  "assets/icons/test/test2.png",
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  "assets/icons/test/test3.png",
                  fit: BoxFit.fill,
                ),
              ].map(
                (e) {
                  return Builder(
                    builder: (context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: e,
                      );
                    },
                  );
                },
              ).toList(),
              options: CarouselOptions(
                clipBehavior: Clip.hardEdge,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                height: 200,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 10),
                autoPlayAnimationDuration: const Duration(seconds: 2),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                aspectRatio: 1.2,
                viewportFraction: 0.8,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            OrbBoardContainer(
              titleText: "얼굴 사진으로 향수 추천 받기",
              infoText: "Beta",
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: themeData.textTheme.bodyMedium?.fontSize,
              ),
              decoration: BoxDecoration(
                color: themeData.colorScheme.surface,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: themeData.colorScheme.onSurface,
                  width: 0.5,
                ),
              ),
              onTap: () async {
                await ref.read(routerProvider).push(RouteInfo.imageUpload.fullPath);
              },
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
