import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_test_app/screens/address/address.dart';
import 'package:go_test_app/services/addressService/address_service.dart';
import 'package:go_test_app/widgets/custom_app_bar.dart';
import 'package:go_test_app/widgets/main_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedPreferences =
        ModalRoute.of(context)!.settings.arguments as SharedPreferences;

    final authToken = sharedPreferences.getString('authToken');
    final companyId = sharedPreferences.getInt('companyId');
    //final companyId = ref.watch(authProvider.notifier).companyId;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        drawer: MainDrawer(sharedPreferences: sharedPreferences),
        appBar: const CustomAppBar(),
        body: Container(
          decoration: const BoxDecoration(),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  "Home Page",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                Expanded(
                  child: GridView(
                    padding: const EdgeInsets.all(24),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    children: [
                      InkWell(
                        onTap: () async {
                          var addressResponse =
                              await AddressService.getAllAddress(authToken);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Address(
                                  authToken: authToken,
                                  companyId: companyId,
                                  addressResponse:
                                      addressResponse['All Addresses']),
                            ),
                          );
                        },
                        splashColor: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.green.withOpacity(0.55),
                                  Colors.green.withOpacity(0.9),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )),
                          child: Text(
                            "Address",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        splashColor: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.pink.withOpacity(0.55),
                                  Colors.pink.withOpacity(0.9),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )),
                          child: Text(
                            "Policy",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        splashColor: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.brown.withOpacity(0.55),
                                  Colors.brown.withOpacity(0.9),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )),
                          child: Text(
                            "Lead Management",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        splashColor: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purple.withOpacity(0.55),
                                Colors.purple.withOpacity(0.9),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Text(
                            "Quotation",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
