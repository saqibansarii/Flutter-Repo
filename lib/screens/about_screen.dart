import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const NavBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(48),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About', style: textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Divider(color: colorScheme.primary, thickness: 3, endIndent: 700),
                const SizedBox(height: 24),
                Text(
                  'This Flutter web application is configured for deployment on AWS Amplify. '
                  'It demonstrates best practices for building scalable, maintainable Flutter web apps '
                  'with responsive layouts, theming, and multi-page routing.',
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(height: 32),
                Text('Tech Stack', style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                ...[
                  ('Flutter 3.x', 'Cross-platform UI framework', Icons.flutter_dash),
                  ('AWS Amplify', 'CI/CD and hosting platform', Icons.cloud),
                  ('Dart 3.x', 'Modern, type-safe language', Icons.code),
                  ('Material 3', 'Latest Google design system', Icons.design_services),
                ].map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(item.$3, color: colorScheme.primary),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.$1, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                            Text(item.$2, style: textTheme.bodyMedium?.copyWith(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
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
