import 'package:flutter/material.dart';
import 'package:login_proj/model/customer_name.dart';

class CustomerDialog extends StatefulWidget {
  final Function(CustomerName) name;

  const CustomerDialog(this.name, {super.key});

  @override
  State<CustomerDialog> createState() => _CustomerDialogState();
}

class _CustomerDialogState extends State<CustomerDialog> {
  TextEditingController nameController = TextEditingController();

  Widget buildTextField(
    String hint,
    TextEditingController controller,
  ) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: TextField(
        decoration: InputDecoration(
          labelText: hint,
          fillColor: Colors.indigo,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black38,
            ),
          ),
        ),
        controller: controller,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 250,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Add Customer Name", style: TextStyle(color: Colors.indigo.shade300, fontSize: 20, fontWeight: FontWeight.bold,),),
          buildTextField('Name', nameController),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  final cusName = CustomerName(nameController.text);
                  widget.name(cusName);
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(22,16,22,16),
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
