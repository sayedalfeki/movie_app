import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class CustomLanguageWidget extends StatelessWidget {
  const CustomLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width:100,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        //color: Colors.red,
          border: Border.all(color: AppColor.appYellowColor),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width:30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50)
              ),
              child: CountryFlag.fromCountryCode('usa',
                shape: Circle(),
              )),
          //SizedBox(width: 10,),
          Container(
            // color: Colors.red,
              width:30,
              height: 30,
              decoration: BoxDecoration(
                //color: Colors.red,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: CountryFlag.fromCountryCode('eg',
                shape: Circle(),
              )),
        ],
      ),
    );
  }
}
