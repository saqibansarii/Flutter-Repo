import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';
import '../widgets/feature_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary,
                    colorScheme.secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Flutter + AWS Amplify',
                    style: textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'A production-ready Flutter web app\ndeployed on AWS Amplify',
                    style: textTheme.titleLarge?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/about'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: colorScheme.primary,
                        ),
                        child: const Text('Learn More'),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton(
                        onPressed: () => Navigator.pushNamed(context, '/contact'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                        ),
                        child: const Text('Contact Us'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Features Section
            Padding(
              padding: const EdgeInsets.all(48),
              child: Column(
                children: [
                  Text(
                    'Why Flutter on AWS Amplify?',
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Build once, deploy everywhere with cloud-native hosting.',
                    style: textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final crossAxisCount = constraints.maxWidth > 900
                          ? 3
                          : constraints.maxWidth > 600
                              ? 2
                              : 1;
                      return GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 24,
                        childAspectRatio: 1.4,
                        children: const [
                          FeatureCard(
                            icon: Icons.speed,
                            title: 'Fast Deployment',
                            description:
                                'Deploy your Flutter web app in minutes with AWS Amplify CI/CD pipelines.',
                          ),
                          FeatureCard(
                            icon: Icons.cloud_done,
                            title: 'Global CDN',
                            description:
                                'Serve your app from edge locations worldwide for low-latency access.',
                          ),
                          FeatureCard(
                            icon: Icons.lock,
                            title: 'Secure by Default',
                            description:
                                'HTTPS, custom domains, and access control out of the box.',
                          ),
                          FeatureCard(
                            icon: Icons.auto_awesome,
                            title: 'Auto Scaling',
                            description:
                                'AWS Amplify handles traffic spikes without manual configuration.',
                          ),
                          FeatureCard(
                            icon: Icons.developer_mode,
                            title: 'Flutter Web',
                            description:
                                'Single codebase for web, mobile, and desktop applications.',
                          ),
                          FeatureCard(
                            icon: Icons.analytics,
                            title: 'Built-in Analytics',
                            description:
                                'Monitor deployments and app performance from the AWS console.',
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),

            // Stats Section
            Container(
              color: colorScheme.surfaceVariant,
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 600;
                  final stats = [
                    {'value': '99.99%', 'label': 'Uptime SLA'},
                    {'value': '<50ms', 'label': 'Global Latency'},
                    {'value': '∞', 'label': 'Scalability'},
                    {'value': '24/7', 'label': 'AWS Support'},
                  ];
                  return isWide
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: stats.map((s) => _StatItem(value: s['value']!, label: s['label']!)).toList(),
                        )
                      : Wrap(
                          spacing: 32,
                          runSpacing: 32,
                          alignment: WrapAlignment.center,
                          children: stats.map((s) => _StatItem(value: s['value']!, label: s['label']!)).toList(),
                        );
                },
              ),
            ),

            // Footer
            Container(
              width: double.infinity,
              color: colorScheme.inverseSurface,
              padding: const EdgeInsets.all(24),
              child: Text(
                '© ${DateTime.now().year} Flutter Amplify App. Built with ❤️ using Flutter & AWS.',
                style: TextStyle(color: colorScheme.onInverseSurface),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
