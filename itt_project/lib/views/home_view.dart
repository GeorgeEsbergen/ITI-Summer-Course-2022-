import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'card_code.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var s = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = [
      const cardPart(iconData: Icons.confirmation_num_sharp  , price: -350.52, days: "in 2 days"),
      const cardPart(
          iconData: Icons.cake_rounded, price: -250.52, days: "in 3 days"),
      const cardPart(iconData: Icons.star, price: -139.52, days: "in 5 days"),
    ];

    var size = MediaQuery.of(context).size;

    var currenyFormatter = NumberFormat.simpleCurrency();

    return Scaffold(

      backgroundColor: Colors.white.withOpacity(0.9),
      // backgroundColor: Colors.blue.withOpacity(0.3),
      body: SingleChildScrollView(
        child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopSpendingCover(size: size),
                const SizedBox(
                  height: 32,
                ),
                SectionWithDetails(
                    title: "Planning Ahead",
                    spendingDetails: -540.52,
                    currenyFormatter: currenyFormatter),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  
                    padding: const EdgeInsets.only(left: 10),
                    height: 150,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => cards[index],
                        separatorBuilder: (context, index) =>
                            const Padding(padding: EdgeInsets.only(left: 1)),
                        itemCount: cards.length)),
                const Divider(
                  height: 60,
                  color: Colors.grey,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        " Last Month Expenses  ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        ' \$ -1850.32',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                    height: 50,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Column(
                              children: [
                                Text('$index'),
                                const Text('MAR'),
                              ],
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 20,
                            ),
                        itemCount: 30)),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(80)),
                  height: 400,
                  width: double.infinity,
                  child: Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Icon(Icons.person),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text('CraftWork'),
                                  ],
                                ),
                                const Text("-\$150.52")
                              ],
                            ),
                            const Divider(
                              height: 60,
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Icon(Icons.language),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('Focus Laab'),
                                  ],
                                ),
                                const Text(" -\$ 150.52")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),

      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  // **************************************    Bottom Navigation Bar    *****************************************************N
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
      selectedIconTheme: const IconThemeData(color: Colors.green),
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      showUnselectedLabels: true,
      backgroundColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_card,
          ),
          label: 'add',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
          ),
          label: 'Saves',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.menu,
          ),
          label: 'Menu ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star_border),
          label: 'Favorites',
        ),
      ],
    );
  }
}

class SectionWithDetails extends StatelessWidget {
  const SectionWithDetails({
    Key? key,
    required this.currenyFormatter,
    required this.title,
    this.spendingDetails = 0.0,
  }) : super(key: key);

  final NumberFormat currenyFormatter;
  final String title;
  final double spendingDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
          const Spacer(),
          Text(
            currenyFormatter.format(spendingDetails),
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            width: 8,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 12,
          )
        ],
      ),
    );
  }
}

class TopSpendingCover extends StatelessWidget {
  const TopSpendingCover({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 4,
      width: size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromRGBO(135, 220, 152, 1),
            Color.fromRGBO(101, 215, 163, 1),
            Color.fromRGBO(66, 208, 179, 1),
            Color.fromRGBO(49, 205, 189, 1),
          ])),
      child: Stack(
        children: [
          const FloatingCircles(),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.width / 10,
                ),
                const HeaderBar(),
                const SizedBox(
                  height: 16,
                ),
                const SpendingTotal(
                  amount: 5785.55,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SpendingTotal extends StatelessWidget {
  const SpendingTotal({
    Key? key,
    required this.amount,
  }) : super(key: key);
  final double amount;

  @override
  Widget build(BuildContext context) {
    var currenyFormatter = NumberFormat.simpleCurrency();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Total balance to spend",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          Text(currenyFormatter.format(amount).toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32)),
        ],
      ),
    );
  }
}

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    Key? key,
    this.showPayday = true,
  }) : super(key: key);

  final bool showPayday;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundImage: NetworkImage(
                "https://i.picsum.photos/id/988/100/100.jpg?hmac=D5aOTJ_7dRWIYG8W-R89ALn9d_wDyZPILlew6CSejF0"),
          ),
          Visibility(
            visible: showPayday,
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(2, 2),
                          spreadRadius: 2,
                          blurRadius: 2)
                    ]),
                child: const Text(
                  "Payday in a week",
                  style: TextStyle(
                    color: Color.fromRGBO(101, 215, 163, 1),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class FloatingCircles extends StatelessWidget {
  const FloatingCircles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: -size.width / 3,
          left: -size.width / 4,
          child: Opacity(
            opacity: 0.2,
            child: Container(
              width: size.width / 1.5,
              height: size.width / 1.5,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            ),
          ),
        ),
        Positioned(
          top: -size.width / 2,
          left: size.width / 6.5,
          child: Opacity(
            opacity: 0.2,
            child: Container(
              width: size.width / 1.5,
              height: size.width / 1.5,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            ),
          ),
        ),
        Positioned(
          bottom: -size.width / 2.5,
          right: -size.width / 6,
          child: Opacity(
            opacity: 0.2,
            child: Container(
              width: size.width / 1.5,
              height: size.width / 1.5,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            ),
          ),
        ),

        //  TODO  1- repeat the last circle
        Positioned(
          right: -size.width / 2,
          bottom: -size.width / 3.3,
          child: Opacity(
            opacity: 0.2,
            child: Container(
              width: size.width / 1.5,
              height: size.width / 1.1,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            ),
          ),
        ),
      ],
    );
  }
}

class NashatButton extends StatelessWidget {
  const NashatButton({
    Key? key,
    required this.text,
    this.borderColor,
    this.customTextStyle,
  }) : super(key: key);

  final String text;
  final Color? borderColor;
  final TextStyle? customTextStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderColor == null ? 0 : 4),
          borderRadius: BorderRadius.circular(10)),
      child: Container(
          padding: const EdgeInsets.all(4),
          color: Colors.indigo[300],
          margin: const EdgeInsets.all(4),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: customTextStyle ??
                const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.amber,
                    decorationStyle: TextDecorationStyle.wavy),
          )),
    );
  }
}
