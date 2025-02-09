# Ease App

## Overview
Ease App is a Flutter-based mobile application designed to provide users with a seamless authentication experience. It includes features such as user registration, login, password recovery via OTP, and a "Remember Me" option for persistent authentication. The app leverages **Provider** for state management and uses **SharedPreferences** for local storage.

## Technologies Used
- **Flutter** (Version 3.27.3)
- **Provider** (State Management)
- **SharedPreferences** (Local Storage for Remember Me feature)

## Features
- **User Authentication**: Sign-up, Login, and Forgot Password functionalities.
- **OTP Verification**: Users receive an OTP via email for password reset.
- **Remember Me**: If selected, user credentials are stored locally, allowing automatic login until the user logs out or uninstalls the app.

## Setup Instructions
To run this app locally, follow these steps:

### Prerequisites
Ensure you have the following installed:
- [Flutter SDK 3.27.3](https://flutter.dev/docs/get-started/install)
- Android Studio or VS Code (with Flutter and Dart plugins)
- A connected device or emulator

### Installation Steps
1. Clone the repository:
   ```sh
   git clone https://github.com/TonyoGodson/Ease-Application.git
   ```
2. Navigate to the project directory:
   ```sh
   cd ease-app
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## Compatibility
The app was built using **Flutter 3.27.3**. While it may work on older Flutter versions, some dependencies or features might require updates. If you encounter compatibility issues, consider upgrading your Flutter version:
```sh
flutter upgrade
```

## Contribution
If you’d like to contribute to Ease App, feel free to fork the repository and submit a pull request.

## License
This project is licensed under the MIT License.

---
For any issues or feature requests, please create an issue on [GitHub](https://github.com/your-username/ease-app/issues).


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
