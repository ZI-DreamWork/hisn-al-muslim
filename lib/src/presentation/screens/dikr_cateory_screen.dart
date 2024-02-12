import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zi_dikr/core/constants/colors.dart';
import 'package:zi_dikr/src/data/models/dikr_category_model.dart';
import 'package:zi_dikr/src/data/models/dikr_model.dart';
import 'package:zi_dikr/src/presentation/cubit/dikr_cubit.dart';

class DikrCategoryScreen extends StatelessWidget {
  const DikrCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/dikr_background.png',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 230, 20, 110),
          child: BlocBuilder<DikrCubit, DikrState>(
            builder: (context, state) {
              if (state is DikrLoaded) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final category = state.dkrCategories[index];
                      return _buildDikrCategory(context, category);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: state.dkrCategories.length);
              } else if (state is DikrLoading) {
                return const Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor),
                );
              }
              return const Center(
                child: Text(
                  'ما تيسر من الذكر',
                  style: TextStyle(fontSize: 30, color: AppColors.primaryColor),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }

  GestureDetector _buildDikrCategory(
      BuildContext context, DikrCategoryModel category) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/adkar',
            arguments: DikrArguments(
                adkar: category.adkar, category: category.category));
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 5),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            category.category,
            textAlign: TextAlign.center,
            style: GoogleFonts.almarai()
                .copyWith(fontSize: 20, color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
