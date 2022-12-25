import 'package:flutter/material.dart';
import 'package:login_proj/screen/customer_list/customer_dialog.dart';
import 'package:login_proj/model/customer_name.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({super.key});

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  List<CustomerName> data = [];
  String text = '';

  @override
  void initState() {
    cusNameAdded();
    super.initState();
  }

  cusNameAdded() {
    data.add(CustomerName('Somsri'));
    data.add(CustomerName('Somchai'));
    data.add(CustomerName('Somsak'));
    setState(() {});
  }

  void addCustomerName(dynamic name) {
    setState(() {
      data.add(name);
    });
  }

  void showCustomerDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: CustomerDialog(addCustomerName),
        );
      },
    );
  }

  Widget editName({required int index}) {
    return Column(
      children: [
        Text(
          "Edit Name",
          style: TextStyle(
            color: Colors.indigo.shade300,
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          onChanged: (value) {
            text = value;
          },
        ),
        const SizedBox(
          height: 32,
        ),
        InkWell(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.indigo.shade300,
            ),
            child: const Center(
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          onTap: () {
            setState(() {
              data[index].name = text;
            });
            Navigator.pop(context);
          },
        ),
        const SizedBox(
          height: 8,
        ),
        InkWell(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red.shade300,
            ),
            child: const Center(
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget removeName({required int index}) {
    return InkWell(
      child: const Icon(Icons.delete),
      onTap: () {
        setState(() {
          data.removeAt(index);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade300,
        elevation: 0,
        title: const Text("Customer List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showCustomerDialog,
        backgroundColor: Colors.indigo.shade300,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (ctx, int index) {
                  return Column(
                    children: [
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade100,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data[index].name),
                              Row(
                                children: [
                                  InkWell(
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.indigo,
                                    ),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => SimpleDialog(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: editName(index: index),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  removeName(index: index),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
