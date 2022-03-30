import 'package:dennis_lechon_crm/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:dennis_lechon_crm/services/firebase_database_services.dart';
import 'package:provider/provider.dart';
import 'package:dennis_lechon_crm/models/customer.dart';
import 'package:dennis_lechon_crm/screens/customer_screen/customer_list/customer_list.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return StreamProvider<List<Customer>>.value(
      value: CustomerService().customers,
      initialData: const [],
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFF1A22C),
            title: const Text("Customer List"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelagate(),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          floatingActionButton: floatingAddCustomerButton(context, _formKey),
          body: StreamBuilder<List<Customer>>(
            stream: CustomerService().customers,
            builder: (context, snapshot) {
              if (!snapshot.hasError) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Text("Offline. Try again later.");
                  case ConnectionState.waiting:
                    return const Loading();
                  default:
                    return Container(
                        margin: const EdgeInsets.only(bottom: 45.0),
                        child: const CustomerListWidget());
                }
              } else {
                return const Text(
                    "Something went wrong. Please contact admin.");
              }
            },
          )),
    );
  }
}

Widget imageProfile() {
  return Center(
    child: Stack(children: <Widget>[
      const CircleAvatar(
        radius: 40.0,
        backgroundImage: AssetImage('assets/images/user.png'),
      ),
      Positioned(
          bottom: 20.0,
          right: 20.0,
          child: Icon(
            Icons.camera_alt,
            color: Colors.white.withOpacity(0.5),
            size: 33.0,
          )),
    ]),
  );
}

//link sa "inspiration" na video [https://www.youtube.com/watch?v=KF1KMfQOpjM&list=LL&index=1] hehe
//diri lang mo watch para mas makasabot sa code huhu
class CustomSearchDelagate extends SearchDelegate {
  List<String> searchTerms = [
    //pre defined list para basehan sa search
    'Apple', // so sa ato na case kay ang list ni sa mga names huhu
    'Banana', // sorry i duuno how to backend
    'Pear',
    'Watermelons',
    'Oranges',
    'Blueberries',
    'Strawberries',
    'Raspberries',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    //para ra ni tig clear  sa search bar if pisliton ang 'x'
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //tig balik sa customer list na page (back)
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    //if naa siyay makita na match kay e sud niya diri na string
    for (var fruit in searchTerms) {
      //loop para sa searching
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        //tig display sa mga ni match
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override //same ra ni sa babaw, pero sa suggestion ni siya para char
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}

ValueNotifier _isLoadingNotifier = ValueNotifier(false);

@override
Widget floatingAddCustomerButton(
    BuildContext context, GlobalKey<FormState> _formKey) {
  final TextEditingController _firstNameCtr = TextEditingController();
  final TextEditingController _lastNameCtr = TextEditingController();
  final TextEditingController _middleNameCtr = TextEditingController();
  final TextEditingController _celNumCtr = TextEditingController();
  final TextEditingController _telNumCtr = TextEditingController();
  final TextEditingController _cityCtr = TextEditingController();
  final TextEditingController _barangayCtr = TextEditingController();
  final TextEditingController _zipcodeCtr = TextEditingController();
  final TextEditingController _noteCtr = TextEditingController();

  return FloatingActionButton(
    onPressed: () async {
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
                        Container(
                          width: double.infinity,
                          height: 45,
                          alignment: Alignment.topCenter,
                          decoration: const BoxDecoration(
                            color: Color(0xFFD3231E),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            // ignore: unnecessary_const
                            child: const Text(
                              "Add Customer",
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
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
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 55, 15, 6),
                                child: TextFormField(
                                  controller: _firstNameCtr,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    labelText: 'First Name',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field cannot be blank.";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 15, 6),
                                child: TextFormField(
                                    controller: _middleNameCtr,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      labelText: 'Middle Initial',
                                    )),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 15, 6),
                                child: TextFormField(
                                  controller: _lastNameCtr,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    labelText: 'Last Name',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field cannot be blank.";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 6, 15, 6),
                                child: TextField(
                                    controller: _celNumCtr,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      labelText: 'Cellphone No.',
                                    )),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 6, 15, 6),
                                child: TextField(
                                    controller: _barangayCtr,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      labelText: 'Address',
                                    )),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 6, 15, 6),
                                child: TextFormField(
                                  controller: _noteCtr,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Notes',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field cannot be blank.";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                child: ValueListenableBuilder(
                                    valueListenable: _isLoadingNotifier,
                                    builder: (context, _isLoading, _) {
                                      return ElevatedButton(
                                        child: const Text("CREATE"),
                                        onPressed: (_isLoading == true)
                                            ? null
                                            : () async {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  _isLoadingNotifier.value =
                                                      true;
                                                  await CustomerService()
                                                      .addCustomer(
                                                          _firstNameCtr.text,
                                                          _middleNameCtr.text,
                                                          _lastNameCtr.text,
                                                          _zipcodeCtr.text,
                                                          _barangayCtr.text,
                                                          _cityCtr.text,
                                                          _celNumCtr.text,
                                                          _telNumCtr.text,
                                                          _noteCtr.text,
                                                          "Hot",
                                                          1,
                                                          const Color(
                                                                  0xFFD3231E)
                                                              .toString());
                                                  _isLoadingNotifier.value =
                                                      false;
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .pop();
                                                }
                                              },
                                        style: ElevatedButton.styleFrom(
                                          primary: const Color(0xFFD3231E),
                                          onPrimary: Colors.white,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          minimumSize: const Size(75, 40),
                                        ),
                                      );
                                    }),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Positioned(
                                bottom: 50.0,
                                right: 0.0,
                                child: Container(
                                  width: double.infinity,
                                  height: 20,
                                  alignment: Alignment.bottomCenter,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFD3231E),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25),
                                    ),
                                  ),
                                ),
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
    child: const Icon(
      Icons.add,
      size: 26.0,
    ),
    backgroundColor: const Color(0xFFF1A22C),
  );
}
