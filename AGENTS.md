# AGENTS.md - Flutter Fellowship Repository

## Overview
This is a Dart/Flutter learning repository containing task-based examples covering Dart language fundamentals. The codebase is organized into task directories (task1, task2, etc.), each containing learning modules.

## Build / Lint / Test Commands

### Flutter/Dart Commands
```bash
# Run a Dart file
dart run path/to/file.dart

# Analyze Dart code for issues
dart analyze

# Run Dart tests
dart test

# Run a single test file
dart test test/file_name_test.dart

# Run a single test (by name)
dart test --name "test_name"
```

### Flutter App Commands
```bash
# Flutter analysis (lint)
flutter analyze

# Flutter tests
flutter test

# Run single test file
flutter test test/file_name_test.dart

# Run specific test
flutter test test/file_name_test.dart --name "test_name"

# Build for debug
flutter build apk --debug

# Build for release
flutter build apk --release
```

## Code Style Guidelines

### Formatting
- Use 2 spaces for indentation (no tabs)
- Maximum line length: 80 characters (preferred), 100 (maximum)
- Use trailing commas in collection literals for better diffs
- Format code automatically with `dart format` or `flutter format`

### Imports
- Use package imports (`package:appName/path.dart`) for internal code
- Use dart: imports for core libraries
- Group imports: dart imports first, then package imports, then relative imports
- Sort imports alphabetically within groups

### Naming Conventions
- **Classes/Enums/typedefs**: PascalCase (e.g., `UserModel`, `ApiResponse`)
- **Functions/Variables**: camelCase (e.g., `getUserData`, `userList`)
- **Private members**: prefix with underscore (e.g., `_privateMethod`)
- **Constants**: camelCase or SCREAMING_SNAKE_CASE (prefer camelCase for const values)
- **File names**: snake_case (e.g., `user_service.dart`, `home_screen.dart`)

### Types
- Always specify return types for functions
- Prefer `final` over `var` when value doesn't change
- Use `late` keyword for lazy initialization
- Prefer strong typing; avoid `dynamic` when possible
- Use `void` explicitly for functions that don't return values

### Null Safety
- Use nullable types (`String?`) only when null is a valid state
- Use null-aware operators (`??`, `?.`, `?[]`) appropriately
- Prefer late initialization over nullable types when possible
- Use `required` keyword for required named parameters

### Error Handling
- Use try-catch for operations that may throw
- Prefer specific exception types over generic `Exception`
- Use `rethrow` when catching to preserve stack trace
- Avoid catching `Exception` or `Error` unless necessary

### Documentation
- Use `///` for documentation comments on public APIs
- Document public APIs with behavior, parameters, and return values
- Use TODO comments for pending work: `// TODO: description`

### Best Practices
- Keep functions small and focused (single responsibility)
- Prefer arrow functions for single-expression functions
- Use cascade notation (`..`) for method chains on same object
- Initialize collections with `const` when possible
- Use collection-for and collection-if for conditional/mapped collections
