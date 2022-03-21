import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practical_harsh/profile.dart';

class image_picker1 extends StatefulWidget {
  const image_picker1({Key? key}) : super(key: key);

  @override
  _image_picker1State createState() => _image_picker1State();
}

class _image_picker1State extends State<image_picker1> {
  File? picture;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != Null) {
        picture = File(pickedFile!.path);
      }
    });
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != Null) {
        picture = File(pickedFile!.path);
      }
    });
  }

  Future showOptions() async {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                  child: Text('Photo form Gallery'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    getImageFromGallery();
                  },
                ),
                CupertinoActionSheetAction(
                  child: Text('Photo form Camera'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    getImageFromCamera();
                  },
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('Image Picker'),
        centerTitle: false,
        leading: IconButton(
          onPressed: () =>
            Navigator.pop(context,false),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),

        // Icon(Icons.arrow_back),
      ),
      body: Container(
        height: 100,
        color: Colors.red[100],
        child: Align(
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child: CircleAvatar(
                    maxRadius: 40,
                    backgroundImage: picture == null
                        ? AssetImage('image/empty.png')
                        : Image.file(picture!).image),
              ),
              Positioned(
                right: 1,
                child: IconButton(
                    color: Colors.blue[500],
                    icon: Icon(Icons.add_a_photo),
                    onPressed: showOptions),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
