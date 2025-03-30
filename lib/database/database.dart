import "dart:io";
import "package:animations/database/model.dart";
import "package:path_provider/path_provider.dart";
import "package:sqflite/sqflite.dart";
import 'package:path/path.dart';

class DatabaseManager {
  static Database? _database;
  static String databaseName = "animationUrls";

  static final String _tableName = "animationData";
  static final String _colId = "id";
  static final String _colUrl = "url";

  static Future<Database> get database async {
    _database ??= await _createDb();

    return _database!;
  }

  static Future<Database> _createDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, databaseName);

    Database db = await openDatabase(path, version: 1, onCreate: _initializeDb);

    return db;
  }

  static Future<void> _initializeDb(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $_tableName($_colId INTEGER PRIMARY KEY AUTOINCREMENT, $_colUrl TEXT)",
    );
  }

  static addAnimation(String url) async {
    final db = await database;

    // try {
    int id = await db.insert(_tableName, {"url": url});
    // ignore: avoid_print
    print("animation added ai $id");

    return id;
    // } catch (e) {
    //   // ignore: avoid_print
    //   print("can't add animation");
    //   return -1;
    // }
  }

  static Future<List<AnimationData>> getAnimationList() async {
    final db = await database;

    List<Map<String, dynamic>> jsonList = await db.query(_tableName);
    List<AnimationData> animationList =
        jsonList.map((json) => AnimationData.fromJson(json)).toList();

    // ignore: avoid_print
    print("animation fetched!");

    return animationList;
  }

  static Future<void> deleteAnimation(int id) async {
    final db = await database;

    db.delete(_tableName, where: "id = ?", whereArgs: [id]);

    print("animation at $id deleted");
  }

  static Future<void> clearAnimationList() async {
    final db = await database;

    List<Map<String, dynamic>> jsonList = await db.query(_tableName);
    List<AnimationData> animationList =
        jsonList.map((json) => AnimationData.fromJson(json)).toList();

    for (var data in animationList) {
      db.delete(_tableName, where: "id = ?", whereArgs: [data.id]);
      print("animation at ${data.id} deleted");
    }
  }

  static Future<void> deleteDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, databaseName);

    await deleteDatabase(path);

    print("Database deleted successfully!");
  }
}
