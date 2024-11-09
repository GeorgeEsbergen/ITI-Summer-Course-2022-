import 'package:flutter/material.dart';

class cardPart extends StatelessWidget {



  final IconData iconData;
  final double price;
  final String days;

  const cardPart(
      {super.key,
      required this.iconData,
      required this.price,
      required this.days});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 140,
      width: 140,
      padding: const EdgeInsets.all(8),
      child: Card(

          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          child: Container(

            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 17,
                  child: Icon(iconData , color: Colors.greenAccent,),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '$price',
                  style: (const TextStyle(color: Colors.green)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  days,
                  style: (TextStyle(color: Colors.grey.withOpacity(0.99))),
                )
              ],
            ),
          )),
    );
  }
}
