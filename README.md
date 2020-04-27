# Maestro

![Swift](https://img.shields.io/badge/Swift-5.2+-f05138.svg?style=flat-square)

![iOS](https://img.shields.io/badge/iOS-9+-lightgrey.svg?style=flat-square)
![macOS](https://img.shields.io/badge/macOS-10.10+-lightgrey.svg?style=flat-square)
![tvOS](https://img.shields.io/badge/tvOS-9.0+-lightgrey.svg?style=flat-square)

`Maestro` is an Apple framework that facilitates the implementation of the **Coordinator** pattern in your App.

## Summary

- [Features](#features)
- [Installation](#installation)
  - [Carthage](#carthage)
  - [CocoaPods](#cocoapods)
  - [Swift Package Manager](#swift-package-manager)
- [Architecture](#architecture)
- [Contributing](#contributing)
- [Code of conduct](#code-of-conduct)
- [Credits](#credits)
- [License](#license)

## Features

- [x] Supports

## Installation

### Carthage

To integrate `Maestro` into your project, add the following line in your `Cartfile`:

```ogdl
github "Ethenyl/Maestro"
```

Then run the following command:

`$ carthage update`

### Cocoapods

To integrate `Maestro` into your project, add the following line in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Maestro'
end
```

Then run the following command:

`$ pod install`

### Swift Package Manager

To integrate `Maestro` with SPM, add it as a dependency in your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/Ethenyl/Maestro.git", .upToNextMajor(from: "1.0.0"))
]
```

## Architecture

## Contributing

So, you want to help improve `Maestro`? That's great! Any useful contribution is welcome!

Check [CONTRIBUTING](https://github.com/Ethenyl/Maestro/blob/master/CONTRIBUTING.md) for more details on how you can contribute to `Maestro`.

## Code of conduct

Any contributions (issues, pull requests, comments, etc.) to `Maestro` are more than welcome.

But before making any contribution, please make sure that you follow the [CODE OF CONDUCT](https://github.com/Ethenyl/Maestro/blob/master/CODE_OF_CONDUCT.md).

Otherwise, there's a great chance that your contribution will be removed / blocked / hidden.

## Credits

`Maestro` is owned and maintained by [Ethenyl](https://github.com/Ethenyl).

You can join the list by contributing to the repository.

## License

`Maestro` is released under the MIT license. See [LICENSE](https://github.com/Ethenyl/Maestro/blob/master/LICENSE) for more details.
