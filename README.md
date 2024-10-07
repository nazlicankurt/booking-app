# flutter_booking_app


A Flutter application designed for booking hotels, allowing users to find, save, and manage their favorite accommodations effortlessly.

## Getting Started

This project serves as a comprehensive solution for hotel booking in Flutter. It utilizes BLoC for state management, ensuring a clear separation of concerns and enhanced maintainability.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## How to Run the App

To run the app locally, follow these steps:

**Clone the repository:**

``git clone https://github.com/nazlicankurt/booking-app.git``

**Navigate to the project directory:**
``cd booking-app/flutter_booking_app``


``flutter pub get``

``flutter run``

![Hotel Image](assets/images/hotel.png)
![Hotel Image](assets/images/favori.png)
![Hotel Image](assets/images/home.png)


## Architecture

The application follows a clean architecture pattern, structured into distinct layers to promote separation of concerns and maintainability:

- **Presentation Layer**: Contains UI components such as `HotelsView` and `FavoritesView`, utilizing BLoC for state management to handle business logic and UI updates efficiently.
  
- **Domain Layer**: Manages business logic through use cases (e.g., `GetHotelsUseCase`) that interact with the data layer. This layer is responsible for defining the core functionality of the application.
  
- **Data Layer**: Handles data retrieval and storage, including the `HotelRemoteDataSource` for fetching hotel data from the API and local storage options if implemented. This layer ensures that data is managed effectively and provides a clear API for the domain layer.


## Features

- **Hotels**: Users can see hotels based on various criteria such as destination and prices
- **Favorites Management**: Users can save their favorite hotels for quick access, with real-time updates to reflect the current favorites list.
- **Detailed Hotel Information**: Each hotel card displays essential details including hotel name, location, images, room types, and pricing.
- **Loading Indicators**: Skeleton loaders provide a smooth experience while data is being fetched from the API.
- **Lottie Animations**: Engaging animations for states such as "no hotels found" enhance user experience.


## Assets

The `assets` directory contains images, fonts, and other resources needed for the application.

- The `assets/images` directory holds resolution-aware images to ensure optimal display on various screen sizes.
- Lottie animations are stored in the `assets/animations` directory, enhancing the visual appeal and user experience of the app.


## Localization

The project supports localization through ARB files located in the `lib/src/localization` directory. This allows for easy addition of new languages and ensures that the application can cater to a diverse audience.

- To add support for additional languages, follow the guidelines in the [Internationalizing Flutter apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization) tutorial.
- Localized messages are automatically generated based on the contents of the ARB files, making it simple to manage translations.


## Video Tutorial

You can watch a video tutorial about the project [here](https://vimeo.com/1017045772?share=copy).