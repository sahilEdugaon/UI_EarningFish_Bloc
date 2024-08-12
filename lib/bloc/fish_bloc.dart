import 'package:earning_fish_ui/Model/model.dart';
import 'package:earning_fish_ui/bloc/fish_event.dart';
import 'package:earning_fish_ui/bloc/fish_state.dart';
import 'package:earning_fish_ui/utlits/get_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FishBloc extends Bloc<FishEvent, FishState> {
  FishBloc() : super(FishLoadingState()) {
    on<LoadFishData>((event, emit) async {
      emit(FishLoadingState());
      try {
        GetData getRepository = GetData();
        FishDataModel fishDataModel = await getRepository.fetchFish(); // Await the async method
        emit(FishLoaded(fishDataModel));
      } catch (error) {
        emit(FishErrorState("Failed to load fish data"));
      }
    });

    on<BuyFishEvent>((event, emit) async {
      print('call function--BuyFishEvent');
      try {
        // Simulate purchase process
        await Future.delayed(const Duration(seconds: 1));
        emit(FishPurchaseSuccess());
      } catch (error) {
        emit(FishErrorState("Failed to complete purchase"));
      }
    });
  }

}
