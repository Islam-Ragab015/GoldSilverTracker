import 'package:flutter_application_1/cubit/states.dart';
import 'package:flutter_application_1/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<States> {
  MainCubit() : super(InitialState());
  static MainCubit get(context) => BlocProvider.of(context);

  double? goldPrice;
  double? silverPrice;
  // get gold price
  getGoldPrice() {
    DioHelper.getData("XAU/EGP").then((value) {
      goldPrice = value.data['price'];
      goldPrice = goldPrice!.roundToDouble();
      // emit state
      emit(GetGoldPriceState());
      // catch error
    }).catchError((e) {
      print(e.toString());
    });
  }

// get silver price
  getSilverPrice() {
    DioHelper.getData("XAG/EGP").then((value) {
      silverPrice = value.data['price'];
      silverPrice = silverPrice!.roundToDouble();

      emit(GetSilverPriceState());
    }).catchError((e) {
      print(e.toString());
    });
  }
}
