# pay4me

A Flutter Job Assessment project.

## Setup Instructions

### Prerequisites
- Ensure you have [Flutter](https://flutter.dev/docs/get-started/install) installed.
- Install dependencies by running:
  ```sh
  flutter pub get
  ```
- Run the app:
  ```sh
  flutter run
  ```

## Architecture Overview
This project follows **Clean Architecture** with **Riverpod** for state management. The architecture ensures separation of concerns, modularization, and testability.

### Project Structure
- **Application Layer**: Contains grouped **UseCases** that handle business logic. If there are API calls, this layer ensures all related actions are grouped together. For example, user management actions like `deleteUser`, `addUser`, etc.
- **Data Layer**: Contains repository implementations and interfaces. This layer interacts with external data sources (e.g., API, local storage) and provides data to the application layer.
- **Presentation Layer**: Handles the UI, including screens and widgets. UI components do not interact with core logic directly but use **providers** to access state and logic implicitly.

### State Management
We use **Riverpod** for state management, ensuring that:
- The UI does not directly interact with business logic.
- State and **Notifier** classes are responsible for managing and exposing application state.
- The UI subscribes to state changes via Riverpod providers.

### Key Benefits of This Approach
✅ **Loose Coupling**: The UI is decoupled from business logic.
✅ **Scalability**: The architecture allows for easy expansion and feature additions.
✅ **Testability**: Business logic and UI can be tested independently.
✅ **Maintainability**: Clear separation of concerns improves code readability and maintainability.

## Additional Notes
- Cached network images are used via `CachedNetworkImageProvider` to optimize performance.
- API calls and other side effects are properly abstracted within use cases and repositories.


