# Firebase Service

This Firebase service follows the same architectural pattern as the network service, providing a clean and consistent interface for Firebase operations.

## Structure

```
firebase_service/
├── base_firebase_service.dart          # Abstract interface
├── firebase_service.dart               # Main implementation
├── firebase_response_handlers_mixin.dart # Error handling mixin
├── firebase_config.dart                # Configuration setup
├── firebase_service_exports.dart       # Export file
├── entities/
│   └── firebase_entity.dart            # Data models
└── routes/
    └── firebase_routes.dart            # Route constants
```

## Features

### Authentication
- Email/Password sign in and sign up
- User session management
- Current user retrieval

### Firestore Database
- Document CRUD operations
- Collection queries with filtering, ordering, and pagination
- Real-time data synchronization support

### Firebase Storage
- File upload and download
- File deletion
- Download URL generation

## Usage

### Initialization

```dart
import 'package:phone_eats_first/src/core/services/firebase_service/firebase_service_exports.dart';

// Initialize Firebase
final firebaseService = FirebaseService();
await firebaseService.initialize();
```

### Authentication

```dart
// Sign in
final authResult = await firebaseService.signInWithEmailAndPassword(
  email: 'user@example.com',
  password: 'password123',
);

if (authResult.success) {
  print('User signed in: ${authResult.user?.uid}');
} else {
  print('Sign in failed: ${authResult.error}');
}

// Sign up
final signUpResult = await firebaseService.signUpWithEmailAndPassword(
  email: 'newuser@example.com',
  password: 'password123',
);

// Get current user
final currentUser = await firebaseService.getCurrentUser();

// Sign out
await firebaseService.signOut();
```

### Firestore Operations

```dart
// Create/Update document
final result = await firebaseService.setDocument(
  collection: 'users',
  documentId: 'user123',
  data: {
    'name': 'John Doe',
    'email': 'john@example.com',
    'createdAt': DateTime.now().toIso8601String(),
  },
);

// Get document
final docResult = await firebaseService.getDocument(
  collection: 'users',
  documentId: 'user123',
);

// Query collection
final queryResult = await firebaseService.getCollection(
  collection: 'restaurants',
  whereConditions: {'city': 'New York'},
  orderBy: 'rating',
  descending: true,
  limit: 10,
);

// Update document
await firebaseService.updateDocument(
  collection: 'users',
  documentId: 'user123',
  data: {'lastLogin': DateTime.now().toIso8601String()},
);

// Delete document
await firebaseService.deleteDocument(
  collection: 'users',
  documentId: 'user123',
);
```

### Storage Operations

```dart
// Upload file
final uploadResult = await firebaseService.uploadFile(
  path: 'profile_images/user123.jpg',
  bytes: imageBytes,
  contentType: 'image/jpeg',
);

if (uploadResult.success) {
  print('File uploaded: ${uploadResult.downloadUrl}');
}

// Get download URL
final downloadUrl = await firebaseService.getDownloadUrl(
  path: 'profile_images/user123.jpg',
);

// Delete file
await firebaseService.deleteFile(
  path: 'profile_images/user123.jpg',
);
```

## Error Handling

The service uses a comprehensive error handling system that maps Firebase exceptions to custom exceptions:

- `FirebaseAuthException` → `UnAuthException`, `BadRequestException`, etc.
- `FirebaseException` (Firestore) → `ForbiddenException`, `NoDataException`, etc.
- `FirebaseException` (Storage) → `ServerException`, `BadRequestException`, etc.

## Configuration

Update the Firebase configuration in `firebase_config.dart`:

1. Replace placeholder values with your actual Firebase project credentials
2. Add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) to your project
3. Configure Firebase project settings in the Firebase Console

## Dependencies

Make sure these dependencies are added to `pubspec.yaml`:

```yaml
dependencies:
  firebase_core: ^3.6.0
  firebase_auth: ^5.3.3
  cloud_firestore: ^5.5.1
  firebase_storage: ^12.3.3
```

## Integration with DI

Register the Firebase service in your dependency injection container:

```dart
// In your DI setup
locator.registerLazySingleton<BaseFirebaseService>(() => FirebaseService());
```

## Best Practices

1. Always check the `success` property of result objects before proceeding
2. Handle errors appropriately in your UI layer
3. Use the route constants from `firebase_routes.dart` for consistency
4. Initialize Firebase early in your app lifecycle
5. Use proper security rules in Firebase Console
6. Implement proper error boundaries in your UI 