[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://stand-with-ukraine.pp.ua)
[![style: flutter lints](https://img.shields.io/badge/style-flutter__lints-blue)](https://pub.dev/packages/flutter_lints)

# Flutter Onion Architecture Counter With Stream

This project is a refactored version of the
[default Flutter counter app](https://dartpad.dev/?sample=counter),
demonstrating how it could be implemented in a production environment using
Onion Architecture, originally introduced by
[Jeffrey Palermo](https://jeffreypalermo.com/about/) in his article
[The Onion Architecture](https://jeffreypalermo.com/2008/07/the-onion-architecture-part-1/).

The default counter app is often criticized for its simplicity and lack of
real-world applicability. This example showcases a more maintainable and
scalable approach, incorporating immutability, dependency injection, and
reactive state management
using [streams](https://dart.dev/libraries/async/using-streams).

<!--suppress CheckImageSize -->
<a href="https://sites.libsyn.com/412964/onion-architecture-episode-2">
<!--suppress CheckImageSize -->
<img src="documentation/onion_architecture.jpeg" width="800" title="Onion Architecture" alt="Image of the Onion Architecture Pattern">
</a>

## Architecture Overview

The project follows the four main layers of Onion Architecture:

1. **Domain Model**: Core business logic and entities.
2. **Domain Services**: Business rules and operations.
3. **Application Services**: Application-specific logic and orchestration.
4. **Outermost Layer**: Includes User Interface, Infrastructure (DB and/or WS),
   and Tests.

### Domain Model Layer

Contains the `Counter` entity. This layer does not depend on anything else,
which is evident from the imports in the class.

### Domain Services Layer

Contains the `IncrementCounter` interface and its implementation
`IncrementCounterFakeImpl`. This layer depends only on the Domain Model.

### Application Services Layer

Contains the `CounterPresenter` which manages the state and business logic.
This layer depends on both Domain Services and Domain Model.

### Outermost Layer

- **User Interface Component**: Contains the `MyHomePage` widget and the
  `main` function with `MyApp` widget.
- **Infrastructure Component**: Contains the `CounterDataSource` interface and
  its fake implementation `FakeCounterDataSource`, which uses a `Stream` for the
  `watch` method.
- **Tests**: Adjusted for Onion Architecture, highlighting their importance as
  a component of the outermost layer.

The Infrastructure, User Interface, and Tests components have access to all
inner layers.

### Note on Layer Separation

For the sake of simplicity, the inner layers are not decoupled into separate
packages in this example. In a production environment, it is essential to
enforce the dependency flow by separating these layers into different
packages. This ensures that, for example, the Domain Model layer cannot access
the User Interface layer.

### Project Structure

The simplified structure of the project is as follows:

```
lib/
├── main.dart
├── core/
│   ├── application_services/
│   └── domain/
│       ├── model/
│       └── services/
├── infrastructure/
└── user_interface/
```

## Getting Started

To get started with this project, clone the repository and run the following
commands:

```bash
flutter pub get
flutter run
```

## Running Tests

To run the tests, use the following command:

```bash
flutter test
```

The tests are adjusted for Onion Architecture, demonstrating how to test each
layer independently and ensuring the overall integrity of the application.

### Screenshot:

<!--suppress CheckImageSize -->
<img src="screenshots/Android_Screenshot_20240805.png" width="200"  alt="screenshot">