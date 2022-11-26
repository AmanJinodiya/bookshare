import 'package:book/home/bottom_navigation.dart';
import 'package:book/home/list_item.dart';
import 'package:book/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';

import 'audiobook_item.dart';

class home_page extends StatelessWidget {
  const home_page({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color.fromRGBO(218, 170, 99, 1),
        bottomNavigationBar: bottom_navigation(),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      height: size.height * 0.85,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 250, 249, 249),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(249, 243, 238, 1),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30))),
                              height: size.height * 0.6,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // appbar
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.menu,
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                FirebaseAuth.instance.signOut();
                                              },
                                              child: const Icon(
                                                Icons.notifications_none,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            const CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    // Search
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText:
                                                'Titles, authors, or topics',
                                            hintStyle: TextStyle(
                                              color: Colors.grey[500],
                                            ),
                                            icon: const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15),
                                              child: Icon(
                                                Icons.search_rounded,
                                              ),
                                            ),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    const Text(
                                      'New & Trending',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // const SizedBox(
                                    //   height: 20,
                                    // ),

                                    Expanded(
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          list_item(
                                              path: 'assets/images/book2.jpg'),
                                          list_item(
                                              path: 'assets/images/book2.jpg'),
                                          list_item(
                                              path: 'assets/images/book3.jpg'),
                                          list_item(
                                              path: 'assets/images/book4.jpg')
                                        ],
                                      ),
                                    ),

                                    Container(
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
                                      child:
                                          Image.asset('assets/images/ss.jpg'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Audiobooks",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                                child: ListView(
                              children: const [
                                audiobook_item(),
                                audiobook_item(),
                                audiobook_item(),
                                audiobook_item()
                              ],
                            ))
                          ]),
                    ),
                  ],
                ),

                // const Align(
                //     alignment: Alignment.bottomCenter,
                //     child: bottom_navigation()),
              ],
            ),
          ),
        ));
  }
}
