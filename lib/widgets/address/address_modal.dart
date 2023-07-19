import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_test_app/services/addressService/address_service.dart';

class AddressModal extends ConsumerStatefulWidget {
  const AddressModal(
      {super.key, required this.authToken, required this.companyId});

  final String? authToken;
  final int? companyId;

  @override
  ConsumerState<AddressModal> createState() => _AddressModalState();
}

class _AddressModalState extends ConsumerState<AddressModal> {
  @override
  Widget build(BuildContext context) {
    String addressLine1 = "";
    String addressLine2 = "";
    String addressLine3 = "";
    String addressLine4 = "";
    String addressLine5 = "";
    String addressType = "";
    String addressPostCode = "";
    String addressState = "";
    String addressCountry = "";
    String addressStartDate = "";
    String addressEndDate = "";
    String clientId = "";

    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          initialValue: addressLine1,
                          onChanged: (value) {
                            addressLine1 = value;
                          },
                          decoration: const InputDecoration(
                              label: Text("AddressLine1"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          initialValue: addressLine2,
                          onChanged: (value) {
                            addressLine2 = value;
                          },
                          decoration: const InputDecoration(
                              label: Text("AddressLine2"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          initialValue: addressLine3,
                          onChanged: (value) {
                            addressLine3 = value;
                          },
                          decoration: const InputDecoration(
                              label: Text("AddressLine3"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          initialValue: addressLine4,
                          onChanged: (value) {
                            addressLine4 = value;
                          },
                          decoration: const InputDecoration(
                              label: Text("AddressLine4"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          initialValue: addressLine5,
                          onChanged: (value) {
                            addressLine5 = value;
                          },
                          decoration: const InputDecoration(
                              label: Text("AddressLine5"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          initialValue: addressType,
                          onChanged: (value) {
                            addressType = value;
                          },
                          decoration: const InputDecoration(
                              label: Text("AddressType"),
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    initialValue: addressPostCode,
                    onChanged: (value) {
                      addressPostCode = value;
                    },
                    decoration: const InputDecoration(
                        label: Text("AddressPostCode"),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    initialValue: addressState,
                    onChanged: (value) {
                      addressState = value;
                    },
                    decoration: const InputDecoration(
                        label: Text("AddressState"),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    initialValue: addressCountry,
                    onChanged: (value) {
                      addressCountry = value;
                    },
                    decoration: const InputDecoration(
                        label: Text("AddressCountry"),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    initialValue: addressStartDate,
                    onChanged: (value) {
                      addressStartDate = value;
                    },
                    decoration: const InputDecoration(
                        label: Text("AddressStartDate"),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    initialValue: addressEndDate,
                    onChanged: (value) {
                      addressEndDate = value;
                    },
                    decoration: const InputDecoration(
                        label: Text("AddressEndDate"),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    initialValue: clientId,
                    onChanged: (value) {
                      clientId = value;
                    },
                    decoration: const InputDecoration(
                        label: Text("Client Id"), border: OutlineInputBorder()),
                  ),
                ],
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Close"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final createResponse = AddressService.createAddress(
                          widget.authToken,
                          widget.companyId,
                          addressLine1,
                          addressLine2,
                          addressLine3,
                          addressLine4,
                          addressLine5,
                          addressType,
                          addressPostCode,
                          addressState,
                          addressCountry,
                          addressStartDate,
                          addressEndDate,
                          clientId);
                      print(createResponse);
                      setState(() {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text("Created:${createResponse['Created']}"),
                        //   ),
                        // );
                      });
                      Navigator.pop(context);
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
