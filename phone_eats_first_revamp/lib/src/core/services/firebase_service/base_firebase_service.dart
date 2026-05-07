import 'package:phone_eats_first/src/core/services/firebase_service/entities/firebase_entity.dart';

abstract interface class BaseFirebaseService {
  /// Initialize Firebase services
  Future<void> initialize();

  /// Authentication methods
  Future<FirebaseAuthResult> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<FirebaseAuthResult> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<FirebaseUser?> getCurrentUser();

  /// Firestore methods
  Future<FirebaseDocumentResult> getDocument({
    required String collection,
    required String documentId,
  });

  Future<FirebaseDocumentResult> setDocument({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  });

  Future<FirebaseDocumentResult> updateDocument({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  });

  Future<void> deleteDocument({
    required String collection,
    required String documentId,
  });

  Future<FirebaseQueryResult> getCollection({
    required String collection,
    Map<String, dynamic>? whereConditions,
    int? limit,
    String? orderBy,
    bool? descending,
  });

  /// Storage methods
  Future<FirebaseStorageResult> uploadFile({
    required String path,
    required List<int> bytes,
    String? contentType,
  });

  Future<void> deleteFile({
    required String path,
  });

  Future<String> getDownloadUrl({
    required String path,
  });
} 