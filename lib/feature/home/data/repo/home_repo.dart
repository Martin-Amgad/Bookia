import 'dart:developer';

import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/feature/home/data/models/book_list_rsponse/book_list_rsponse.dart';
import 'package:bookia/feature/home/data/models/slider_response/slider_response.dart';

class HomeRepo {
  static Future<BookListRsponse?> getBestSellers() async {
    try {
      var res = await DioProvider.get(endpoint: ApiEndpoints.best_seller);

      if (res.statusCode == 200) {
        return BookListRsponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<BookListRsponse?> getNewArrivals() async {
    try {
      var res = await DioProvider.get(endpoint: ApiEndpoints.new_arrivals);

      if (res.statusCode == 200) {
        return BookListRsponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<BookListRsponse?> getAllBooks([int pageIndex = 1]) async {
    try {
      var res = await DioProvider.get(
        endpoint: ApiEndpoints.all_products,
        queryParameters: {'page': pageIndex},
      );

      if (res.statusCode == 200) {
        return BookListRsponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<SliderResponse?> getSlider() async {
    try {
      var res = await DioProvider.get(endpoint: ApiEndpoints.slider);

      if (res.statusCode == 200) {
        return SliderResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
