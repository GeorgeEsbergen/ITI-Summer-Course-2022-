import 'package:flutter/material.dart';
import 'package:itt_project/travel_app/popular_page.dart';

class StartScreens extends StatefulWidget {
  const StartScreens({Key? key}) : super(key: key);

  @override
  State<StartScreens> createState() => _StartScreensState();
}

class _StartScreensState extends State<StartScreens> {
  var s = 0;
  List Stories = const [
    StoryView(
      imageUrl:
          "https://2.bp.blogspot.com/-GjgogUxvgGU/U14SXiAs4aI/AAAAAAAAUy4/eWjrgeu5BcA/s1600/Beautiful-natural-scener+(10).jpg",
      text: "Jaflong",
      number: "11",
    ),
    StoryView(
      imageUrl:
          "https://gamesme.club/wp-content/uploads/2022/03/1647479702_%D8%AE%D9%8E%D9%84%D9%92%D9%81%D9%90%D9%8A%D9%91%D9%8E%D8%A7%D8%AA%D9%8D-%D8%A7%D9%8A%D9%81%D9%88%D9%86-%D8%AE%D9%8E%D9%84%D9%92%D9%81%D9%90%D9%8A%D9%91%D9%8E%D8%A7%D8%AA%D9%8D-%D9%85%D9%86%D8%A7%D8%B8%D8%B1-%D8%B7%D8%A8%D9%8A%D8%B9%D9%8A%D8%A9-%D8%B5%D9%88%D8%B1-%D8%AE%D9%8E%D9%84%D9%92%D9%81%D9%90%D9%8A%D9%91%D9%8E%D8%A7%D8%AA%D9%8D-%D9%85%D9%86%D8%A7%D8%B8%D8%B1-%D8%B7%D8%A8%D9%8A%D8%B9%D9%8A%D8%A9-%D8%B3%D8%A7%D8%AD%D8%B1%D8%A9.jpg",
      text: "Bichanakandi",
      number: "15",
    ),
    StoryView(
      imageUrl:
          "https://i2.wp.com/www.shmlool.com/wp-content/uploads/%D9%85%D9%86%D8%A7%D8%B8%D8%B1-%D8%B7%D8%A8%D9%8A%D8%B9%D9%8A%D8%A916.jpg",
      text: "Lavache",
      number: "12",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              ListTile(
                title: const TextsStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black54,
                  text: 'Travel Hour',
                ),
                subtitle: const Text("Explore Bangladesh"),
                trailing: Container(
                  height: 50,
                  width: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Center(
                  child: SizedBox(
                    height: 45,
                    width: 360,
                    child: TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search_rounded,
                            color: Colors.black54,
                          ),
                          labelText: "   Search places & Explore ",
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: const BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        )),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  "Featured Places ",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 250,
                  width: 350,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 200,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.network(
                            "https://www.mexatk.com/wp-content/uploads/2016/11/%D8%B5%D9%88%D8%B1-%D9%85%D9%86%D8%A7%D8%B8%D8%B1-%D8%B7%D8%A8%D9%8A%D8%B9%D9%8A%D8%A9-%D8%B1%D8%A7%D8%A6%D8%B9%D8%A9-%D8%AE%D9%84%D8%A7%D8%A8%D8%A9-%D8%AC%D9%85%D9%8A%D9%84%D8%A9-%D9%88-%D8%B1%D9%88%D8%B9%D8%A9-2-450x281.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        left: 50,
                        child: SizedBox(
                          height: 120,
                          width: 250,
                          child: Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Volagonjo Sadapathor",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      Text(
                                        "Volagonjo,Sylhet",
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        '10',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Icon(
                                        Icons.message_outlined,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        '0',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Dots(
                    w: 7,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Dots(
                    w: 7,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Dots(
                    w: 30,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Dots(
                    w: 7,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Dots(
                    w: 7,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Popular Places ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                          Text(
                            'view all >>',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  )),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PopularPage()));
                },
                child: SizedBox(
                  height: 200,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Stories[index],
                      separatorBuilder: (context, index) =>
                          const Padding(padding: EdgeInsets.only(left: 15)),
                      itemCount: Stories.length),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          s = index;
        });
      },
      currentIndex: s,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      showSelectedLabels: true,
      selectedIconTheme: const IconThemeData(
        color: Colors.black,
      ),
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.explore_rounded,
          ),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.camera,
          ),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.bookmark_border,
          ),
          label: 'Book mark',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_rounded),
          label: 'Person',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Setting',
        ),
      ],
    );
  }
}

class StoryView extends StatelessWidget {
  const StoryView({
    Key? key,
    required this.imageUrl,
    required this.text,
    required this.number,
  }) : super(key: key);

  final String imageUrl;
  final String text;

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.black54, borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
              width: 150,
            ),
          ),
          Positioned(
            top: 15,
            right: 7,
            child: Container(
              height: 35,
              width: 90,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  Text(
                    number,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 20,
              left: 15,
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}

class TextsStyle extends StatelessWidget {
  const TextsStyle({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.color,
    this.fontWeight,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color color;
  final dynamic fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
}

class Dots extends StatelessWidget {
  const Dots({
    Key? key,
    required this.w,
    required this.color,
  }) : super(key: key);
  final double w;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: w,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    );
  }
}
