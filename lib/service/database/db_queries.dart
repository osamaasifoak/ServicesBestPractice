import 'package:ecommerce/service/database/db_constant.dart';

class DbQueries {
  static List<String> createTables = [createUserTable];

  static String createUserTable = '''CREATE TABLE ${DbConstant.userTable} (
        ${DbConstant.id} INTEGER PRIMARY KEY,
        ${DbConstant.name} TEXT NOT NULL,
        ${DbConstant.email} TEXT NOT NULL,
        ${DbConstant.phone} TEXT NOT NULL,
        ${DbConstant.password} TEXT NOT NULL,
        ${DbConstant.loggedIn} bit NOT NULL
        )''';
}
