import 'package:bookly_app/Features/home/data/models/book_models/books_model/books_model.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import '../../../../core/utils/functions.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiServices.get(
        endPoint: 'volumes?q=programming&startIndex=${pageNumber * 10}'); //
    List<BookEntity> books = getBooksList(data);

    saveData(books, kFeatureBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data =
        await apiServices.get(endPoint: 'volumes?q=newest&Sorting=newest');

    List<BookEntity> books = getBooksList(data);
    saveData(books, kNewestBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];

    if (data['items'] != null) {
      for (var bookMap in data['items']) {
        books.add(BooksModel.fromJson(bookMap));
      }
    }

    return books;
  }
}
