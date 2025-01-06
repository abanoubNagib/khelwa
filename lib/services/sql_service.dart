// import 'package:khelwa/services/base_sql_service.dart';
// import 'package:logging/logging.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// final class SqlService implements BaseSqlService {
//   late final Database database;
//   late final Logger _log;

//   @override
//   Future<void> initializeSqlService() async {
//     _log = Logger('SqlService');
//     final String databasePath = await getDatabasesPath();
//     database = await openDatabase(
//       join(databasePath, 'khelwa.db'),
//       version: 1,
//       onOpen: (db) async {
//         _log.config('[SqlService] - opened 🍉');
//         // print all tables
//         final List<Map<String, Object?>> tables = await db
//             .query('sqlite_master', where: 'type = ?', whereArgs: ['table']);
//         for (final Map<String, Object?> table in tables) {
//           _log.config('[SqlService] - table: ${table['name']}');
//         }
//       },
//       onCreate: (Database db, int version) async {
//         await createTable(db, 'locations', [
//           'id INTEGER PRIMARY KEY AUTOINCREMENT',
//           'placeId TEXT UNIQUE NOT NULL',
//           'name TEXT NOT NULL',
//           'lat REAL NOT NULL',
//           'log REAL NOT NULL',
//         ]);
//         _log.config('[SqlService] - created 🍉');
//       },
//     );
//   }

//   Future<void> createTable(
//       Database db, String tableName, List<String> columns) async {
//     final String columnsString = columns.join(', ');
//     await db.execute('CREATE TABLE $tableName ($columnsString)');
//   }
// }
