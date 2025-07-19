import 'package:bookly_app/constant.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int start = pageNumber * 10;
    int end = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeatureBox);
    int lenth = box.values.length;
    // start =10
    //lenth = 50
    //end =50
    if (start >= lenth || end > lenth) {
      return [];
    }
    return box.values.toList().sublist(start, end);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
