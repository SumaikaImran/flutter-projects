class FirebaseRoutes {
  /// Firebase project configuration
  static const String projectId = 'phone-eats-first';
  
  /// Firestore collections
  static const String usersCollection = 'users';
  static const String restaurantsCollection = 'restaurants';
  static const String ordersCollection = 'orders';
  static const String menuItemsCollection = 'menu_items';
  static const String categoriesCollection = 'categories';
  static const String reviewsCollection = 'reviews';
  static const String paymentsCollection = 'payments';
  static const String notificationsCollection = 'notifications';
  
  /// Storage paths
  static const String profileImagesPath = 'profile_images';
  static const String restaurantImagesPath = 'restaurant_images';
  static const String menuItemImagesPath = 'menu_item_images';
  static const String orderImagesPath = 'order_images';
  static const String reviewImagesPath = 'review_images';
  
  /// Authentication methods
  static const String emailPasswordAuth = 'email_password';
  static const String googleAuth = 'google';
  static const String appleAuth = 'apple';
  static const String phoneAuth = 'phone';
  
  /// Default storage bucket
  static const String defaultStorageBucket = 'phone-eats-first.appspot.com';
  
  /// Firestore indexes (for reference)
  static const List<String> requiredIndexes = [
    'users_email_asc',
    'restaurants_location_asc',
    'orders_userId_createdAt_desc',
    'menuItems_restaurantId_categoryId_asc',
    'reviews_restaurantId_rating_desc',
  ];
} 