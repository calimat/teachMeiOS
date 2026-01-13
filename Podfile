# Minimum iOS 12.0 required for modern Xcode
platform :ios, '12.0'

target 'teachMe' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for teachMe
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'Firebase/Core'

  target 'teachMeTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Firebase/Auth'
    pod 'Firebase/Firestore'
    pod 'Firebase/Core'
  end

end

# Fix deployment targets and architecture issues for Xcode 16+
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      # Set minimum deployment target to 12.0
      if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 12.0
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end
      # Exclude x86_64 simulator to avoid BoringSSL-GRPC build issues
      config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'x86_64'

      # Fix gRPC-Core template keyword errors in Xcode 16+
      if target.name == 'gRPC-Core' || target.name == 'gRPC-C++'
        config.build_settings['OTHER_CPLUSPLUSFLAGS'] = '$(inherited) -Wno-error=missing-template-arg-list-after-template-kw'
      end
    end

    # Fix BoringSSL-GRPC compiler flags issue
    if target.name == 'BoringSSL-GRPC'
      target.source_build_phase.files.each do |file|
        if file.settings && file.settings['COMPILER_FLAGS']
          flags = file.settings['COMPILER_FLAGS']
          # Remove the invalid -GCC_WARN_INHIBIT_ALL_WARNINGS flag
          file.settings['COMPILER_FLAGS'] = flags.gsub('-GCC_WARN_INHIBIT_ALL_WARNINGS', '')
        end
      end
    end
  end
end
