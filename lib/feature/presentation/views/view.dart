import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:inovolatask/core/shared/CustomColor.dart';
import 'package:inovolatask/core/shared/customFont.dart';
import 'package:inovolatask/core/shared/customWidgets.dart';
import 'package:inovolatask/core/widgets/loadingWidget.dart';
import 'package:inovolatask/feature/presentation/reservation_business_logic/reservationCubit/reservation_cubit.dart';
import 'package:inovolatask/feature/presentation/widgets/widgetData.dart';
import 'package:inovolatask/feature/presentation/widgets/widget_of_error.dart';
import 'package:intl/intl.dart';


class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: _floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ReservationCubit, ReservationState>(
      builder: (context, state) {
        if (state is LoadingGetReservationState) {
          return LoadingWidget();
        } else if (state is SuccessGetReservationState) {
          return ReservationDataWidget(
            reservation: state.reservation,
          );
        } else if (state is ErrorGetReservationState) {
          return ReservationErrorWidget(
            message: state.message,
          );
        }
        return LoadingWidget();
      },
    );
  }

  Widget _floatingActionButton() {
    return  InkWell(
      onTap: () {
        CustomToast(color: Colors.green, message: "تم حجز التذكره");
      },
      child: Container(
        width: double.infinity,
        height: 142.h,
        color: ColorManager.btnColor,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "قم بالحجز الان",
            style: getBoldStyle(
              color: ColorManager.whiteColor,
              fontSize: FontSize.s40.sp,
            ),
          ),
        ),
      ),
    );
  }
}