import 'dart:io' as io;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class add extends StatefulWidget {
  add({super.key});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  final _tittle = TextEditingController();

  final _author = TextEditingController();

  final _email = TextEditingController();

  final _desc = TextEditingController();

  String image_url = "";
  String image_text = "Add_Image";

  Future add_book() async {
    var z = await FirebaseFirestore.instance.collection('Books').add({
      'tittle': _tittle.text.trim(),
      'author': _author.text.trim(),
      'email': _email.text.trim(),
      'image_url': image_url
    });
  }

  Future add_image() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg'],
    );

    if (result == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No file Selected'),
        ),
      );
      return null;
    }
    final path = result.files.single.path;
    final file_name = result.files.single.name;
    String file_path = "";
    if (path != Null) {
      file_path = path!;

      var z = await FirebaseStorage.instance
          .ref('/books/$file_name')
          .putFile(io.File(file_path));

      image_url = await FirebaseStorage.instance
          .ref('/books/$file_name')
          .getDownloadURL();

      print(image_url);

      setState(() {
        image_text = 'Added';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 243, 238, 1),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: size.height * 0.8,
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(children: [
                  Stack(
                    children: [
                      Container(
                        alignment: FractionalOffset.bottomCenter,
                        decoration: const BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 15.0,
                              spreadRadius: -25.0,
                              offset: Offset(0.0, 25.0),
                            )
                          ],
                          // ignore: unnecessary_const
                          color: Color.fromRGBO(249, 243, 238, 1),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.3,
                            ),
                            Image.asset('assets/images/ss.jpg'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: size.height * 0.3,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0,
                                    color: Colors.black,
                                    style: BorderStyle.solid),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Center(
                                    child: MaterialButton(
                                  onPressed: () {
                                    add_image();
                                  },
                                  child: Text(
                                    image_text,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 30.0),
                                  ),
                                )),
                              ),
                            ),
                            Image.asset(
                              'assets/images/bb.jpg',
                              height: size.height * 0.3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0, right: 50, top: 20),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: TextField(
                              controller: _tittle,
                              decoration: const InputDecoration(
                                hintText: 'The last Thing He Told Me',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                                label: Text('Tittle'),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: TextField(
                              controller: _author,
                              decoration: const InputDecoration(
                                hintText: 'Kevin saughter',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                                label: Text('Author'),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: TextField(
                              controller: _email,
                              decoration: const InputDecoration(
                                hintText: 'Am******ia@gmail.com',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                                label: Text('Email'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              '#1 New Your Timees Besselltr selection of thereese.Whiesperson Book clue in club New Your Timees Besselltr selection of thereese.Whiesperson Book clue in club',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromRGBO(218, 170, 99, 1)),
                                ),
                                onPressed: add_book,
                                child: const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text("Add for Other"),
                                )))
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
    ;
  }
}
