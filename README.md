# local_file_screenshot_processor

This is intended as a custom processor for the [Device Preview](https://pub.dev/packages/device_preview) utility to avoid issues with running into usage limitations for file.io.

## Getting Started

See the example app for a full example, but using the local file utility should be as simple as specifying the localFileScreenshotProcessor as an argument to the ScreenshotPlugin:

``` dart
DevicePreview(
  plugins: [
    const ScreenshotPlugin(processor: localFileScreenshotProcessor)
  ],
  builder: (context) {
    return MyApp();
  },
)
```

When using the device preview app, the absolute path of the screenshot should be copied to your clip board, which, in the case of an Android emulator, you can grab by executing `adb pull [COPIED_PATH]`

