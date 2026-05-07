import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/exceptions/exceptions.dart';
import 'package:phone_eats_first/src/core/services/firebase_service/entities/firebase_entity.dart';
import 'package:phone_eats_first/src/core/utils/app_logger.dart';

mixin FirebaseResponseHandlersMixin {
  /// Handle Firebase Auth exceptions
  @protected
  FirebaseAuthResult handleAuthException(dynamic exception) {
    appPrint("Firebase Auth Exception: $exception");
    
    if (exception is FirebaseAuthException) {
      switch (exception.code) {
        case 'user-not-found':
          throw UnAuthException('No user found with this email');
        case 'wrong-password':
          throw UnAuthException('Wrong password provided');
        case 'email-already-in-use':
          throw BadRequestException('Email is already in use');
        case 'weak-password':
          throw BadRequestException('Password is too weak');
        case 'invalid-email':
          throw BadRequestException('Invalid email address');
        case 'user-disabled':
          throw ForbiddenException('User account has been disabled');
        case 'too-many-requests':
          throw ServerException('Too many requests. Please try again later');
        case 'operation-not-allowed':
          throw ForbiddenException('Operation not allowed');
        default:
          throw UnknownException(exception.message ?? 'Authentication failed');
      }
    }
    
    throw UnknownException('Authentication failed');
  }

  /// Handle Firestore exceptions
  @protected
  FirebaseDocumentResult handleFirestoreException(dynamic exception) {
    appPrint("Firestore Exception: $exception");
    
    if (exception is FirebaseException) {
      switch (exception.code) {
        case 'permission-denied':
          throw ForbiddenException('Permission denied');
        case 'not-found':
          throw NoDataException('Document not found');
        case 'already-exists':
          throw BadRequestException('Document already exists');
        case 'resource-exhausted':
          throw ServerException('Resource exhausted');
        case 'failed-precondition':
          throw BadRequestException('Operation failed due to precondition');
        case 'aborted':
          throw ServerException('Operation was aborted');
        case 'out-of-range':
          throw BadRequestException('Operation out of range');
        case 'unimplemented':
          throw ServerException('Operation not implemented');
        case 'internal':
          throw ServerException('Internal error');
        case 'unavailable':
          throw ServerException('Service unavailable');
        case 'data-loss':
          throw ServerException('Data loss occurred');
        case 'unauthenticated':
          throw UnAuthException('User not authenticated');
        default:
          throw UnknownException(exception.message ?? 'Firestore operation failed');
      }
    }
    
    throw UnknownException('Firestore operation failed');
  }

  /// Handle Firebase Storage exceptions
  @protected
  FirebaseStorageResult handleStorageException(dynamic exception) {
    appPrint("Firebase Storage Exception: $exception");
    
    if (exception is FirebaseException) {
      switch (exception.code) {
        case 'storage/unauthorized':
          throw UnAuthException('Storage access unauthorized');
        case 'storage/canceled':
          throw BadRequestException('Storage operation canceled');
        case 'storage/unknown':
          throw UnknownException('Unknown storage error');
        case 'storage/invalid-argument':
          throw BadRequestException('Invalid storage argument');
        case 'storage/no-default-bucket':
          throw ServerException('No default storage bucket');
        case 'storage/cannot-slice-blob':
          throw BadRequestException('Cannot slice blob');
        case 'storage/server-file-wrong-size':
          throw ServerException('Server file wrong size');
        case 'storage/quota-exceeded':
          throw ServerException('Storage quota exceeded');
        case 'storage/unauthenticated':
          throw UnAuthException('Storage access unauthenticated');
        case 'storage/retry-limit-exceeded':
          throw ServerException('Storage retry limit exceeded');
        case 'storage/invalid-checksum':
          throw BadRequestException('Invalid storage checksum');
        case 'storage/canceled':
          throw BadRequestException('Storage operation canceled');
        case 'storage/invalid-event-name':
          throw BadRequestException('Invalid storage event name');
        case 'storage/invalid-url':
          throw BadRequestException('Invalid storage URL');
        case 'storage/invalid-upload':
          throw BadRequestException('Invalid storage upload');
        case 'storage/invalid-default-bucket':
          throw ServerException('Invalid default storage bucket');
        case 'storage/no-such-bucket':
          throw NoDataException('Storage bucket not found');
        case 'storage/no-such-object':
          throw NoDataException('Storage object not found');
        case 'storage/retry-limit-exceeded':
          throw ServerException('Storage retry limit exceeded');
        default:
          throw UnknownException(exception.message ?? 'Storage operation failed');
      }
    }
    
    throw UnknownException('Storage operation failed');
  }

  /// Convert Firebase User to our FirebaseUser model
  @protected
  FirebaseUser? convertFirebaseUser(User? user) {
    if (user == null) return null;
    
    return FirebaseUser(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoURL: user.photoURL,
      emailVerified: user.emailVerified,
      creationTime: user.metadata.creationTime,
      lastSignInTime: user.metadata.lastSignInTime,
    );
  }

  /// Convert Firestore DocumentSnapshot to Map
  @protected
  Map<String, dynamic>? convertDocumentSnapshot(DocumentSnapshot? snapshot) {
    if (snapshot == null || !snapshot.exists) return null;
    
    final data = snapshot.data() as Map<String, dynamic>?;
    if (data == null) return null;
    
    // Add document ID to the data
    data['id'] = snapshot.id;
    return data;
  }

  /// Convert Firestore QuerySnapshot to List of Maps
  @protected
  List<Map<String, dynamic>> convertQuerySnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      return data;
    }).toList();
  }

  /// Get the last document ID for pagination
  @protected
  String? getLastDocumentId(QuerySnapshot snapshot) {
    if (snapshot.docs.isEmpty) return null;
    return snapshot.docs.last.id;
  }
} 