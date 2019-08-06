# Tactivo Health Card Library

This library is intended to help reading the german health card (eGK) using the Tactivo Toolkit.

## Releases

| Date       | Version | Description     |
| ---------- | ------: | --------------- |
| 19.09.2018 |   1.0.0 | Initial release |
| 07.05.2019 |   1.0.5 | encoding bug for german special chars release |
| 06.08.2019 |   1.2.0 | release |

## Setup

In order to use the Tactivo Health Card Library, please perform the following steps:

1. Include the `libiOSLibrary.a` library from the Tactivo toolkit and the corresponding header files.

2. Include the `libTactivoHealthCardLibrary.a` library from the Tactivo Health Card Library and the corresponding header files.

3. Include the `AudioToolbox.framework` in your application's `Linked Frameworks and Libraries`.

4. Set the following `Supported external accessory protocols` in your application's `Info.plist`:

   - com.precisebiometrics.ccidbulk
   - com.precisebiometrics.ccidcontrol
   - com.precisebiometrics.ccidinterrupt

> For more information on how to setup Tactivo Toolkit please refer to the corresponding guide.

## Reading the card

To read the card please use the `HealthCardController` class.

```objective-c
PBSmartcard* smartcard = [[PBSmartcard alloc] init];

PBHealthCardController* healthCardController = [[PBHealthCardController alloc] initWithSmartcard:smartcard];

[healthCardController readCard:^(PBHealthCard* healthCard, NSError* error) {
    if (healthCard == nil) {
        // Failed to read health card, show error message.
        return;
    }

    // Do something with health card.
}];
```

## Example

An example on how to use the library is located in `example/`.

## Documentation

The documentation for the library can be found in `doc/`.

> For further information on how to use the Tactivo Toolkit please refer to the corresponding documentation.
