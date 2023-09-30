

import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class Home extends StatefulWidget {
  static String routeName="Home";
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var b = Colors.black;

  var w = Colors.white;

  var r = Colors.green;


  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              color: Colors.grey,
              height: MediaQuery.of(context).size.height / 6,
              child: Column(

                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: r, // Background color
                    ),
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image,color: w,),
                        Text('From Gallery',style: TextStyle(
                            color: w
                        ),),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: r, // Background color
                    ),
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(

                      children: [
                        Icon(Icons.camera,color: w,),
                        Text('From Camera',style: TextStyle(
                            color: w
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: w,
      appBar: AppBar(
        backgroundColor:r,
        title: Center(
          child: Text('Test Blood',style:
          TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22
          ),),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: r, // Background color
                ),
                onPressed: () {
                  myAlert();
                },
                child: Text('Upload Now ',style:
                TextStyle(
                    color: w,
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //if image not null show the image
            //if image null show text
            image != null
                ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  //to show image, you type like this.
                  File(image!.path),
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                ),
              ),
            )
                : Text(
              "No Image",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
  void MethodSetting() {
    return setState(() {
      b = b == Colors.black ? Colors.white : Colors.black;
      w = w == Colors.white ? Colors.black : Colors.white;
    });
  }
}