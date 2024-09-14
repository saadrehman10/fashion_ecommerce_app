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
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Crop Image', style: TextStyle(color: Colors.white)),
      ),
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
                    icon: const Icon(Icons.refresh,
                        size: 30, color: Colors.black),
                    onPressed: controller.reset),
                IconButton(
                    icon: const Icon(Icons.zoom_in,
                        size: 30, color: Colors.black),
                    onPressed: () =>
                        controller.addTransition(CropImageData(scale: 1.33))),
                IconButton(
                    icon: const Icon(Icons.zoom_out,
                        size: 30, color: Colors.black),
                    onPressed: () =>
                        controller.addTransition(CropImageData(scale: 0.75))),
                IconButton(
                    icon: const Icon(Icons.rotate_left,
                        size: 30, color: Colors.black),
                    onPressed: () => controller
                        .addTransition(CropImageData(angle: -pi / 4))),
                IconButton(
                    icon: const Icon(Icons.rotate_right,
                        size: 30, color: Colors.black),
                    onPressed: () =>
                        controller.addTransition(CropImageData(angle: pi / 4))),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.check, size: 30, color: Colors.black),
                  onPressed: () async {
                    final croppedImage = await controller.onCropImage();
                    if (croppedImage != null) {
                      Navigator.of(context).pop(croppedImage);
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }
}
