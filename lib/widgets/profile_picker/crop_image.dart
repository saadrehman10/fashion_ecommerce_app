import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:custom_image_crop/custom_image_crop.dart';
import 'dart:math';
import 'dart:io';

class CropImage extends StatefulWidget {
  final File cropImage;
  const CropImage({required this.cropImage, super.key});
  @override
  State<CropImage> createState() => _CropImageState();
}

class _CropImageState extends State<CropImage> {
  late CustomImageCropController controller;

  @override
  void initState() {
    super.initState();
    controller = CustomImageCropController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomImageCrop(
                cropController: controller,
                image: FileImage(widget.cropImage),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(Icons.refresh,
                        size: 30, color: AppColors.secondary),
                    onPressed: controller.reset),
                IconButton(
                    icon: Icon(Icons.zoom_in,
                        size: 30, color: AppColors.secondary),
                    onPressed: () =>
                        controller.addTransition(CropImageData(scale: 1.33))),
                IconButton(
                    icon: Icon(Icons.zoom_out,
                        size: 30, color: AppColors.secondary),
                    onPressed: () =>
                        controller.addTransition(CropImageData(scale: 0.75))),
                IconButton(
                    icon: Icon(Icons.rotate_left,
                        size: 30, color: AppColors.secondary),
                    onPressed: () => controller
                        .addTransition(CropImageData(angle: -pi / 4))),
                IconButton(
                    icon: Icon(Icons.rotate_right,
                        size: 30, color: AppColors.secondary),
                    onPressed: () =>
                        controller.addTransition(CropImageData(angle: pi / 4))),
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.check, size: 30, color: AppColors.secondary),
                  onPressed: () async {
                    final croppedImage = await controller.onCropImage();
                    if (croppedImage != null) {
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop(croppedImage);
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom * 3),
          ],
        ),
      ),
    );
  }
}
