import 'dart:convert';

/// Base Firebase result class
abstract class FirebaseResult {
  final bool success;
  final String? error;
  final dynamic data;

  FirebaseResult({
    required this.success,
    this.error,
    this.data,
  });
}

/// Authentication result
class FirebaseAuthResult extends FirebaseResult {
  final FirebaseUser? user;

  FirebaseAuthResult({
    required super.success,
    super.error,
    super.data,
    this.user,
  });

  factory FirebaseAuthResult.success({FirebaseUser? user}) {
    return FirebaseAuthResult(
      success: true,
      user: user,
    );
  }

  factory FirebaseAuthResult.error(String error) {
    return FirebaseAuthResult(
      success: false,
      error: error,
    );
  }
}

/// Firebase user model
class FirebaseUser {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoURL;
  final bool emailVerified;
  final DateTime? creationTime;
  final DateTime? lastSignInTime;

  FirebaseUser({
    required this.uid,
    this.email,
    this.displayName,
    this.photoURL,
    required this.emailVerified,
    this.creationTime,
    this.lastSignInTime,
  });

  factory FirebaseUser.fromJson(Map<String, dynamic> json) {
    return FirebaseUser(
      uid: json['uid'] ?? '',
      email: json['email'],
      displayName: json['displayName'],
      photoURL: json['photoURL'],
      emailVerified: json['emailVerified'] ?? false,
      creationTime: json['creationTime'] != null 
          ? DateTime.parse(json['creationTime']) 
          : null,
      lastSignInTime: json['lastSignInTime'] != null 
          ? DateTime.parse(json['lastSignInTime']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
      'emailVerified': emailVerified,
      'creationTime': creationTime?.toIso8601String(),
      'lastSignInTime': lastSignInTime?.toIso8601String(),
    };
  }
}

/// Document result for Firestore operations
class FirebaseDocumentResult extends FirebaseResult {
  final String? documentId;
  final Map<String, dynamic>? documentData;

  FirebaseDocumentResult({
    required super.success,
    super.error,
    super.data,
    this.documentId,
    this.documentData,
  });

  factory FirebaseDocumentResult.success({
    String? documentId,
    Map<String, dynamic>? documentData,
  }) {
    return FirebaseDocumentResult(
      success: true,
      documentId: documentId,
      documentData: documentData,
    );
  }

  factory FirebaseDocumentResult.error(String error) {
    return FirebaseDocumentResult(
      success: false,
      error: error,
    );
  }
}

/// Query result for Firestore collection queries
class FirebaseQueryResult extends FirebaseResult {
  final List<Map<String, dynamic>> documents;
  final String? lastDocumentId;

  FirebaseQueryResult({
    required super.success,
    super.error,
    super.data,
    required this.documents,
    this.lastDocumentId,
  });

  factory FirebaseQueryResult.success({
    required List<Map<String, dynamic>> documents,
    String? lastDocumentId,
  }) {
    return FirebaseQueryResult(
      success: true,
      documents: documents,
      lastDocumentId: lastDocumentId,
    );
  }

  factory FirebaseQueryResult.error(String error) {
    return FirebaseQueryResult(
      success: false,
      error: error,
      documents: [],
    );
  }
}

/// Storage result for Firebase Storage operations
class FirebaseStorageResult extends FirebaseResult {
  final String? downloadUrl;
  final String? filePath;

  FirebaseStorageResult({
    required super.success,
    super.error,
    super.data,
    this.downloadUrl,
    this.filePath,
  });

  factory FirebaseStorageResult.success({
    String? downloadUrl,
    String? filePath,
  }) {
    return FirebaseStorageResult(
      success: true,
      downloadUrl: downloadUrl,
      filePath: filePath,
    );
  }

  factory FirebaseStorageResult.error(String error) {
    return FirebaseStorageResult(
      success: false,
      error: error,
    );
  }
}

/// Firebase error model
class FirebaseErrorModel {
  final String message;
  final String? code;
  final bool status;

  FirebaseErrorModel({
    required this.message,
    this.code,
    this.status = false,
  });

  factory FirebaseErrorModel.fromJson(Map<String, dynamic> json) {
    return FirebaseErrorModel(
      message: json['message'] ?? 'Something went wrong',
      code: json['code'],
      status: json['status'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'code': code,
      'status': status,
    };
  }
}

// JSON serialization helpers
FirebaseErrorModel firebaseErrorModelFromJson(String str) => 
    FirebaseErrorModel.fromJson(json.decode(str));

String firebaseErrorModelToJson(FirebaseErrorModel data) => 
    json.encode(data.toJson()); 