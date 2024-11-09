import 'package:day_1_future/models/bottom_bar_item.dart';
import 'package:day_1_future/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var currenyFormatter = NumberFormat.simpleCurrency();
    bool canShowData = false;

    var dateFormatterMMMM = DateFormat.MMM();
    var dateFormatterD = DateFormat(DateFormat.DAY);

    var bottomBarItems = [
      {"label": "Spend", "icon": Icons.credit_card},
      {"label": "Save", "icon": Icons.favorite},
      {"label": "Schedule", "icon": Icons.calendar_today},
      {"label": "Menu", "icon": Icons.menu},
      {"label": "Profile", "icon": Icons.person},
      {"label": "", "icon": Icons.add},
    ];
    var bottomBarItems2 = [
      
      BttmBarItem(label: "Spend", icon: Icons.credit_card),
      BttmBarItem(label: "Save", icon: Icons.favorite),
      BttmBarItem(label: "Schedule", icon: Icons.calendar_today),
      BttmBarItem(label: "Menu", icon: Icons.menu),
      BttmBarItem(label: "Profile", icon: Icons.person),
      BttmBarItem(label: "", icon: Icons.add)
    ];

    List<Transaction> transactions = [
      Transaction(
          amount: 150.432,
          duration: const Duration(
            days: 3,
          )),
      Transaction(
          amount: 45.4,
          duration: const Duration(
            days: 4,
          )),
      Transaction(
          amount: 1250,
          duration: const Duration(
            days: 2,
          )),
      Transaction(
          amount: 222.5,
          duration: const Duration(
            days: 5,
          ))
    ];

    return Scaffold(
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
              SizedBox(
                  height: 150,
                  child: ListView.separated(
                    itemCount: transactions.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      var trans = transactions[index];

                      return AheadCard(
                        duration: trans.duration ?? Duration.zero,
                        amount: trans.amount ?? 0,
                      );
                    },
                    separatorBuilder: (_, __) {
                      return const VerticalDivider();
                    },
                  )),
              const SizedBox(
                height: 42,
              ),
              SectionWithDetails(
                  title: "Last Month Expense",
                  spendingDetails: -1800.50,
                  currenyFormatter: currenyFormatter),
              const SizedBox(
                height: 8,
              ),
              LimitedBox(
                maxHeight: 100,
                child: ListView.separated(
                  itemCount: 7,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    var day = 7 - (index + 1);
                    return Column(
                      children: [
                        Text(dateFormatterD.format(
                            DateTime.now().subtract(Duration(days: day)))),
                        Text(dateFormatterMMMM.format(DateTime.now())),
                        const SizedBox(
                          height: 8,
                        ),
                        Visibility(
                          visible: index == 6,
                          child: Container(
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                                color: Colors.grey, shape: BoxShape.circle),
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(
                      width: 32,
                    );
                  },
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.red,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: const Color.fromRGBO(101, 215, 163, 1),
          items:
          ///[this example was done with List<Map<String,Object>>]
          //  bottomBarItems.map((bNItem) {
          //   return BottomNavigationBarItem(
          //       icon: Icon(bNItem["icon"] as IconData),
          //       label: bNItem["label"] as String);
                
          // }).toList()

           bottomBarItems2.map((bNItem) {
            return BottomNavigationBarItem(
                icon: Icon(bNItem.icon),
                label:bNItem.label);
                
          }).toList()
          ,
        ));
  }
}

class AheadCard extends StatelessWidget {
  const AheadCard({
    Key? key,
    required this.duration,
    required this.amount,
  })  : assert(amount >= 0, "amount must be bigger than zero"),
        assert(duration > const Duration(hours: Duration.hoursPerDay),
            "at least a single day must be passed (24 hours)"),
        super(key: key);
  final Duration duration;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 12),
        height: 120,
        width: 145,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    // color: Colors.red,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: const Color.fromRGBO(88, 202, 253, 1)
                              .withOpacity(0.5),
                          offset: const Offset(1, 1),
                          spreadRadius: 2,
                          blurRadius: 3)
                    ],
                    gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color.fromRGBO(88, 202, 253, 1),
                          Color.fromRGBO(87, 173, 252, 1),
                          Color.fromRGBO(128, 143, 250, 1),
                        ])
                        ),
                child: const Icon(
                  Icons.access_time_filled_sharp,
                  size: 16,
                  color: Colors.white,
                )),
            Text(
              amount.toStringAsFixed(2),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromRGBO(83, 209, 174, 1)),
            ),
            Text(
              "in ${duration.inDays} days",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Color.fromRGBO(174, 175, 179, 1)),
            ),
          ],
        ),
      ),
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
            child: InkWell(
              onTap: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    //which date will display when user open the picker
                    firstDate: DateTime(1950),
                    //what will be the previous supported year in picker
                    lastDate: DateTime.now());
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
            ),
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
