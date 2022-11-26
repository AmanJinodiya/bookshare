import 'package:book/detail/preview.dart';
import 'package:flutter/material.dart';

class list_item extends StatelessWidget {
  list_item({
    Key? key,
    required this.path,
  }) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const preview())),
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black54,
                blurRadius: 25.0,
                spreadRadius: -25.0,
                offset: Offset(25.0, 100.0),
              )
            ],
            // ignore: unnecessary_const
            color: Color.fromRGBO(249, 243, 238, 1),
          ),
          child: Row(
            children: [
              Image.asset(
                path,
              ),
              Image.asset('assets/images/bb.jpg')
            ],
          ),
        ),
      ),
    );
  }
}
