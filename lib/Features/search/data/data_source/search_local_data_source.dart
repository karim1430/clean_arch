import 'package:bookly_app/constant.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../home/domain/entities/book_entity.dart';

abstract class SearchLocalDataSource {
  List<BookEntity> fetchSearchBook(
      {required String category, int pageNumber = 0});
}

class SearchLocalDataSourceImpl extends SearchLocalDataSource {
  @override
  List<BookEntity> fetchSearchBook(
      {required String category, int pageNumber = 0}) {
    final int start = 10 * pageNumber;
    final int end = (pageNumber + 1) * 10;

    var box = Hive.box<BookEntity>(kSearchBox);
    int lenth = box.values.length;
    if (start >= lenth || end > lenth) {
      return [];
    }
    return box.values.toList().sublist(start, end);
  }
}
