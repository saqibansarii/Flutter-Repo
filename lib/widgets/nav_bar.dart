import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';

    return AppBar(
      title: Row(
        children: [
          Icon(Icons.flutter_dash, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          const Text('FlutterAmplify', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      actions: [
        _NavItem(label: 'Home', route: '/', currentRoute: currentRoute),
        _NavItem(label: 'About', route: '/about', currentRoute: currentRoute),
        _NavItem(label: 'Contact', route: '/contact', currentRoute: currentRoute),
        const SizedBox(width: 16),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final String route;
  final String currentRoute;

  const _NavItem({
    required this.label,
    required this.route,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = currentRoute == route;
    return TextButton(
      onPressed: isActive ? null : () => Navigator.pushNamed(context, route),
      style: TextButton.styleFrom(
        foregroundColor: isActive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onSurface,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
