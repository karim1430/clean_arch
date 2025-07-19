import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/core/utils/functions.dart';
import '../../../home/data/models/book_models/books_model/books_model.dart';
import '../../../home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchSearchBook(
      {required String category, int pageNumber = 0});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiServices apiServices;

  SearchRemoteDataSourceImpl(this.apiServices);

  @override
  Future<List<BookEntity>> fetchSearchBook(
      {required String category, int pageNumber = 0}) async {
    var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=$category&orderBy=relevance&startIndex=${pageNumber * 10}');

    List<BookEntity> books = getBooksEntity(data);
    saveData(books, kSearchBox);
    return books;
  }

  List<BookEntity> getBooksEntity(
    Map<String, dynamic> data,
  ) {
    List<BookEntity> books = [];
    if (data['items'] != null) {
      for (var bookMap in data['items']) {
        books.add(BooksModel.fromJson(bookMap));
      }
    }

    return books;
  }
}
