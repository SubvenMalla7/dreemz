# Flutter Skeleton Project

**Prepared by:** Subven Bahadur Malla  
**Date:** May 05, 2025

## Project Overview
This Flutter project is built using Clean Architecture principles, implementing a robust and scalable structure for mobile application development. The project follows best practices and modern development patterns to ensure maintainability and testability.

## Architecture

### Clean Architecture
The project follows Clean Architecture principles with distinct layers:
- **Presentation Layer**: Contains UI components, BLoC for state management
- **Domain Layer**: Business logic and entities
- **Data Layer**: Data sources and repositories

### State Management
- Uses **BLoC (Business Logic Component)** pattern for state management
- Implements **Freezed** for immutable state classes and entity mapping
- Provides type-safe state handling and automatic code generation

### Network Layer
- **Dio** for HTTP client implementation
- Custom interceptors for request/response handling
- Managed response handling with proper error management

## Project Structure

```
lib/
├── core/
│   ├── api/           # API related configurations
│   ├── constant/      # Application constants
│   ├── enums/         # Enumeration classes
│   ├── entity/        # Core entities
│   ├── extension/     # Extension methods
│   ├── helper/        # Helper utilities
│   ├── routes/        # Route management
│   ├── service/       # Core services
│   ├── singleton/     # Singleton instances
│   ├── theme/         # App theme configuration
│   ├── util/          # Utility functions
│   └── validator/     # Input validation
│
├── features/          # Feature modules
│   └── table/         # Table feature module
│       ├── data/      # Data layer
│       │   ├── model/             # Data models
│       │   └── repository_impl/   # Repository implementations
│       ├── domain/    # Domain layer
│       │   ├── repository/        # Repository interfaces
│       │   └── usecase/          # Use cases
│       └── presentation/  # Presentation layer
│           ├── cubit/    # State management
│           └── screen/   # UI screens
│           └── widget/   # UI widgets
│
├── gen/              # Generated files
├── injection.dart    # Dependency injection setup
├── injection.config.dart
├── main.dart         # Application entry point
└── firebase_options.dart
```

## Key Features
- Clean Architecture implementation
- BLoC pattern for state management
- Freezed for immutable state and entity mapping
- Dio with interceptors for network calls
- Dependency injection
- Modular feature-based structure
- Type-safe state management
- Comprehensive error handling

## Getting Started

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the code generation:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. Launch the application:
   ```bash
   flutter run
   ```

## Dependencies
- flutter_bloc: State management
- freezed: Immutable state and entity mapping
- dio: Network calls
- get_it: Dependency injection
- injectable: Dependency injection code generation

## Development Guidelines
1. Follow Clean Architecture principles
2. Implement BLoC pattern for state management
3. Use Freezed for state and entity classes
4. Maintain proper separation of concerns
5. Write unit tests for business logic
6. Follow the established folder structure

## License
This project is proprietary and confidential.
