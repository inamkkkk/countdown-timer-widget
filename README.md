# Countdown Timer Widget

A reusable Flutter widget for displaying a countdown timer.

## Features

- Takes a duration as input.
- Formats the remaining time in a clear and readable way (e.g., HH:MM:SS).
- Uses Provider for state management.

## Usage

1.  Add the dependency to your `pubspec.yaml`:

    
    dependencies:
      countdown_timer: # Add the correct version number here
    

2.  Import the widget:

    
    import 'package:countdown_timer/screens/countdown_screen.dart';
    

3.  Use the `CountdownScreen` widget in your app, providing the desired duration:

    
    CountdownScreen(duration: Duration(minutes: 5));
    

## Folder Structure


lib/
├── main.dart
├── models/
│   └── timer_model.dart
├── screens/
│   └── countdown_screen.dart
├── services/
│   └── timer_service.dart

