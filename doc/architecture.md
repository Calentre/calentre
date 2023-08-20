# Architecture Guide 🏛️

Calentre's architecture is designed with the principles of clean architecture in mind. This ensures separation of concerns, maintainability, and a clear structure for both the Flutter and React apps. Below, we'll discuss the architectural components and key technologies used in both apps.

## Clean Architecture Principles

Clean Architecture is a software design philosophy that promotes a clear separation of concerns and layers in an application. It divides the codebase into distinct layers, each with a specific responsibility. Calentre follows the Clean Architecture principles, which include:

- **Domain Layer:** Contains the core business logic, entities, and use cases. It's independent of external frameworks and libraries. 🧠

- **Data Layer:** Handles data access and storage. It consists of repositories that abstract data sources such as databases and APIs. 📦

- **Presentation Layer:** Manages the user interface, user interactions, and state management. It's responsible for rendering data and receiving user input. 🎨

## Flutter App Architecture

The Flutter app's architecture is organized as follows:

- **Domain:** This layer defines the core business logic of the app, including entities and use cases. The domain layer is independent of the UI and external libraries. 📚

- **Data:** The data layer manages data access and storage. It includes repositories that interact with Supabase, a powerful backend service, for data storage and retrieval. 🗂️

- **Presentation:** This layer handles the user interface, state management, and UI-related logic. The BLoC (Business Logic Component) pattern is used for state management. BLoCs are responsible for managing the app's business logic and emitting states in response to events. For more details on using BLoC, check out the [Flutter BLoC documentation](https://bloclibrary.dev/#/). 💼

- **Dependency Injection:** The `get_it` library is used for dependency injection, ensuring loose coupling and making components easily testable. To learn more about dependency injection with `get_it`, refer to the [get_it documentation](https://pub.dev/packages/get_it). 🧩

## React App Architecture

The React app's architecture follows similar principles:

- **Domain:** The core business logic and entities are defined in the domain layer. Just like the Flutter app, it's independent of the UI and external libraries. 🕊️

- **Data:** The data layer manages data access and communication with Supabase for backend interactions. Redux is used for state management in this layer. To get started with Redux, consult the [React Redux documentation](https://react-redux.js.org/introduction/getting-started). 📡

- **Presentation:** React components and UI-related logic are part of the presentation layer. Redux manages the state of the app and handles updates triggered by actions. 🚀

## Technology Stack

Calentre utilizes a combination of technologies to achieve its goals:

- **Flutter:** The Flutter framework is used for building the admin scheduler, primarily targeting Flutter Web. 📱

- **ReactJS and Next.js:** The client-facing scheduler is built using React and Next.js, providing a smooth user experience. ⚛️

- **Supabase:** The backend is powered by Supabase, which handles authentication, data storage, and communication for both apps. Supabase's simplicity and power make it an ideal choice for managing authentication and user data. For more information, visit the [Supabase documentation](https://supabase.io/docs). 🌐

- **Redux and BLoC:** Redux is used in the React app for state management, while the Flutter app uses the BLoC pattern for its clean and organized state management. 🔗

## Testing and Code Coverage

Ensuring code quality and reliability is essential. We aim for at least 80% test coverage in our apps. You can always view our coverage report on Codecov: [View Coverage Report](https://app.codecov.io/gh/fiizzy/calentre) 🧪

With these technologies and architectural choices, Calentre is able to provide a powerful and delightful scheduling experience for users and administrators alike. 🌟
