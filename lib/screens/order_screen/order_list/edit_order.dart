import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:dennis_lechon_crm/models/order.dart';
// import 'package:dennis_lechon_crm/widgets/search.dart';

class EditOrder extends StatefulWidget {
  //final Order order;

  const EditOrder({Key? key}) : super(key: key);

  @override
  State<EditOrder> createState() => _EditOrderState();
}

class _EditOrderState extends State<EditOrder> {
  var smallLechonItemCount = 0;
  var mediumLechonItemCount = 0;
  var largeLechonItemCount = 0;
  var extraLargeLechonItemCount = 0;
  var itemCount = 0;

  //Pricing
  var smallLechonPrice = 0;
  var mediumLechonPrice = 0;
  var largeLechonPrice = 0;
  var extraLargeLechonPrice = 0;

  //Fees
  var deliveryFee = 0; // kindly put UI for this;
  var subTotal = 0;
  var totalFee = 0;

  bool _isChecked = true;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _celNumController = TextEditingController();

  String dropdownvalue = 'ACTIVE';
  var items = [
    'ACTIVE',
    'INACTIVE',
  ];

  //Mu error pa ni siya kay ni lapas daw ang Pixels po
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 235, 235),
        //Kuwangan nig back button
        appBar: AppBar(
          title: const Text("Edit Order"),
          backgroundColor: const Color(0xFFD3231E),
          centerTitle: true,
        ),
        // This is the yellow part na container
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(children: [
                //Green Part..This was suppost to be the customer details part. Basta katung upper part na UI sa figma
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 120.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: "Order ",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F2426),
                          ),
                          children: [
                            TextSpan(
                              //Order Number here
                              text: "# Order",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic,
                                color: Color(0xFF1F2426),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xFF2A87BB)),
                            child: const Text(
                              "SET DATE",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 14),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Checkbox(
                            value: _isChecked,
                            activeColor: const Color(0xFFF1A22C),
                            onChanged: (val) {
                              setState(() {
                                _isChecked = val!;
                                if (val == true) {
                                  //
                                }
                              });
                            },
                          ),
                          const Text(
                            "RUSH?",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF1F2426),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Flexible(
                        child: Container(
                            width: 110,
                            height: 50,
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            color: const Color.fromARGB(255, 243, 243, 243),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField(
                                value: dropdownvalue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                                style: const TextStyle(
                                    fontSize: 15, fontFamily: 'Montserrat'),
                              ),
                            )
                            // child: const Text(
                            //   "Set status       ",
                            //   style: TextStyle(
                            //       fontFamily: 'Montserrat',
                            //       color: Color(0xFF1F2426),
                            //       fontSize: 14),
                            // ),
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name:',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        controller: _firstNameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            // labelText: 'Name',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 1.0, horizontal: 5)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Address:',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        controller: _cityController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            // labelText: 'Name',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 1.0, horizontal: 5)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Contact Number:',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        controller: _celNumController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            // labelText: 'Name',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 1.0, horizontal: 5)),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                //Order Details Part
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flex(direction: Axis.horizontal, children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Order Details',
                              style: GoogleFonts.montserrat(
                                  fontSize: 21.0,
                                  color: const Color(0xFF1F2426),
                                  fontWeight: FontWeight.w500),
                            ),
                            Card(
                              color: const Color.fromARGB(255, 243, 243, 243),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 3,
                              margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: FittedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    //
                                    // This is the start of the elements sa Card UI
                                    //
                                    children: <Widget>[
                                      SizedBox(
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Whole Lechon",
                                                          style: GoogleFonts
                                                              .mulish(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                71,
                                                                71,
                                                                71),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 16.0,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "(Small)",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xFFD3231E),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0)),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              border: Border.all(
                                                                  color: const Color(
                                                                      0xFFD3231E)),
                                                            ),
                                                            child:
                                                                ElevatedButton(
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      minimumSize:
                                                                          const Size(
                                                                              40,
                                                                              40),
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0)),
                                                                      primary: const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          243,
                                                                          243,
                                                                          243),
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      "-",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Color(0xFFD3231E)),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        smallLechonItemCount !=
                                                                                0
                                                                            ? smallLechonItemCount--
                                                                            : 0;
                                                                        smallLechonPrice !=
                                                                                0
                                                                            ? smallLechonPrice -=
                                                                                5000
                                                                            : 0;
                                                                        itemCount !=
                                                                                0
                                                                            ? itemCount -=
                                                                                1
                                                                            : 0;
                                                                        subTotal !=
                                                                                0
                                                                            ? subTotal -=
                                                                                5000
                                                                            : 0;
                                                                        totalFee !=
                                                                                0
                                                                            ? totalFee -=
                                                                                5000
                                                                            : 0;
                                                                      });
                                                                    }),
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          Text(
                                                            smallLechonItemCount
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          // ignore: avoid_print
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              border: Border.all(
                                                                  color: const Color(
                                                                      0xFFD3231E)),
                                                            ),
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                minimumSize:
                                                                    const Size(
                                                                        40, 40),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                primary: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    243,
                                                                    243,
                                                                    243),
                                                              ),
                                                              child: const Text(
                                                                "+",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFFD3231E),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              onPressed: () {
                                                                setState(() {
                                                                  smallLechonItemCount++;
                                                                  smallLechonPrice +=
                                                                      5000;
                                                                  subTotal +=
                                                                      5000;
                                                                  totalFee +=
                                                                      5000;
                                                                  itemCount++;
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  smallLechonPrice.toString(),
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 15,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Whole Lechon",
                                                          style: GoogleFonts
                                                              .mulish(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                71,
                                                                71,
                                                                71),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 16.0,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "(Medium)",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xFFD3231E),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0)),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              border: Border.all(
                                                                  color: const Color(
                                                                      0xFFD3231E)),
                                                            ),
                                                            child:
                                                                ElevatedButton(
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      minimumSize:
                                                                          const Size(
                                                                              40,
                                                                              40),
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0)),
                                                                      primary: const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          243,
                                                                          243,
                                                                          243),
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      "-",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Color(0xFFD3231E)),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        mediumLechonItemCount !=
                                                                                0
                                                                            ? mediumLechonItemCount--
                                                                            : 0;
                                                                        mediumLechonPrice !=
                                                                                0
                                                                            ? mediumLechonPrice -=
                                                                                6000
                                                                            : 0;
                                                                        itemCount !=
                                                                                0
                                                                            ? itemCount -=
                                                                                1
                                                                            : 0;
                                                                        subTotal !=
                                                                                0
                                                                            ? subTotal -=
                                                                                6000
                                                                            : 0;
                                                                        totalFee !=
                                                                                0
                                                                            ? totalFee -=
                                                                                6000
                                                                            : 0;
                                                                      });
                                                                    }),
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          Text(
                                                            mediumLechonItemCount
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          // ignore: avoid_print
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              border: Border.all(
                                                                  color: const Color(
                                                                      0xFFD3231E)),
                                                            ),
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                minimumSize:
                                                                    const Size(
                                                                        40, 40),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                primary: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    243,
                                                                    243,
                                                                    243),
                                                              ),
                                                              child: const Text(
                                                                "+",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFFD3231E),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              onPressed: () {
                                                                setState(() {
                                                                  mediumLechonItemCount++;
                                                                  mediumLechonPrice +=
                                                                      6000;
                                                                  subTotal +=
                                                                      6000;
                                                                  totalFee +=
                                                                      6000;
                                                                  itemCount++;
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  mediumLechonPrice.toString(),
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 15,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Whole Lechon",
                                                          style: GoogleFonts
                                                              .mulish(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                71,
                                                                71,
                                                                71),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 16.0,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "(Large)",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xFFD3231E),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0)),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              border: Border.all(
                                                                  color: const Color(
                                                                      0xFFD3231E)),
                                                            ),
                                                            child:
                                                                ElevatedButton(
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      minimumSize:
                                                                          const Size(
                                                                              40,
                                                                              40),
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0)),
                                                                      primary: const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          243,
                                                                          243,
                                                                          243),
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      "-",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Color(0xFFD3231E)),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        largeLechonItemCount !=
                                                                                0
                                                                            ? largeLechonItemCount--
                                                                            : 0;
                                                                        largeLechonPrice !=
                                                                                0
                                                                            ? largeLechonPrice -=
                                                                                7000
                                                                            : 0;
                                                                        itemCount !=
                                                                                0
                                                                            ? itemCount -=
                                                                                1
                                                                            : 0;
                                                                        subTotal !=
                                                                                0
                                                                            ? subTotal -=
                                                                                7000
                                                                            : 0;
                                                                        totalFee !=
                                                                                0
                                                                            ? totalFee -=
                                                                                7000
                                                                            : 0;
                                                                      });
                                                                    }),
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          Text(
                                                            largeLechonItemCount
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          // ignore: avoid_print
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              border: Border.all(
                                                                  color: const Color(
                                                                      0xFFD3231E)),
                                                            ),
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                minimumSize:
                                                                    const Size(
                                                                        40, 40),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                primary: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    243,
                                                                    243,
                                                                    243),
                                                              ),
                                                              child: const Text(
                                                                "+",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFFD3231E),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              onPressed: () {
                                                                setState(() {
                                                                  largeLechonItemCount++;
                                                                  largeLechonPrice +=
                                                                      7000;
                                                                  subTotal +=
                                                                      7000;
                                                                  totalFee +=
                                                                      7000;
                                                                  itemCount++;
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  largeLechonPrice.toString(),
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 15,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Whole Lechon",
                                                          style: GoogleFonts
                                                              .mulish(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                71,
                                                                71,
                                                                71),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 16.0,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "(Extra Large)",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xFFD3231E),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0)),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              border: Border.all(
                                                                  color: const Color(
                                                                      0xFFD3231E)),
                                                            ),
                                                            child:
                                                                ElevatedButton(
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      minimumSize:
                                                                          const Size(
                                                                              40,
                                                                              40),
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0)),
                                                                      primary: const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          243,
                                                                          243,
                                                                          243),
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      "-",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Color(0xFFD3231E)),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        extraLargeLechonItemCount !=
                                                                                0
                                                                            ? extraLargeLechonItemCount--
                                                                            : 0;
                                                                        extraLargeLechonPrice !=
                                                                                0
                                                                            ? extraLargeLechonPrice -=
                                                                                8000
                                                                            : 0;
                                                                        itemCount !=
                                                                                0
                                                                            ? itemCount -=
                                                                                1
                                                                            : 0;
                                                                        subTotal !=
                                                                                0
                                                                            ? subTotal -=
                                                                                8000
                                                                            : 0;
                                                                        totalFee !=
                                                                                0
                                                                            ? totalFee -=
                                                                                8000
                                                                            : 0;
                                                                      });
                                                                    }),
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          Text(
                                                            extraLargeLechonItemCount
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          // ignore: avoid_print
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              border: Border.all(
                                                                  color: const Color(
                                                                      0xFFD3231E)),
                                                            ),
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                minimumSize:
                                                                    const Size(
                                                                        40, 40),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0)),
                                                                primary: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    243,
                                                                    243,
                                                                    243),
                                                              ),
                                                              child: const Text(
                                                                "+",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFFD3231E),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              onPressed: () {
                                                                setState(() {
                                                                  extraLargeLechonItemCount++;
                                                                  extraLargeLechonPrice +=
                                                                      8000;
                                                                  subTotal +=
                                                                      8000;
                                                                  totalFee +=
                                                                      8000;
                                                                  itemCount++;
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  extraLargeLechonPrice
                                                      .toString(),
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 15,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: const [
                                              Text(
                                                "Subtotal",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              SizedBox(width: 25),
                                              Text(
                                                //without backend yet
                                                "Php 10,000",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                "Delivery fee",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Text(
                                                "Php",
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              SizedBox(
                                                width: 65,
                                                height: 20,
                                                child: TextField(
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            14, 0, 0, 0),
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                              //SizedBox(width: 25),
                                              // const Text(
                                              //   //without backend yet
                                              //   "Php 500",
                                              //   style: TextStyle(
                                              //     fontFamily: 'Montserrat',
                                              //     fontSize: 14,
                                              //     color: Colors.grey,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              const SizedBox(width: 25),
                                              Container(
                                                width: 250,
                                                height: 2,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 243, 243, 243),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 20),
                                          Container(
                                            width: 300,
                                            height: 2,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 221, 220, 220),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      255, 207, 206, 206),
                                                  offset: Offset(0.0, 2.0),
                                                  blurRadius: 2,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 3.5),
                                        ],
                                      ),
                                      const SizedBox(height: 22),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 30),
                                          Text(
                                            'Total',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 18.0,
                                                color: const Color.fromARGB(
                                                    255, 29, 29, 29),
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(width: 3),
                                          Text(
                                            itemCount > 1
                                                ? '  ($itemCount items)  '
                                                : '  ($itemCount item)  ',
                                            style: GoogleFonts.montserrat(
                                              color: const Color.fromARGB(
                                                  255, 80, 79, 79),
                                              letterSpacing: 1.0,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(width: 25),
                                          Text(
                                            'Php',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 18.0,
                                                color: const Color.fromARGB(
                                                    255, 80, 79, 79),
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            '  $totalFee',
                                            style: GoogleFonts.montserrat(
                                              color: const Color.fromARGB(
                                                  255, 80, 79, 79),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              child: const Text(' Create Order ',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                  )),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                primary: const Color(0xFFF1A22C),
                                onPrimary: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 34, vertical: 20),
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ]),
                  ],
                )
              ]),
            )));
  }
}
