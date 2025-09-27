import 'dart:developer';

import 'package:bookia/core/services/api/api_endpoints.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/feature/wishlist/data/wishlist_response/wishlist_response.dart';

class WishlistRepo {
  static addToWishlist() {}
  static removeFromWishlist() {}
  static Future<WishlistResponse?> getWishlist() async {
    try {
      var res = await DioProvider.get(
        endpoint: ApiEndpoints.show_wishlist,
        headers: {
          'Authorization': 'Bearer ${LocalHelper.getUserData()?.token}',
        },
      );

      if (res.statusCode == 200) {
        return WishlistResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
