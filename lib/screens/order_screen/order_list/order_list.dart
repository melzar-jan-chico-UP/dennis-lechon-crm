import 'package:dennis_lechon_crm/models/order.dart';
import 'package:dennis_lechon_crm/screens/order_screen/order_info/order_info.dart';
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
