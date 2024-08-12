
import 'package:earning_fish_ui/Model/model.dart';
import 'package:flutter/material.dart';

abstract class FishState{}

class FishLoadingState extends FishState{}
class FishLoaded extends FishState{
  final FishDataModel getFishData;
  FishLoaded(this.getFishData);
}
class FishErrorState extends FishState{
  final String error;
  FishErrorState(this.error);
}

class FishPurchaseSuccess extends FishState {}
