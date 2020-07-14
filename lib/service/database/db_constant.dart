class DbConstant {
  static int _dbVersion = 1;
  static String _dbName = "Servaid";

  static String id = 'id';
  static String userTable = "USER";
  static String name = "name";
  static String email = "email";
  static String phone = "phone";
  static String password = "password";
  static String loggedIn = "loggedIn";

  static int get getVersion => _dbVersion;
  static String get getDbName => _dbName;
}
