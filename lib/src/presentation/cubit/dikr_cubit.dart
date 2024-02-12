import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:zi_dikr/src/data/models/dikr_category_model.dart';

part 'dikr_state.dart';

class DikrCubit extends Cubit<DikrState> {
  DikrCubit() : super(DikrInitial());

  Future loadAdkar() async {
    emit(DikrLoading());

    // final dikrString =
    final dikrString = await rootBundle.loadString('assets/data/adhkar.json');
    final List<dynamic> adkarJson = jsonDecode(dikrString);
    final adkar = adkarJson.map((e) => DikrCategoryModel.fromJson(e)).toList();

    emit(DikrLoaded(dkrCategories: adkar));
  }
}
