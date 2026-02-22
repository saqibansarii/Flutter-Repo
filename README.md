# Flutter Amplify App

A production-ready Flutter web application configured for AWS Amplify deployment.

## Project Structure

```
flutter_amplify_app/
├── amplify.yml          ← AWS Amplify build configuration
├── pubspec.yaml         ← Flutter dependencies
├── lib/
│   ├── main.dart        ← App entry point
│   ├── theme/           ← Material 3 theming
│   ├── screens/         ← Home, About, Contact screens
│   └── widgets/         ← Reusable widgets (NavBar, FeatureCard)
└── web/
    ├── index.html       ← Web entry point
    └── _redirects       ← SPA routing rules
```

## Local Development

```bash
# Install dependencies
flutter pub get

# Run locally
flutter run -d chrome

# Build for web
flutter build web --release
```

## Deploy to AWS Amplify

### Option 1: Connect Git Repository (Recommended)

1. Push this project to GitHub / GitLab / Bitbucket / CodeCommit.
2. Go to [AWS Amplify Console](https://console.aws.amazon.com/amplify).
3. Click **"New app" → "Host web app"**.
4. Choose your Git provider and select the repository.
5. Amplify will auto-detect the `amplify.yml` build spec.
6. Click **"Save and deploy"**.

Amplify will automatically build and deploy on every push to your branch.

### Option 2: Manual Deploy (S3 + CloudFront via Amplify)

```bash
# Build the web app
flutter build web --release

# Install Amplify CLI
npm install -g @aws-amplify/cli

# Initialize Amplify in your project
amplify init

# Add hosting
amplify add hosting

# Publish
amplify publish
```

## AWS Amplify Configuration Notes

- The `amplify.yml` in the project root is automatically used by Amplify.
- The `web/_redirects` file ensures Flutter's client-side routing works correctly.
- Build output is from `build/web` directory.
- Flutter is downloaded fresh during each build (cached for speed).

## Environment Variables (Optional)

Set these in Amplify Console → App Settings → Environment Variables:

| Variable | Description |
|----------|-------------|
| `FLUTTER_VERSION` | Pin a specific Flutter version |
| `API_BASE_URL` | Your backend API URL |

## Customization

- Update `lib/theme/app_theme.dart` to change colors/fonts.
- Add new screens in `lib/screens/` and register routes in `main.dart`.
- Modify `amplify.yml` to add backend services (Auth, API, Storage).
