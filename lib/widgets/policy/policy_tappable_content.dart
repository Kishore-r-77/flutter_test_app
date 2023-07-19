import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_test_app/providers/auth_provider.dart';
import 'package:go_test_app/screens/policy/address_by_policy.dart';
import 'package:go_test_app/screens/policy/benefits_by_policy.dart';
import 'package:go_test_app/screens/policy/clients_by_policy.dart';
import 'package:go_test_app/services/policyServices/policy_services.dart';

class PolicyTappableContent extends ConsumerWidget {
  const PolicyTappableContent({super.key, required this.policyId});
  final int policyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authToken = ref.watch(authProvider.notifier).authToken;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () async {
            dynamic benefitsByPolicy =
                await PolicyServices.getBenefitsByPolicy(authToken, policyId);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        BenefitsByPolicy(benefitsByPolicy: benefitsByPolicy)));
          },
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  Colors.greenAccent.withOpacity(0.5),
                  Colors.greenAccent.withOpacity(0.9),
                ],
              ),
            ),
            child: const Text(
              "Benefit",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            dynamic clientsByPolicy =
                await PolicyServices.getClientsByPolicy(authToken, policyId);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ClientsByPolicy(clientsByPolicy: clientsByPolicy)));
          },
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  Colors.blueAccent.withOpacity(0.5),
                  Colors.blueAccent.withOpacity(0.9),
                ],
              ),
            ),
            child: const Text(
              "Client",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            dynamic addressByPolicy =
                await PolicyServices.getAddresssByPolicy(authToken, policyId);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AddresssByPolicy(addressByPolicy: addressByPolicy)));
          },
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  Colors.redAccent.withOpacity(0.5),
                  Colors.redAccent.withOpacity(0.9),
                ],
              ),
            ),
            child: const Text(
              "Address",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
