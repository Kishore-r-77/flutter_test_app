import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_test_app/providers/dark_provider.dart';

class CustomAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  ConsumerState<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    var isDark = ref.watch(darkProvider);
    void toggleTheme(value) {
      ref.watch(darkProvider.notifier).toggleTheme(value);
    }

    return AppBar(
      centerTitle: false,
      actions: [
        Row(
          children: [
            const Text(
              "Dark Mode: ",
            ),
            Switch(
              value: isDark,
              onChanged: (value) {
                setState(() {
                  toggleTheme(value);
                });
              },
            ),
          ],
        ),
      ],
      title: Text(
        "Go Flutter UI",
        style: TextStyle(color: isDark ? Colors.amber : Colors.white),
      ),
    );
  }
}
