import 'package:flutter/material.dart';
import 'package:go_test_app/services/addressService/address_service.dart';
import 'package:go_test_app/widgets/address/address_item.dart';
import 'package:go_test_app/widgets/address/address_modal.dart';
import 'package:go_test_app/widgets/custom_app_bar.dart';

class Address extends StatefulWidget {
  Address({
    super.key,
    required this.addressResponse,
    required this.companyId,
    required this.authToken,
  });

  List<dynamic> addressResponse;
  final String? authToken;
  final int? companyId;

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  deleteAddress(index) async {
    AddressService.softDeleteAddress(
      widget.authToken,
      widget.addressResponse[index]['ID'],
    );
    var getData = await AddressService.getAllAddress(widget.authToken);
    setState(() {
      widget.addressResponse = getData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            useSafeArea: true,
            isScrollControlled: true,
            builder: (ctx) => AddressModal(
                authToken: widget.authToken, companyId: widget.companyId),
          );
        },
        child: const Icon(Icons.add, size: 40),
      ),
      body: Column(
        children: [
          Text(
            "Address Enquiry",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.addressResponse.length,
              itemBuilder: (context, index) => Dismissible(
                key: ValueKey(widget.addressResponse[index]['ID']),
                background: Container(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.75),
                  // margin: EdgeInsets.symmetric(
                  //     horizontal:
                  //         Theme.of(context).cardTheme.margin!.horizontal),
                ),
                onDismissed: (direction) {
                  deleteAddress(index);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("Address Deleted"),
                      duration: const Duration(seconds: 3),
                      action: SnackBarAction(
                        label: "Undo",
                        onPressed: () {
                          // setState(() {
                          //   _registeredExpenses.insert(expenseIndex, expense);
                          // });
                        },
                      ),
                    ),
                  );
                },
                child: AddressItem(lists: widget.addressResponse[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
//AddressItem(lists: widget.addressResponse[index]),