import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_test_app/widgets/address/address_field.dart';
import 'package:intl/intl.dart';

class AddressItem extends ConsumerStatefulWidget {
  const AddressItem({super.key, required this.lists});
  final Map<String, dynamic> lists;

  @override
  ConsumerState<AddressItem> createState() => _AddressItemState();
}

class _AddressItemState extends ConsumerState<AddressItem> {
  String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: ListTile(
          leading: Text(
            "${widget.lists['ID']}",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          autofocus: false,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${widget.lists['AddressType']}",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                "${widget.lists['AddressLine1']}",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                "${widget.lists['AddressPostCode']}",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    useSafeArea: true,
                    isScrollControlled: true,
                    builder: (ctx) => SizedBox(
                      height: double.infinity,
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                "Address Enquiry",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.fontSize ??
                                        0.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AddressField(
                                value: "${widget.lists['ID']}",
                                label: "ID",
                              ),
                              const SizedBox(height: 20),
                              AddressField(
                                value: "${widget.lists['AddressType']}",
                                label: "AddressType",
                              ),
                              const SizedBox(height: 20),
                              AddressField(
                                value: "${widget.lists['AddressPostCode']}",
                                label: "AddressPostCode",
                              ),
                              const SizedBox(height: 20),
                              AddressField(
                                value: "${widget.lists['AddressState']}",
                                label: "AddressState",
                              ),
                              const SizedBox(height: 20),
                              AddressField(
                                value: "${widget.lists['AddressCountry']}",
                                label: "AddressCountry",
                              ),
                              const SizedBox(height: 20),
                              AddressField(
                                value: widget.lists['AddressEndDate'] == ""
                                    ? ""
                                    : formatDate(
                                        "${widget.lists['AddressStartDate']}"),
                                label: "AddressStartDate",
                              ),
                              const SizedBox(height: 20),
                              AddressField(
                                value: widget.lists['AddressEndDate'] == ""
                                    ? ""
                                    : formatDate(
                                        "${widget.lists['AddressEndDate']}"),
                                label: "AddressEndDate",
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Close"))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.info),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
