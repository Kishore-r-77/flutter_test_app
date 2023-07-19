import 'package:flutter/material.dart';
import 'package:go_test_app/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';

class ClientsByPolicy extends StatelessWidget {
  ClientsByPolicy({super.key, required this.clientsByPolicy});
  final dynamic clientsByPolicy;
  final ExpansionTileController controller = ExpansionTileController();

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
        itemCount: clientsByPolicy.length,
        itemBuilder: (context, index) => ExpansionTile(
          title: Text(
            "Clients",
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
                        initialValue: "${clientsByPolicy[index]['Client ID']}",
                        decoration: const InputDecoration(
                          label: Text("Client ID"),
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
                        initialValue: formatDate(clientsByPolicy[index]['DOB']),
                        decoration: const InputDecoration(
                          label: Text("DOB"),
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
                        initialValue: "${clientsByPolicy[index]['Email']}",
                        decoration: const InputDecoration(
                          label: Text("Email"),
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
                        initialValue: "${clientsByPolicy[index]['LastName']}",
                        decoration: const InputDecoration(
                          label: Text("LastName"),
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
                        initialValue: "${clientsByPolicy[index]['Mobile']}",
                        decoration: const InputDecoration(
                          label: Text("Mobile"),
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
                        initialValue: "${clientsByPolicy[index]['ShortName']}",
                        decoration: const InputDecoration(
                          label: Text("ShortName"),
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
