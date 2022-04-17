import 'package:dennis_lechon_crm/models/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderListWidget extends StatefulWidget {
  const OrderListWidget({Key? key}) : super(key: key);

  @override
  State<OrderListWidget> createState() => _OrderListWidgetState();
}

class _OrderListWidgetState extends State<OrderListWidget> {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<Order>>(context);

    return ListView(
      padding: const EdgeInsets.all(20),
      children: orders.map((order) {
        String deliveryDate = order.deliveryDate;
        //double deliveryFee = order.deliveryFee;
        return GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
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
                                        color:
                                            Color.fromARGB(255, 209, 205, 205),
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
                                        text: const TextSpan(
                                          text: "Order ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: 1.0,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900),
                                          children: [
                                            TextSpan(
                                              text: "#28391829 ",
                                              style: TextStyle(
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
                                      const Text(
                                        'To be delivered on:     \u{1F4D9}   ',
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100),
                                      ),
                                      const SizedBox(height: 10),
                                      RichText(
                                        text: const TextSpan(
                                          text: '\u{26A1} RUSH    ',
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900),
                                          children: [
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
                                      backgroundColor:
                                          Color.fromARGB(255, 173, 23, 18),
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 23.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    SizedBox(height: 120),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'Name:',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    SizedBox(width: 0, height: 0),
                                    Text(
                                      'Emma Axe',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                          letterSpacing: 2.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 0, height: 0),
                                    Text(
                                      'Contact No.',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 0, height: 0),
                                    Text(
                                      '0923101293',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                          letterSpacing: 2.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 0, height: 0),
                                    Text(
                                      'Address',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      'Minglanilla, Cebu',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                          letterSpacing: 2.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'Order Details',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(height: 50),
                                  ],
                                ),
                                Positioned(
                                  top: 500,
                                  left: 35,
                                  child: RichText(
                                    text: const TextSpan(
                                      text: 'Total',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color:
                                              Color.fromARGB(255, 29, 29, 29),
                                          fontWeight: FontWeight.w900),
                                      children: [
                                        TextSpan(
                                          text: '  (5 items)  ',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 80, 79, 79),
                                            letterSpacing: 1.0,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '                  Php 5,000',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 80, 79, 79),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  color:
                                      const Color.fromARGB(255, 243, 243, 243),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 3,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 265.0),
                                  child: Padding(
                                      padding: const EdgeInsets.all(100),
                                      child: Column(children: const [
                                        Text(
                                          'Lechon Spicy',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 39, 39, 39),
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ])),
                                ),
                                Positioned(
                                  bottom: 175,
                                  right: 12,
                                  child: Row(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: const Color(0xFFD3231E),
                                          onPrimary: Colors.white,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          padding: const EdgeInsets.all(15.0),
                                          minimumSize: const Size(15, 5),
                                        ),
                                        child: const Text('Edit',
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      const SizedBox(width: 75),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: const Color(0xFFD3231E),
                                          onPrimary: Colors.white,
                                          elevation: 5,
                                          shape: const CircleBorder(),
                                          padding: const EdgeInsets.all(15.0),
                                          minimumSize: const Size(15, 5),
                                        ),
                                        child: const Icon(
                                            Icons.delete_forever_rounded),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(children: [
                            Flexible(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Sample Name',
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text("Sample Address",
                                        style:
                                            TextStyle(color: Colors.grey[500])),
                                  ]),
                            )
                          ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.redAccent),
                            child: Text(
                              deliveryDate,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const Text('Incoming Order')
                        ])
                  ],
                ),
              ),
            ));
      }).toList(),
    );
  }
}
