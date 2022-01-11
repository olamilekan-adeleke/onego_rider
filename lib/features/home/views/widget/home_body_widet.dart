import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onego_rider/cores/components/custom_button.dart';
import 'package:onego_rider/cores/components/custom_text_widget.dart';

import 'package:onego_rider/features/home/views/widget/home_header_widget.dart';
import '../../../../cores/utils/sizer_utils.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: sizerHeight(90),
        child: Padding(
          padding: EdgeInsets.all(sizerSp(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: sizerSp(15.0)),
              const HomeHeaderWidget(),
              SizedBox(height: sizerSp(40.0)),
              Center(
                child: SvgPicture.asset(
                  'assets/images/bus_stop.svg',
                  height: sizerSp(100),
                  width: sizerSp(150),
                ),
              ),
              SizedBox(height: sizerSp(40.0)),
              CustomTextWidget(
                'At the terminal and ready to pick-up passengers?',
                fontWeight: FontWeight.w600,
                fontSize: sizerSp(17),
                textAlign: TextAlign.center,
              ),
              CustomTextWidget(
                'At the terminal and ready to pick-up passengers?',
                fontWeight: FontWeight.w300,
                fontSize: sizerSp(14),
              ),
              const Spacer(),
              CustomButton(text: 'Pick Up', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
