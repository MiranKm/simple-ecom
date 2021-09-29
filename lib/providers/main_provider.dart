import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:iqapp/models/model_holder.dart';
import 'package:iqapp/services/base_service.dart';
import 'package:iqapp/util/request_wrapper.dart';

class MainProvider extends ChangeNotifier {
  final BaseService _baseService;
  RequestWrapper<List<ModelHolder>> modelHolder = RequestWrapper.idle();

  MainProvider(this._baseService);

  Future<void> getAllData() async {
    modelHolder = RequestWrapper.loading();

    try {
      var res = await _baseService.getAllData();

      if (res.isOk) {
        modelHolder = RequestWrapper.success(modelHolderFromMap(res.data));
        notifyListeners();
      }else{
        modelHolder = RequestWrapper.error("error getting data");
        notifyListeners();

      }
    } on DioError catch (e) {
      print(e);
      modelHolder = RequestWrapper.error(e.message);
      notifyListeners();
    }
  }



  /*
  *
  *
  * I'm not sure why the API returns a list of object where it can be one object and this method would have been necessary
  *
  * I could have looped over this on the Home page but didn't since it would have been a mess
  * */
  Section getSection(int index,String sectionType){
    return modelHolder.data[index].sections.firstWhere((element) => element.sectionType==sectionType);
  }



}

extension OnRequest on Response {
  bool get isOk {
    return this.statusCode == 200;
  }
}
