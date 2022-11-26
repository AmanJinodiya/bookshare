import 'package:flutter/material.dart';

class preview extends StatelessWidget {
  const preview({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 243, 238, 1),
      body: Column(children: [
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
                          Image.asset(
                            'assets/images/book2.jpg',
                            height: size.height * 0.3,
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
                      const Text(
                        "The Last Thing He Told Me",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Kevin Shaghter",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.grey[400]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "amanjinodi****@gmail.com",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        '#1 New Your Timees Besselltr selection of thereese.Whiesperson Book clue in club New Your Timees Besselltr selection of thereese.Whiesperson Book clue in club',
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(218, 170, 99, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          '5758 Ratings',
                          style: TextStyle(fontSize: 15),
                        ),
                        Icon(Icons.more_horiz)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              width: size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 214, 181, 132),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    'Sample',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              width: size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    'Buy NOW',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
