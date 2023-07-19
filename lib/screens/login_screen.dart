import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_test_app/providers/auth_provider.dart';
import 'package:go_test_app/providers/dark_provider.dart';
import 'package:go_test_app/screens/home_page.dart';
import 'package:go_test_app/utils/authUtils/auth_utils.dart';
import 'package:go_test_app/utils/networkUtils/network_utils.dart';
import 'package:go_test_app/widgets/custom_app_bar.dart';
import 'package:go_test_app/widgets/loading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  SharedPreferences? _sharedPreferences;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoading = false;

  _checkLoggedInAndNavigate() async {
    _showLoading();
    _sharedPreferences = await _prefs;
    String? authToken = AuthUtils.getAuthToken(_sharedPreferences!);

    if (authToken != null) {
      try {
        var response = await NetworkUtils.validateUser(_sharedPreferences);

        if (response.statusCode == 200) {
          Navigator.of(_scaffoldKey.currentContext!).pushReplacementNamed(
            HomePage.routeName,
            arguments: _sharedPreferences,
          );

          //_hideLoading();
        } else {
          NetworkUtils.showSnackBar(
              _scaffoldMessengerKey, "authentication failed");

          _hideLoading();
        }
      } catch (exception) {
        NetworkUtils.showSnackBar(
            _scaffoldMessengerKey, "authentication failed");

        _hideLoading();
      }
    } else {
      _hideLoading();
    }
  }

  _showLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  _hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkLoggedInAndNavigate();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: const CustomAppBar(),
        body: _isLoading ? LoadingScreen() : _loginWidget(),
      ),
    );
  }

  Widget _loginWidget() {
    final isDark = ref.watch(darkProvider);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
      ),
      child: Form(
        child: Column(
          children: [
            Card(
              child: TextFormField(
                style: TextStyle(
                  color: isDark ? Colors.amber : Colors.black,
                ),
                decoration: const InputDecoration(
                  label: Text(
                    "Mobile Number",
                  ),
                  prefixIcon: Icon(Icons.phone_android),
                ),
                controller: _phoneController,
              ),
            ),
            Card(
              child: TextFormField(
                style: TextStyle(
                  color: isDark ? Colors.amber : Colors.black,
                ),
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text("Password"),
                  prefixIcon: Icon(Icons.lock),
                ),
                controller: _passwordController,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(5),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                ref.read(authProvider.notifier).signin(
                    _phoneController.text,
                    _passwordController.text,
                    context,
                    _sharedPreferences,
                    _scaffoldMessengerKey);
              },
              child: const Text("Sign in"),
            )
          ],
        ),
      ),
    );
  }
}
