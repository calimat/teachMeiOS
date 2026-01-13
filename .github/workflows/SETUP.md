# GitHub Actions TestFlight Deployment Setup

This workflow uses native xcodebuild commands (no fastlane required) to automatically deploy your iOS app to TestFlight when you push to the `development` branch.

## Required GitHub Secrets

Configure these secrets in your GitHub repository: Settings → Secrets and variables → Actions → New repository secret

### 1. Code Signing Certificate (P12 file)

You need your iOS Distribution certificate exported as a P12 file.

**To export your certificate:**

1. Open **Keychain Access** on your Mac
2. Find your "iPhone Distribution" certificate (under "My Certificates")
3. Right-click → Export "iPhone Distribution: ..."
4. Save as `.p12` file and set a password
5. Convert to base64:
   ```bash
   base64 -i YourCertificate.p12 | pbcopy
   ```
6. Add to GitHub Secrets:
   - **CERTIFICATE_BASE64**: Paste the base64 string
   - **P12_PASSWORD**: The password you set when exporting

### 2. Provisioning Profile

You need your App Store provisioning profile for the app.

**To get your provisioning profile:**

1. Go to [Apple Developer Portal](https://developer.apple.com/account)
2. Navigate to Certificates, Identifiers & Profiles → Profiles
3. Download your App Store provisioning profile for `petitcoding.com.teachMe`
4. Convert to base64:
   ```bash
   base64 -i YourProfile.mobileprovision | pbcopy
   ```
5. Add to GitHub Secrets:
   - **PROVISIONING_PROFILE_BASE64**: Paste the base64 string

### 3. App Store Connect API Key

This is used to upload the app to TestFlight without needing your Apple ID password.

**To create an App Store Connect API Key:**

1. Go to [App Store Connect](https://appstoreconnect.apple.com/)
2. Navigate to **Users and Access** → **Keys** (under Integrations)
3. Click **"+"** to create a new key
4. Give it a name (e.g., "GitHub Actions") and select **"Developer"** or **"Admin"** access
5. Click **Generate**
6. Download the `.p8` file (you can only download it once!)
7. Note the **Key ID** and **Issuer ID** displayed on the page

**Add to GitHub Secrets:**

- **APP_STORE_CONNECT_API_KEY_ID**: The Key ID (e.g., `ABC123XYZ`)
- **APP_STORE_CONNECT_ISSUER_ID**: The Issuer ID (UUID format, e.g., `d12345ab-c123-456d-789e-f12345678901`)
- **APP_STORE_CONNECT_API_KEY_CONTENT**: The full content of the `.p8` file
  ```bash
  cat AuthKey_ABC123XYZ.p8 | pbcopy
  ```
  Then paste including the `-----BEGIN PRIVATE KEY-----` and `-----END PRIVATE KEY-----` lines

## Summary of Required Secrets

| Secret Name | Description |
|-------------|-------------|
| `CERTIFICATE_BASE64` | Base64-encoded P12 certificate |
| `P12_PASSWORD` | Password for the P12 certificate |
| `PROVISIONING_PROFILE_BASE64` | Base64-encoded provisioning profile |
| `APP_STORE_CONNECT_API_KEY_ID` | App Store Connect API Key ID |
| `APP_STORE_CONNECT_ISSUER_ID` | App Store Connect Issuer ID |
| `APP_STORE_CONNECT_API_KEY_CONTENT` | Content of the .p8 API key file |

## How It Works

When you push to the `development` branch, the workflow will:

1. ✅ Checkout the code
2. ✅ Install CocoaPods dependencies
3. ✅ Import code signing certificates and provisioning profiles
4. ✅ Increment build number automatically
5. ✅ Build and archive the app using `xcodebuild`
6. ✅ Export the IPA
7. ✅ Upload to TestFlight using `xcrun altool`
8. ✅ Clean up security credentials

## Testing the Workflow

1. Commit your changes to a feature branch
2. Push to `development` (or merge into `development`)
3. Go to your repository's **Actions** tab on GitHub
4. Watch the "Deploy to TestFlight" workflow run
5. Check the logs if anything fails

## Troubleshooting

### Code Signing Issues

**Error: "No signing certificate found"**
- Verify your `CERTIFICATE_BASE64` is correct
- Make sure your `P12_PASSWORD` matches the password you set
- Check that your certificate hasn't expired in Apple Developer Portal

**Error: "No provisioning profile found"**
- Verify your `PROVISIONING_PROFILE_BASE64` is correct
- Ensure the provisioning profile matches your bundle identifier (`petitcoding.com.teachMe`)
- Check that the profile hasn't expired

### Build Failures

**Error: "Build failed"**
- Make sure your project builds successfully locally first
- Check that all CocoaPods dependencies are properly configured
- Review the build logs in the Actions tab for specific errors

### Upload to TestFlight Fails

**Error: "API key authentication failed"**
- Verify all three API key secrets are correct
- Ensure your API key has "Developer" or "Admin" access
- Check that the API key hasn't been revoked in App Store Connect

**Error: "App validation failed"**
- Ensure your app version and build number are unique
- Check that your app meets all App Store guidelines
- Review the specific validation error in the logs

### Info.plist Not Found

**Error: "Could not find Info.plist"**
- The workflow expects `teachMe/Info.plist` - verify this path exists
- Update the path in the workflow if your Info.plist is elsewhere

## Advantages Over Fastlane

This native approach has several benefits:

- ✅ **Simpler**: No Ruby dependencies or Gemfile management
- ✅ **Faster**: Fewer tools to install and configure
- ✅ **More transparent**: Direct xcodebuild commands are easier to debug
- ✅ **Less maintenance**: No need to keep fastlane plugins updated
- ✅ **Native**: Uses Apple's official command-line tools

## Optional: Manual Trigger

To add the ability to manually trigger the workflow:

```yaml
on:
  push:
    branches:
      - development
  workflow_dispatch:  # Add this line
```

Then you can trigger it manually from the Actions tab in GitHub.

## Need Help?

If you encounter issues:

1. Check the workflow logs in the Actions tab
2. Verify all secrets are correctly configured
3. Test your code signing locally with xcodebuild
4. Ensure your certificates and profiles are valid in Apple Developer Portal
