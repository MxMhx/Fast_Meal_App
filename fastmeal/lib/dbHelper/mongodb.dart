import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:fastmeal/dbHelper/constant.dart';
import 'package:fastmeal/dbHelper/MongoDBModel.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }

  //Function for button click to call insert Data
  static Future<String> insert(Welcome data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if(result.isSuccess){
        return "Data Inserted";
      } else {
        return "Something Wrong";
      }
      return result;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
