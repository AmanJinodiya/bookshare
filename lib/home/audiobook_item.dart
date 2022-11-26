import 'package:flutter/material.dart';

class audiobook_item extends StatelessWidget {
  const audiobook_item({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin: const EdgeInsets.only(left: 15),
        child: Row(children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2013/05/11/08/28/sunset-110305_1280.jpg'),
            radius: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "False Witness: A Novel",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "kerin Slaguter",
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
