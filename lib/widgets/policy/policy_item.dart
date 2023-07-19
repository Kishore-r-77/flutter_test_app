import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_test_app/widgets/policy/policy_field.dart';
import 'package:go_test_app/widgets/policy/policy_tappable_content.dart';
import 'package:intl/intl.dart';

class PolicyItem extends ConsumerStatefulWidget {
  const PolicyItem({super.key, required this.lists});
  final Map<String, dynamic> lists;

  @override
  ConsumerState<PolicyItem> createState() => _PolicyItemState();
}

class _PolicyItemState extends ConsumerState<PolicyItem> {
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
                formatDate(widget.lists['PRCD']),
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                "${widget.lists['PFreq']}",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                "${widget.lists['PContractCurr']}",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    // print(PolicyServices.getBenefitsByPolicy(
                    //     authToken, lists['ID']));
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
                                  "Policy Enquiry",
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
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    PolicyField(
                                      value: "${widget.lists['ID']}",
                                      label: "ID",
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    PolicyField(
                                      value: formatDate(widget.lists['PRCD']),
                                      label: "PRCD",
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    PolicyField(
                                      value: "${widget.lists['PProduct']}",
                                      label: "PProduct",
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    PolicyField(
                                      value: "${widget.lists['PFreq']}",
                                      label: "PFreq",
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    PolicyField(
                                      value: "${widget.lists['PContractCurr']}",
                                      label: "PContractCurr",
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    PolicyField(
                                      value: "${widget.lists['POffice']}",
                                      label: "POffice",
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    PolicyField(
                                      value: "${widget.lists['PolStatus']}",
                                      label: "PolStatus",
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    PolicyField(
                                      value: formatDate(
                                          widget.lists['PReceivedDate']),
                                      label: "PReceivedDate",
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    PolicyField(
                                      value: formatDate(widget.lists['BTDate']),
                                      label: "BTDate",
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                PolicyTappableContent(
                                  policyId: widget.lists['ID'],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
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
                  icon: const Icon(Icons.info)),
            ],
          ),
        ),
      ),
    );
  }
}
