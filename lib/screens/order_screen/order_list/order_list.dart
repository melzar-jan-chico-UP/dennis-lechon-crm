import 'package:dennis_lechon_crm/models/order.dart';
import 'package:dennis_lechon_crm/screens/order_screen/order_info/order_info_new.dart';
//import 'package:dennis_lechon_crm/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

String getDateFromDate(DateTime givenDate) {
  var months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  String datePart =
      '${months[(givenDate.month) - 1]} ${givenDate.day.toString().padLeft(2, '0')}, ${givenDate.year}';
  return datePart;
}

class OrderListWidget extends StatefulWidget {
  const OrderListWidget({Key? key}) : super(key: key);

  @override
  State<OrderListWidget> createState() => _OrderListWidgetState();
}

class _OrderListWidgetState extends State<OrderListWidget> {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<Order>>(context);

    return (orders.isEmpty)
        ? const Directionality(
            key: Key("Spin"),
            textDirection: TextDirection.ltr,
            child: Center(
              child: SpinKitFadingCircle(
                color: Colors.black45,
                size: 50.0,
              ),
            ))
        : Directionality(
            key: const Key("Order List from OrderListWidget"),
            textDirection: TextDirection.ltr,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: orders.map((order) {
                String deliveryDate = getDateFromDate(order.dateDelivery);
                String orderHash = order.id.substring(0, 5);
                bool deliveryType = order.isRush;
                String firstName = order.firstName;
                String lastName = order.lastName;
                return GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return OrderInfo(order: order);
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Order #$orderHash',
                                              style: GoogleFonts.mulish(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "$firstName $lastName",
                                              style: GoogleFonts.mulish(
                                                fontSize: 15,
                                                color: Colors.grey,
                                              ),
                                            ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xFFD3231E)),
                                    child: Text(
                                      deliveryDate,
                                      style: GoogleFonts.mulish(
                                          color: Colors.white),
                                    ),
                                  ),
                                  deliveryType
                                      ? Text("RUSH",
                                          style: GoogleFonts.mulish())
                                      : const Text(""),
                                ])
                          ],
                        ),
                      ),
                    ));
              }).toList(),
            ));
  }
}
