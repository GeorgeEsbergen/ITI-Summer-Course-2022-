import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var currenyFormatter = NumberFormat.simpleCurrency();

    return Scaffold(

        // backgroundColor: Colors.blue.withOpacity(0.3),
        body: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                TopSpendingCover(size: size),
                const SizedBox(
                  height: 32,
                ),
                SectionWithDetails(
                    title: "Planning Ahead",
                    spendingDetails: -540.52,
                    currenyFormatter: currenyFormatter),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  color: Colors.red,
                  child: Container(
                    child: const Text("asssa"),
                   padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),   
                    
                    ),
                ),
              ],
            )));
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

        //TODO:  1- repeat the last circle
        // Positioned(
        //   bottom: -size.width/2.5,
        //   right: -size.width/6,
        //   child: Opacity(
        //     opacity: 0.2,
        //     child: Container(
        //       width: size.width / 1.5,
        //       height: size.width / 1.5,
        //       decoration: const BoxDecoration(
        //           color: Colors.white, shape: BoxShape.circle),
        //     ),
        //   ),
        // ),
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
