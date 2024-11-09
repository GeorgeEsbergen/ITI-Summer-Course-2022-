import 'package:flutter/material.dart';
import 'package:itt_project/travel_app/main_screen.dart';

class PopularPage extends StatelessWidget {
  const PopularPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height / 3,
            width: double.infinity,
            color: Colors.blue,
            child: Stack(
              children: [
                Image.network(
                  "https://www.mexatk.com/wp-content/uploads/2016/11/%D8%B5%D9%88%D8%B1-%D9%85%D9%86%D8%A7%D8%B8%D8%B1-%D8%B7%D8%A8%D9%8A%D8%B9%D9%8A%D8%A9-%D8%B1%D8%A7%D8%A6%D8%B9%D8%A9-%D8%AE%D9%84%D8%A7%D8%A8%D8%A9-%D8%AC%D9%85%D9%8A%D9%84%D8%A9-%D9%88-%D8%B1%D9%88%D8%B9%D8%A9-2-450x281.jpg",
                  fit: BoxFit.fill,
                  height: size.height / 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 25),
                  child: CircleAvatar(
                      radius: 20,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>StartScreens()));
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ))),
                ),
                Positioned(
                    bottom: size.height / 50,
                    left: size.width / 2.2,
                    child: Row(
                      children: const [
                        Dots(
                          height: 10,
                          width: 10,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Dots(
                          height: 5,
                          width: 5,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Dots(
                          height: 5,
                          width: 5,
                        ),
                      ],
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        Text(
                          "Badalgachhi , Naogoan",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.favorite,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.bookmark_border,
                          color: Colors.black,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Somapura Mahavihara ",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 3,
                  width: size.width / 3,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(80)),
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    ),
                    Text(
                      "11 People liked this",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.message,
                      color: Colors.grey,
                    ),
                    Text(
                      " 1",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Somapura Mahavihara was one of the most famous Buddhist monasticinstitutions of ancient Bengal. The excavated monastic complex at paharpur has been identified with the Somapura Mahavihara built by the second Pala king dharmapala (c 781-821 AD). Some clay seals from the ruins bear the inscription "
                  "Shri-Somapure-Shri-Dharmapaladeva-Mahavihariyarya-bhiksu-sangghasya. Taranatha and other Tibetan sources mention that devapala built it after his conquest of varendra.",
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "To Do ",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 3,
                  width: size.width / 10,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(80)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Dots extends StatelessWidget {
  const Dots({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);
  final double height;

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
    );
  }
}
