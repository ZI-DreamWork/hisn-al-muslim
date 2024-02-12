part of 'dikr_cubit.dart';

@immutable
class DikrState {}

class DikrInitial extends DikrState {}

class DikrLoading extends DikrState {}

class DikrLoaded extends DikrState {
  final List<DikrCategoryModel> dkrCategories;

  DikrLoaded({required this.dkrCategories});
}
