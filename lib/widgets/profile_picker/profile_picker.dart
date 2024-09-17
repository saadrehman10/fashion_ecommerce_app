import 'dart:io';
import 'package:fashion_ecommerce_app/utils/colors.dart';
import 'package:fashion_ecommerce_app/widgets/profile_picker/crop_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicker extends StatefulWidget {
  final Function(ImageProvider?) imgReturnFunction;
  const ProfilePicker({super.key, required this.imgReturnFunction});
  @override
  State<ProfilePicker> createState() => _ProfilePickerState();
}

class _ProfilePickerState extends State<ProfilePicker> {
  ImageProvider? _selectedImage;

  Future _pickImageFromGallery() async {
    final returnedImages =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImages == null) return null;
    final croppedImage = await Navigator.push(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(
        builder: (context) => CropImage(cropImage: File(returnedImages.path)),
      ),
    );
    setState(() {
      _selectedImage = croppedImage;
      widget.imgReturnFunction(_selectedImage);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImages =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImages == null) return null;
    final croppedImage = await Navigator.push(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(
        builder: (context) => CropImage(cropImage: File(returnedImages.path)),
      ),
    );
    setState(() {
      _selectedImage = croppedImage;
      widget.imgReturnFunction(_selectedImage);
    });
  }

  void _showDialogAlert() {
    setState(() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Select Image form'),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      _pickImageFromGallery();
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.image, size: 20, color: AppColors.secondary),
                        const SizedBox(width: 10),
                        const Text(
                          'Gallery',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _pickImageFromCamera();
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.camera,
                            size: 20, color: AppColors.secondary),
                        const SizedBox(width: 10),
                        const Text(
                          'Camera',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: _selectedImage != null ? true : false,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedImage = null;
                          widget.imgReturnFunction(_selectedImage);
                        });
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.cancel,
                              size: 20, color: AppColors.secondary),
                          const SizedBox(width: 10),
                          const Text(
                            'Remove Profile',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('cancel')),
              ],
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDialogAlert();
      },
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            backgroundImage: _selectedImage,
            radius: 70,
            backgroundColor: Colors.grey[200],
            child: _selectedImage == null
                // ignore: deprecated_member_use
                ? const Icon(FontAwesomeIcons.userAlt,
                    size: 50, color: Colors.grey)
                : null,
          ),
          IconButton(
            onPressed: () {
              _showDialogAlert();
            },
            style: IconButton.styleFrom(
                padding: const EdgeInsets.all(10),
                backgroundColor: AppColors.secondary),
            iconSize: 15,
            icon: const Icon(
              FontAwesomeIcons.pen,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
