import 'package:flutter/material.dart';
import 'package:go_test_app/services/policyServices/policy_services.dart';
import 'package:go_test_app/widgets/custom_app_bar.dart';
import 'package:go_test_app/widgets/policy/policy_item.dart';

class Policy extends StatefulWidget {
  Policy(
      {super.key,
      required this.policyResponse,
      required this.fieldMap,
      required this.searchString,
      required this.searchCriteria,
      required this.authToken});

  dynamic policyResponse;
  final List<dynamic> fieldMap;
  final String? authToken;
  String searchCriteria;
  String searchString;

  @override
  State<Policy> createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Policy Enquiry",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: DropdownButton<String>(
                        value: widget.searchCriteria,
                        elevation: 5,
                        items: widget.fieldMap
                            .map(
                              (values) => DropdownMenuItem(
                                value: "${values['fieldName']}",
                                child: Text(
                                  "${values['displayName']}",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (selectedValue) {
                          setState(
                            () {
                              widget.searchCriteria = selectedValue!;
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: TextFormField(
                        onChanged: (value) {
                          widget.searchString = value;
                        },
                        decoration: InputDecoration(
                            labelText: "Search String",
                            border: const OutlineInputBorder(),
                            suffix: IconButton(
                                onPressed: () async {
                                  var response = await PolicyServices.getPolicy(
                                      widget.authToken,
                                      widget.searchString,
                                      widget.searchCriteria);
                                  setState(() {
                                    widget.policyResponse =
                                        response['All Policies'];
                                  });
                                },
                                icon: const Icon(Icons.search))),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.policyResponse.length,
                  itemBuilder: (ctx, index) => PolicyItem(
                    lists: widget.policyResponse[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
