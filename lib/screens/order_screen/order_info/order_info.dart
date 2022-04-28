// ignore_for_file: avoid_unnecessary_containers, unnecessary_string_interpolations

import 'package:dennis_lechon_crm/models/order.dart';
import 'package:flutter/material.dart';

class OrderInfo extends StatefulWidget {
  const OrderInfo({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  State<OrderInfo> createState() => _OrderInfoState();
}

class _OrderInfoState extends State<OrderInfo> {
  @override
  Widget build(BuildContext context) {
    final smallLechonPrice = 5000 * widget.order.smallLechon;
    final mediumLechonPrice = 6000 * widget.order.mediumLechon;
    final largeLechonPrice = 7000 * widget.order.largeLechon;
    final extraLargeLechonPrice = 8000 * widget.order.extraLargeLechon;
    final subPrice = smallLechonPrice +
        mediumLechonPrice +
        largeLechonPrice +
        extraLargeLechonPrice;
    final totalItem = widget.order.smallLechon +
        widget.order.mediumLechon +
        widget.order.largeLechon +
        widget.order.extraLargeLechon as int;
    final leftSection = Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              "Whole Lechon",
              style: TextStyle(
                color: Color.fromARGB(255, 80, 79, 79),
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            Text(
              "(Small)",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 25),
            Text(
              "Whole Lechon",
              style: TextStyle(
                color: Color.fromARGB(255, 65, 64, 64),
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            Text(
              "(Medium)",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 25),
            Text(
              "Whole Lechon",
              style: TextStyle(
                color: Color.fromARGB(255, 71, 71, 71),
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            Text(
              "(Large)",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 25),
            Text(
              "Whole Lechon",
              style: TextStyle(
                color: Color.fromARGB(255, 71, 71, 71),
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            Text(
              "(Extra Large)",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );

    final middleSection = Expanded(
      child: Container(
        padding: const EdgeInsets.only(right: 5.0),
        child: Column(
          children: <Widget>[
            Text(
              widget.order.smallLechon.toString(),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 50),
            Text(
              widget.order.mediumLechon.toString(),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 50),
            Text(
              widget.order.largeLechon.toString(),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 50),
            Text(
              widget.order.extraLargeLechon.toString(),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );

    final rightSection = Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "$smallLechonPrice",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 50),
            Text(
              "$mediumLechonPrice",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 50),
            Text(
              "$largeLechonPrice",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 50),
            Text(
              "$extraLargeLechonPrice",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      contentPadding: const EdgeInsets.only(top: 0.0),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                const Positioned(
                  top: 10,
                  right: 22,
                  child: Text(
                    "#2891382 ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 209, 205, 205),
                        letterSpacing: 1.0,
                        fontSize: 13,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 105,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD3231E),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      RichText(
                        text: TextSpan(
                          text: "Order ",
                          style: const TextStyle(
                              color: Colors.white,
                              letterSpacing: 1.0,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                          children: [
                            TextSpan(
                              text: "#${widget.order.id.substring(0, 5)}",
                              style: const TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.0,
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'To be delivered on:     \u{1F4D9}${widget.order.deliveryDate}   ',
                        style: const TextStyle(
                            fontSize: 13.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w100),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text:
                              widget.order.deliveryType ? "\u{26A1} RUSH" : "",
                          style: const TextStyle(
                              fontSize: 13.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                          children: const [
                            TextSpan(
                              text: '\u{2705} ACTIVE',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.0,
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 3.0,
                  top: 5.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const CircleAvatar(
                      radius: 17,
                      backgroundColor: Color.fromARGB(255, 173, 23, 18),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 23.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(height: 245),
                      Text(
                        'Name:',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(width: 195, height: 0),
                      Text(
                        'Contact Number:',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 290),
                      Text(
                        widget.order.firstName,
                        style: const TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(width: 130, height: 0),
                      Text(
                        widget.order.celNum,
                        style: const TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 175),
                      const Text(
                        'Address',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        widget.order.adrBarangay + widget.order.adrCity,
                        style: const TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Order Details',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
                Card(
                  color: const Color.fromARGB(255, 243, 243, 243),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 3,
                  margin: const EdgeInsets.fromLTRB(15, 265, 15, 65),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        orderWidget(
                            "Whole Lechon", "(Small)", "x2", "Php 1000"),
                        orderWidget(
                            "Lechon Original", "(Small)", "x2", "Php 1000"),
                        orderWidget("Whole Lechon", "(Big)", "x1", "Php 2000"),
                        const SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            text: 'Total',
                            style: const TextStyle(
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 29, 29, 29),
                                fontWeight: FontWeight.w900),
                            children: [
                              TextSpan(
                                text: '  ($totalItem items)  ',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 80, 79, 79),
                                  letterSpacing: 1.0,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              TextSpan(
                                text: '                        Php $subPrice',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 80, 79, 79),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //middleSection,
                        //rightSection,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFD3231E),
                          onPrimary: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: const EdgeInsets.all(15.0),
                          minimumSize: const Size(15, 5),
                        ),
                        child: const Text('   Edit   ',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 82),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFD3231E),
                          onPrimary: Colors.white,
                          elevation: 5,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(15.0),
                          minimumSize: const Size(15, 5),
                        ),
                        child: const Icon(Icons.delete_forever_rounded),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Container orderWidget(String name, String size, String amt, String price) {
  return Container(
    height: 60,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "$name",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 71, 71, 71),
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "$size",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(width: 15),
            Text(
              "$amt",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              width: 25,
            ),
            Text(
              "$price",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
