import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../modules/orb/components/components.dart';

class ImageUploadScreen extends ConsumerStatefulWidget {
  const ImageUploadScreen({Key? key}) : super(key: key);

  @override
  createState() => _ProfileScreen();
}

class _ProfileScreen extends ConsumerState<ImageUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return OrbScaffold(
      orbAppBar: OrbAppBar(
        title: '이미지 업로드',
        centerTitle: true,
      ),
      body: Center(
        child: Text('이미지 업로드'),
      ),
    );
  }


}