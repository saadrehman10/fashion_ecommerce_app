import 'dart:io';
import 'package:fashion_ecommerce_app/widgets/profile_picker/crop_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ProfilePicker extends StatefulWidget {
  const ProfilePicker({super.key});
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
      context,
      MaterialPageRoute(
        builder: (context) => CropImage(cropImage: File(returnedImages.path)),
      ),
    );
    setState(() {
      _selectedImage = croppedImage;
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImages =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImages == null) return null;
    final croppedImage = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CropImage(cropImage: File(returnedImages.path)),
      ),
    );
    setState(() {
      _selectedImage = croppedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Select Image form'),
                  content: SizedBox(
                    height: _selectedImage == null ? 100.0 : 150.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          child: const Row(
                            children: [
                              Icon(Icons.image, size: 20, color: Colors.black),
                              SizedBox(width: 10),
                              Text(
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
                          child: const Row(
                            children: [
                              Icon(Icons.camera, size: 20, color: Colors.black),
                              SizedBox(width: 10),
                              Text(
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
                              });
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.cancel,
                                    size: 20, color: Colors.black),
                                SizedBox(width: 10),
                                Text(
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
      },
      child: CircleAvatar(
        backgroundImage: _selectedImage,
        radius: 50,
        backgroundColor: Colors.grey,
        child: _selectedImage == null
            ? const Icon(Icons.add, size: 40, color: Colors.white)
            : null,
      ),
    );
  }
}

