
import 'package:earning_fish_ui/Model/model.dart';
import 'package:earning_fish_ui/utlits/json_data.dart';

class GetData{

 fetchFish() async {
    try{
      final fishData  = FishDataModel.fromJson(FishJsonData().jsonData);
      print('fishData-$fishData');
      return fishData;
    }
    catch(e){
      throw e;
    }
  }


}