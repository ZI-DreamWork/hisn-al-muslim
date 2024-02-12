import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zi_dikr/core/constants/colors.dart';
import 'package:zi_dikr/src/data/models/dikr_model.dart';

class AdkarScreen extends StatelessWidget {
  const AdkarScreen({required this.adkar, required this.category, super.key});
  final List<DikrModel> adkar;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/detail_background.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 30,
          left: 30,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(3),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.black)),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 150, 20, 110),
          child: Column(
            children: [
              _buildCategoryTitle(category),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final dikr = adkar[index];
                      return Text(
                        dikr.text,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.almarai().copyWith(
                            color: AppColors.primaryColor, fontSize: 20),
                        // style: GoogleFonts.amiri()
                        //     .copyWith(fontSize: 25, color: AppColors.primaryColor),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return _buildDiveder();
                    },
                    itemCount: adkar.length),
              ),
            ],
          ),
        )
      ]),
    );
  }

  Widget _buildDiveder() {
    return SizedBox(
      // width: 200,
      height: 60,
      child: Image.asset(
        'assets/images/divider.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildCategoryTitle(String category) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 5),
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          category,
          textAlign: TextAlign.center,
          style: GoogleFonts.almarai()
              .copyWith(fontSize: 20, color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
