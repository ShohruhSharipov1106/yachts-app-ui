import 'dart:ui';

import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  int kelgannarx;
  PaymentPage(this.kelgannarx);
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isPressed = false;
  int? _overallPrice;
  int _count = 1;
  @override
  void initState() {
    super.initState();
    int _overallPrice = widget.kelgannarx;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: paymentAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            title(),
            const SizedBox(height: 30.0),
            rentingDay(),
            const SizedBox(height: 50.0),
            _paymentCardTitle(),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 270.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _informOfCartas(
                    Colors.blue[800]!,
                    2293,
                    Colors.white,
                    "23 890",
                    "Platinum",
                    "assets/images/Mastercard-Logo.png",
                  ),
                  _informOfCartas(
                    Colors.grey[200]!,
                    3456,
                    Colors.black,
                    "15 000",
                    "Debit",
                    "assets/images/visa_logo.png",
                  ),
                  _informOfCartas(
                    Colors.grey[200]!,
                    5344,
                    Colors.black,
                    "3 735",
                    "PayPal",
                    "assets/images/paypal_logo.png",
                  ),
                  _informOfCartas(
                    Colors.blue[800]!,
                    2721,
                    Colors.white,
                    "527",
                    "Discovery",
                    "assets/images/discover-network-vector-logo.png",
                  ),
                  _informOfCartas(
                    Colors.grey[200]!,
                    7827,
                    Colors.black,
                    "87",
                    "American",
                    "assets/images/American-Express-Logo-PNG-Transparent-Image.png",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50.0),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(280.0, 50.0),
                        primary: Colors.grey[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        alignment: Alignment.centerLeft),
                    onPressed: () {},
                    child: const Text(
                      "Pay now",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(30.0, 50.0),
                      primary: Colors.grey[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: const Icon(Icons.qr_code_scanner),
                  ),
                  const SizedBox(width: 10.0)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _informOfCartas(
      Color colorOfCarta,
      int lastNumOfCarta,
      Color colorOfText,
      String summOfCarta,
      String nameOfCarta,
      String imgOfCarta) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(20.0),
      width: 150.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: colorOfCarta,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400]!,
              spreadRadius: 5.0,
              blurRadius: 5.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.sim_card,
                size: 25.0,
                color: colorOfText,
              ),
              const SizedBox(width: 20.0),
              Icon(
                Icons.circle,
                size: 5.0,
                color: colorOfText,
              ),
              Icon(
                Icons.circle,
                size: 5.0,
                color: colorOfText,
              ),
              Icon(
                Icons.circle,
                size: 5.0,
                color: colorOfText,
              ),
              Icon(
                Icons.circle,
                size: 5.0,
                color: colorOfText,
              ),
              const SizedBox(width: 5.0),
              Text(
                "$lastNumOfCarta",
                style: TextStyle(
                  fontSize: 14.0,
                  color: colorOfText,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$" + summOfCarta,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: colorOfText,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nameOfCarta,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      imgOfCarta,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding _paymentCardTitle() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey[700],
            fontWeight: FontWeight.w600,
          ),
          children: const [
            TextSpan(
              text: "Payment\t",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: "Cards"),
          ],
        ),
      ),
    );
  }

  Text title() {
    return const Text(
      "Checkout",
      style: TextStyle(
        color: Colors.black,
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  SizedBox rentingDay() {
    return SizedBox(
      height: 100.0,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Days",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isPressed = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: const Size(135.0, 45.0),
                    primary: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 16.0,
                        backgroundColor: Colors.transparent,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _count <= 0 ? _count = 0 : _count -= 1;
                              _overallPrice = _count * widget.kelgannarx;
                              isPressed = true;
                            });
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 16.0,
                          ),
                        ),
                      ),
                      Text(
                        "$_count",
                        style: const TextStyle(
                          fontSize: 28.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        radius: 16.0,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _count += 1;
                              _overallPrice = _count * widget.kelgannarx;
                              isPressed = true;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.blue[800],
                            size: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            flex: 1,
          ),
          VerticalDivider(
            color: Colors.grey[600],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    isPressed ? "\$$_overallPrice" : "\$${widget.kelgannarx}",
                    style: const TextStyle(
                      fontSize: 32.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }

  AppBar paymentAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 80,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
          size: 20.0,
        ),
      ),
    );
  }
}
