# GitHub Actions TestFlight Deployment Setup

This document explains how to configure the GitHub Actions workflow to automatically deploy your iOS app to TestFlight when you push to the `development` branch.

## Required GitHub Secrets

You need to configure the following secrets in your GitHub repository settings (Settings → Secrets and variables → Actions → New repository secret):

### 1. Fastlane Match Secrets

These are used to access your certificates and provisioning profiles:

- **MATCH_PASSWORD**: The password used to encrypt your certificates in the match repository
- **MATCH_GIT_URL**: The git URL of your certificates repository (e.g., `https://github.com/yourusername/certificates`)
- **MATCH_KEYCHAIN_NAME**: Name for the temporary keychain (e.g., `github_actions_keychain`)
- **MATCH_KEYCHAIN_PASSWORD**: Password for the temporary keychain (use a strong random password)

### 2. App Store Connect API Key

Instead of using Apple ID credentials, this workflow uses App Store Connect API keys for authentication. This is more secure and doesn't require 2FA handling.

To create an App Store Connect API Key:

1. Go to [App Store Connect](https://appstoreconnect.apple.com/)
2. Navigate to Users and Access → Keys
3. Click the "+" button to create a new key
4. Give it a name (e.g., "GitHub Actions") and select "Developer" or "Admin" access
5. Download the API key file (it will be named something like `AuthKey_XXXXXXXXXX.p8`)
6. Note the Key ID and Issuer ID shown on the page

Then add these secrets:

- **APP_STORE_CONNECT_API_KEY_KEY_ID**: The Key ID from App Store Connect (e.g., `ABC123XYZ`)
- **APP_STORE_CONNECT_API_KEY_ISSUER_ID**: The Issuer ID from App Store Connect (UUID format)
- **APP_STORE_CONNECT_API_KEY_KEY**: The full content of the `.p8` file you downloaded. Copy the entire file content including the `-----BEGIN PRIVATE KEY-----` and `-----END PRIVATE KEY-----` lines.

## Setting Up Fastlane Match (If Not Already Configured)

If you haven't set up Fastlane Match yet:

1. Create a private git repository to store certificates (e.g., `certificates`)
2. Run `fastlane match init` and follow the prompts
3. Run `fastlane match appstore` to generate and store your certificates
4. The MATCH_PASSWORD you set during this process should be added to GitHub secrets

## Updating the Fastfile (If Using API Key)

If you want to use the App Store Connect API key instead of Apple ID authentication, update your `fastlane/Fastfile` to include:

```ruby
lane :beta do
  # Set up API Key authentication
  app_store_connect_api_key(
    key_id: ENV["APP_STORE_CONNECT_API_KEY_KEY_ID"],
    issuer_id: ENV["APP_STORE_CONNECT_API_KEY_ISSUER_ID"],
    key_content: ENV["APP_STORE_CONNECT_API_KEY_KEY"]
  )

  # ... rest of your existing beta lane code
end
```

## Testing the Workflow

1. Commit your changes to a feature branch
2. Push to the `development` branch (or merge your feature branch into development)
3. Go to the "Actions" tab in your GitHub repository
4. You should see the "Deploy to TestFlight" workflow running
5. Click on it to see the detailed logs

## Troubleshooting

### Code Signing Issues
- Verify that your MATCH_PASSWORD and MATCH_GIT_URL are correct
- Ensure your match repository contains valid certificates for App Store distribution
- Run `fastlane match appstore` locally to verify your certificates are valid

### Upload to TestFlight Fails
- Verify your App Store Connect API key has the correct permissions
- Check that the API key hasn't expired
- Ensure your app's bundle identifier matches what's in App Store Connect

### Build Fails
- Check the build logs in the Actions tab
- Verify that all CocoaPods dependencies are properly configured
- Ensure your Xcode project builds successfully locally first

## Workflow Trigger

The workflow is currently configured to trigger on:
- Push to `development` branch

To add more triggers (like manual trigger or specific tags), modify the `on:` section in `.github/workflows/testflight-deploy.yml`.

## Additional Notes

- The workflow runs on `macos-latest` which provides the latest stable macOS environment with Xcode
- Build artifacts (logs) are uploaded if the build fails, making debugging easier
- The temporary keychain is created and destroyed during the build process for security
