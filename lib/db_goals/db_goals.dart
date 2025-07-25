
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:set_goals/db_goals/goals_entity.dart';
import 'package:sqflite/sqflite.dart';

class DBGoals extends GetxService {
  late Database dbBase;

  Future<DBGoals> init() async {
    await createGoalsDB();
    return this;
  }

  createGoalsDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'goals.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createGoalsTable(db);
        });
  }

  createGoalsTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS goals (id INTEGER PRIMARY KEY, createdTime TEXT, name TEXT, setTime INTEGER, actualTime INTEGER)');
  }

  insertGoals(GoalsEntity entity) async {
    final id = await dbBase.insert('goals', {
      'createdTime': entity.createdTime.toIso8601String(),
      'name': entity.name,
      'setTime': entity.setTime,
      'actualTime': entity.actualTime,
    });
    return id;
  }

  cleanAllData() async {
    await dbBase.delete('goals');

  }

  Future<List<GoalsEntity>> getGoalsAllData() async {
    var result = await dbBase.query('goals', orderBy: 'createdTime DESC');
    return result.map((e) => GoalsEntity.fromJson(e)).toList();
  }

}
