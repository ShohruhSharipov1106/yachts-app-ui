

import 'package:flutter/material.dart';
import 'package:yachts_app_ui/screens/payment_page.dart';

class YachtPage extends StatelessWidget {
  String? kelganYachtName, kelganYachtPrice;
  YachtPage(this.kelganYachtName, this.kelganYachtPrice);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: _yachtPageAppBar(context),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Row(
              children: [
                _yachtInformation(),
                imgPart(),
              ],
            ),
          ),
          rentButton(context),
        ],
      ),
    );
  }

  Expanded _yachtInformation() {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              kelganYachtName.toString(),
              style: const TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
                children: [
                  TextSpan(
                    text: "\$",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.grey[300],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "$kelganYachtPrice\t",
                    style: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(text: "\t/\t"),
                  const TextSpan(text: "\tday"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          _informationCard(74, 1, "Lengths"),
          const SizedBox(height: 10.0),
          _informationCard(25, 2, "Height"),
          const SizedBox(height: 10.0),
          _informationCard(90, 3, "Draft"),
        ],
      ),
      flex: 1,
    );
  }

  Expanded imgPart() {
    return Expanded(
      child: Stack(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: Image.asset(
              "assets/images/yacht_top.png",
            ),
          ),
          Positioned(
            child: CircleAvatar(
              backgroundColor: Colors.grey[800],
              radius: 35.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.keyboard_arrow_up_rounded,
                    size: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.keyboard_arrow_left_rounded,
                        size: 20.0,
                      ),
                      Text(
                        "360",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 20.0,
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 20.0,
                  ),
                ],
              ),
            ),
            bottom: 50.0,
            right: 50.0,
          ),
        ],
      ),
      flex: 1,
    );
  }

  Expanded rentButton(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(15.0),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Rent now",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(40.0, 40.0),
                      fixedSize: const Size(40.0, 40.0),
                      padding: const EdgeInsets.all(0)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(
                          int.parse(kelganYachtPrice!),
                        ),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black87,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card _informationCard(int sizes, int rotates, String parts) {
    return Card(
      color: Colors.blue[700],
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.white,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Container(
            width: 120.0,
            padding: const EdgeInsets.only(
              right: 15.0,
              top: 5.0,
            ),
            alignment: Alignment.centerRight,
            child: RotatedBox(
              quarterTurns: rotates,
              child: const Icon(
                Icons.height,
                color: Colors.white60,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                ),
                children: [
                  TextSpan(
                    text: "$sizes\t",
                    style: const TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const TextSpan(text: "\tm"),
                  TextSpan(
                    text: "\n$parts",
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white70,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _yachtPageAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 20.0,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border_rounded,
            color: Colors.white,
            size: 20.0,
          ),
        ),
      ],
    );
  }
}
