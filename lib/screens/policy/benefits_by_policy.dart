import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_test_app/widgets/custom_app_bar.dart';

class BenefitsByPolicy extends StatelessWidget {
  BenefitsByPolicy({super.key, required this.benefitsByPolicy});
  final dynamic benefitsByPolicy;
  final ExpansionTileController controller = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView.builder(
        itemCount: benefitsByPolicy.length,
        itemBuilder: (context, index) => ExpansionTile(
          title: Text(
            "Benefits",
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
                        initialValue: "${benefitsByPolicy[index]['ID']}",
                        decoration: const InputDecoration(
                          label: Text("ID"),
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
                        initialValue: "${benefitsByPolicy[index]['BCoverage']}",
                        decoration: const InputDecoration(
                          label: Text("BCoverage"),
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
                            "${benefitsByPolicy[index]['BSumAssured']}",
                        decoration: const InputDecoration(
                          label: Text("BSumAssured"),
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
                        initialValue: "${benefitsByPolicy[index]['BTerm']}",
                        decoration: const InputDecoration(
                          label: Text("BTerm"),
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
                        initialValue: "${benefitsByPolicy[index]['BPTerm']}",
                        decoration: const InputDecoration(
                          label: Text("BPTerm"),
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
                        initialValue: "${benefitsByPolicy[index]['BStatus']}",
                        decoration: const InputDecoration(
                          label: Text("BStatus"),
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
