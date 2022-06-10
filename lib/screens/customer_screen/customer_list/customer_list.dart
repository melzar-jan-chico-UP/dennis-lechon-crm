import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dennis_lechon_crm/models/customer.dart';
//import 'package:dennis_lechon_crm/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:dennis_lechon_crm/screens/customer_screen/customer_info/customer_info.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerListWidget extends StatefulWidget {
  const CustomerListWidget({Key? key, required this.firestore})
      : super(key: key);
  final FirebaseFirestore firestore;
  @override
  State<CustomerListWidget> createState() => _CustomerListWidgetState();
}

class _CustomerListWidgetState extends State<CustomerListWidget> {
  @override
  Widget build(BuildContext context) {
    List<IconData> hello = [
      Icons.local_fire_department,
      Icons.air_outlined,
      Icons.ac_unit_outlined
    ];
    final customers = Provider.of<List<Customer>>(context);

    return (customers.isEmpty)
        ? const Directionality(
            key: Key("Spinning"),
            textDirection: TextDirection.ltr,
            child: Center(
              child: SpinKitFadingCircle(
                color: Colors.black45,
                size: 50.0,
              ),
            ))
        : Directionality(
            textDirection: TextDirection.ltr,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              children: customers.map((customer) {
                String lastName = customer.lastName;
                String firstName = customer.firstName;
                String tagName = customer.tagName;
                String address = (customer.adrStreet.isNotEmpty
                        ? '${customer.adrStreet} '
                        : '') +
                    (customer.adrBarangay.isNotEmpty
                        ? '${customer.adrBarangay} '
                        : '') +
                    (customer.adrCity.isNotEmpty
                        ? '${customer.adrCity} '
                        : '') +
                    (customer.adrProvince.isNotEmpty
                        ? '${customer.adrProvince} '
                        : '') +
                    (customer.adrZipcode.isNotEmpty
                        ? '${customer.adrZipcode} '
                        : '');
                Color tagColor = customer.tagColor;
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomerInfo(
                                  customer: customer,
                                  firestore: widget.firestore)));
                    },
                    child: Container(
                      key: const Key("Press here"),
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
                                              '$firstName $lastName',
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.mulish(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            (address != '')
                                                ? Text(
                                                    address,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.mulish(
                                                      fontSize: 15,
                                                      color: Colors.grey,
                                                    ),
                                                  )
                                                : Text(
                                                    "[Not Available]",
                                                    style: GoogleFonts.mulish(
                                                      //fontStyle: FontStyle.,
                                                      fontSize: 15,
                                                      color:
                                                          Colors.red.shade200,
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
                                  Expanded(
                                      child: Container(
                                          width: 100,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 15),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: tagColor),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 2.0),
                                                  child: Icon(
                                                    hello[
                                                        customer.tagIndex - 1],
                                                    color: Colors.white,
                                                    size: 15.0,
                                                  ),
                                                ),
                                                Text(
                                                  tagName,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.mulish(
                                                      color: Colors.white),
                                                ),
                                              ]))),
                                  // To avoid the hotdog
                                  const SizedBox(
                                    height: 20,
                                    width: 90,
                                  ),
                                  Text(
                                    'Incoming Order',
                                    style: GoogleFonts.mulish(),
                                  )
                                ])
                          ],
                        ),
                      ),
                    ));
              }).toList(),
            ));
  }
}

/*
customers.map((customer) {
                    String lastName = customer.lastName;
                    String firstName = customer.firstName;
                    String tagName = customer.tagName;
                    String address = (customer.adrStreet.isNotEmpty
                            ? '${customer.adrStreet} '
                            : '') +
                        (customer.adrBarangay.isNotEmpty
                            ? '${customer.adrBarangay} '
                            : '') +
                        (customer.adrCity.isNotEmpty
                            ? '${customer.adrCity} '
                            : '') +
                        (customer.adrProvince.isNotEmpty
                            ? '${customer.adrProvince} '
                            : '') +
                        (customer.adrZipcode.isNotEmpty
                            ? '${customer.adrZipcode} '
                            : '');
                    Color tagColor = customer.tagColor;
                    */