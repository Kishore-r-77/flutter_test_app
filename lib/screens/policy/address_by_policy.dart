import 'package:flutter/material.dart';
import 'package:go_test_app/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';

class AddresssByPolicy extends StatelessWidget {
  const AddresssByPolicy({super.key, required this.addressByPolicy});
  final dynamic addressByPolicy;

  @override
  Widget build(BuildContext context) {
    String formatDate(String dateString) {
      DateTime date = DateTime.parse(dateString);
      DateFormat formatter = DateFormat('dd-MM-yyyy');
      return formatter.format(date);
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView.builder(
        itemCount: addressByPolicy.length,
        itemBuilder: (context, index) => ExpansionTile(
          title: Text(
            "Address",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: TextFormField(
                        readOnly: true,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        initialValue: "${addressByPolicy[index]['Address ID']}",
                        decoration: const InputDecoration(
                          label: Text("Address ID"),
                          border: OutlineInputBorder(),
                        ),
                      )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          child: TextFormField(
                        readOnly: true,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        initialValue:
                            "${addressByPolicy[index]['AddressLine1']}",
                        decoration: const InputDecoration(
                          label: Text("AddressLine1"),
                          border: OutlineInputBorder(),
                        ),
                      )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          child: TextFormField(
                        readOnly: true,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        initialValue: "${addressByPolicy[index]['Country']}",
                        decoration: const InputDecoration(
                          label: Text("Country"),
                          border: OutlineInputBorder(),
                        ),
                      )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: TextFormField(
                        readOnly: true,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        initialValue: "${addressByPolicy[index]['PostalCode']}",
                        decoration: const InputDecoration(
                          label: Text("PostalCode"),
                          border: OutlineInputBorder(),
                        ),
                      )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          child: TextFormField(
                        readOnly: true,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        initialValue:
                            "${addressByPolicy[index]['AddressType']}",
                        decoration: const InputDecoration(
                          label: Text("AddressType"),
                          border: OutlineInputBorder(),
                        ),
                      )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          child: TextFormField(
                        readOnly: true,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        initialValue:
                            formatDate(addressByPolicy[index]['StartDate']),
                        decoration: const InputDecoration(
                          label: Text("StartDate"),
                          border: OutlineInputBorder(),
                        ),
                      )),
                    ],
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
