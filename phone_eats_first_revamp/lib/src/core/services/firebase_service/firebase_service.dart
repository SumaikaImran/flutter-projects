import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:phone_eats_first/src/core/services/firebase_service/base_firebase_service.dart';
import 'package:phone_eats_first/src/core/services/firebase_service/entities/firebase_entity.dart';
import 'package:phone_eats_first/src/core/services/firebase_service/firebase_response_handlers_mixin.dart';
import 'package:phone_eats_first/src/core/utils/app_logger.dart';

class FirebaseService
    with FirebaseResponseHandlersMixin
    implements BaseFirebaseService {
  late FirebaseAuth _auth;
  late FirebaseFirestore _firestore;
  late FirebaseStorage _storage;
  bool _isInitialized = false;

  @override
  Future<void> initialize() async {
    try {
      if (!_isInitialized) {
        await Firebase.initializeApp();
        _auth = FirebaseAuth.instance;
        _firestore = FirebaseFirestore.instance;
        _storage = FirebaseStorage.instance;
        _isInitialized = true;
        appLog('Firebase services initialized successfully');
      }
    } catch (e) {
      appPrint('Firebase initialization error: $e');
      rethrow;
    }
  }

  // Authentication Methods
  @override
  Future<FirebaseAuthResult> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _ensureInitialized();
      appLog('Signing in with email: $email');

      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = convertFirebaseUser(userCredential.user);
      appLog('Sign in successful for user: ${user?.uid}');

      return FirebaseAuthResult.success(user: user);
    } catch (e) {
      return handleAuthException(e);
    }
  }

  @override
  Future<FirebaseAuthResult> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _ensureInitialized();
      appLog('Signing up with email: $email');

      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = convertFirebaseUser(userCredential.user);
      appLog('Sign up successful for user: ${user?.uid}');

      return FirebaseAuthResult.success(user: user);
    } catch (e) {
      return handleAuthException(e);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _ensureInitialized();
      await _auth.signOut();
      appLog('User signed out successfully');
    } catch (e) {
      appPrint('Sign out error: $e');
      rethrow;
    }
  }

  @override
  Future<FirebaseUser?> getCurrentUser() async {
    try {
      await _ensureInitialized();
      final user = _auth.currentUser;
      return convertFirebaseUser(user);
    } catch (e) {
      appPrint('Get current user error: $e');
      return null;
    }
  }

  // Firestore Methods
  @override
  Future<FirebaseDocumentResult> getDocument({
    required String collection,
    required String documentId,
  }) async {
    try {
      await _ensureInitialized();
      appLog('Getting document: $collection/$documentId');

      final docSnapshot =
          await _firestore.collection(collection).doc(documentId).get();

      final data = convertDocumentSnapshot(docSnapshot);
      appLog('Document retrieved successfully');

      return FirebaseDocumentResult.success(
        documentId: documentId,
        documentData: data,
      );
    } catch (e) {
      return handleFirestoreException(e);
    }
  }

  @override
  Future<FirebaseDocumentResult> setDocument({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _ensureInitialized();
      appLog('Setting document: $collection/$documentId');

      await _firestore.collection(collection).doc(documentId).set(data);

      appLog('Document set successfully');

      return FirebaseDocumentResult.success(
        documentId: documentId,
        documentData: data,
      );
    } catch (e) {
      return handleFirestoreException(e);
    }
  }

  @override
  Future<FirebaseDocumentResult> updateDocument({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _ensureInitialized();
      appLog('Updating document: $collection/$documentId');

      await _firestore.collection(collection).doc(documentId).update(data);

      appLog('Document updated successfully');

      return FirebaseDocumentResult.success(
        documentId: documentId,
        documentData: data,
      );
    } catch (e) {
      return handleFirestoreException(e);
    }
  }

  @override
  Future<void> deleteDocument({
    required String collection,
    required String documentId,
  }) async {
    try {
      await _ensureInitialized();
      appLog('Deleting document: $collection/$documentId');

      await _firestore.collection(collection).doc(documentId).delete();

      appLog('Document deleted successfully');
    } catch (e) {
      handleFirestoreException(e);
    }
  }

  @override
  Future<FirebaseQueryResult> getCollection({
    required String collection,
    Map<String, dynamic>? whereConditions,
    int? limit,
    String? orderBy,
    bool? descending,
  }) async {
    try {
      await _ensureInitialized();
      appLog('Getting collection: $collection');

      Query query = _firestore.collection(collection);

      // Apply where conditions
      if (whereConditions != null) {
        whereConditions.forEach((field, value) {
          query = query.where(field, isEqualTo: value);
        });
      }

      // Apply ordering
      if (orderBy != null) {
        query = query.orderBy(orderBy, descending: descending ?? false);
      }

      // Apply limit
      if (limit != null) {
        query = query.limit(limit);
      }

      final querySnapshot = await query.get();
      final documents = convertQuerySnapshot(querySnapshot);
      final lastDocumentId = getLastDocumentId(querySnapshot);

      appLog(
        'Collection retrieved successfully. Documents: ${documents.length}',
      );

      return FirebaseQueryResult.success(
        documents: documents,
        lastDocumentId: lastDocumentId,
      );
    } catch (e) {
      throw handleFirestoreException(e);
    }
  }

  // Storage Methods
  @override
  Future<FirebaseStorageResult> uploadFile({
    required String path,
    required List<int> bytes,
    String? contentType,
  }) async {
    try {
      await _ensureInitialized();
      appLog('Uploading file to path: $path');

      final ref = _storage.ref().child(path);
      final metadata =
          contentType != null
              ? SettableMetadata(contentType: contentType)
              : null;

      final uploadTask = ref.putData(Uint8List.fromList(bytes), metadata);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();

      appLog('File uploaded successfully. Download URL: $downloadUrl');

      return FirebaseStorageResult.success(
        downloadUrl: downloadUrl,
        filePath: path,
      );
    } catch (e) {
      return handleStorageException(e);
    }
  }

  @override
  Future<void> deleteFile({required String path}) async {
    try {
      await _ensureInitialized();
      appLog('Deleting file from path: $path');

      final ref = _storage.ref().child(path);
      await ref.delete();

      appLog('File deleted successfully');
    } catch (e) {
      handleStorageException(e);
    }
  }

  @override
  Future<String> getDownloadUrl({required String path}) async {
    try {
      await _ensureInitialized();
      appLog('Getting download URL for path: $path');

      final ref = _storage.ref().child(path);
      final downloadUrl = await ref.getDownloadURL();

      appLog('Download URL retrieved: $downloadUrl');
      return downloadUrl;
    } catch (e) {
      handleStorageException(e);
      rethrow;
    }
  }

  // Helper Methods
  Future<void> _ensureInitialized() async {
    if (!_isInitialized) {
      await initialize();
    }
  }

  /// Get Firebase Auth instance
  FirebaseAuth get auth => _auth;

  /// Get Firestore instance
  FirebaseFirestore get firestore => _firestore;

  /// Get Firebase Storage instance
  FirebaseStorage get storage => _storage;

  /// Check if Firebase is initialized
  bool get isInitialized => _isInitialized;
}
