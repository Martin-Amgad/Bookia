import 'dart:developer';
import 'package:bookia/feature/home/data/models/book_list_rsponse/book_list_rsponse.dart';
import 'package:bookia/feature/home/data/models/book_list_rsponse/product.dart';
import 'package:bookia/feature/home/data/models/slider_response/slider.dart';
import 'package:bookia/feature/home/data/models/slider_response/slider_response.dart';
import 'package:bookia/feature/home/data/repo/home_repo.dart';
import 'package:bookia/feature/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(Homeinit());

  List<Product> BestSellers = [];
  List<Product> NewArrivals = [];
  List<Product> AllBooks = [];
  List<SliderModal> sliders = [];

  void getHomeData() async {
    emit(HomeLoadingState());

    try {
      var res = await Future.wait([
        HomeRepo.getSlider(),
        HomeRepo.getBestSellers(),
        HomeRepo.getNewArrivals(),
        HomeRepo.getAllBooks(),
      ]);

      sliders = (res[0] as SliderResponse).data?.sliders ?? [];
      BestSellers = (res[1] as BookListRsponse).data?.products ?? [];
      NewArrivals = (res[2] as BookListRsponse).data?.products ?? [];
      AllBooks = (res[3] as BookListRsponse).data?.products ?? [];
      emit(HomeSuccesState());
    } on Exception catch (e) {
      log(e.toString());
      emit(HomeErrorState(message: e.toString()));
    }
  }
}
