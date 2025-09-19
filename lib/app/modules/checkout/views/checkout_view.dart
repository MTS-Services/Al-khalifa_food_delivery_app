import 'package:al_khalifa/app/modules/checkout/views/payment_method.dart';
import 'package:al_khalifa/app/modules/common/custom_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../data/app_text_styles.dart';
import '../controllers/checkout_controller.dart';
import 'build_show_dialog.dart';


class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout'), centerTitle: true),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double maxBodyWidth = 680.0;
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxBodyWidth),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Delivery Address', style: AppTextStyles.medium18),
                      SizedBox(height: 12.h),
                      TextFormField(
                        controller: controller.addressController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.edit),
                          hintText: 'Alipur',
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 12.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Special Instructions',
                        style: AppTextStyles.medium18,
                      ),
                      SizedBox(height: 12.h),
                      TextFormField(
                        controller: controller.instructionController,
                        minLines: 1,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'enter your full address',
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 12.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text('Payment Method', style: AppTextStyles.medium18),
                      SizedBox(height: 8.h),
                      PaymentMethod(paymentWay: "Cash on Delivery", index: 0),
                      PaymentMethod(paymentWay: "bKash", index: 1),
                      SizedBox(height: 16.h),
                      Text('Order Summary', style: AppTextStyles.medium18),
                      SizedBox(height: 8.h),
                      const CustomList(
                        chargeType: '1x Basmati Kacchi',
                        amount: '300 Tk',
                      ),
                      const CustomList(
                        chargeType: '1x Basmati Kacchi 1:1',
                        amount: '20 Tk',
                      ),
                      SizedBox(height: 8.h),
                      Divider(height: 24.h, thickness: 1),
                      const CustomList(
                        chargeType: 'Subtotal',
                        amount: '520 Tk',
                      ),
                      const CustomList(
                        chargeType: 'Delivery Fee',
                        amount: '20 Tk',
                      ),
                      const CustomList(
                        chargeType: 'Platform fee',
                        amount: '50 Tk',
                      ),
                      const CustomList(chargeType: 'VAT', amount: '0 Tk'),
                      SizedBox(height: 8.h),
                      Divider(height: 24.h, thickness: 1),
                      const CustomList(chargeType: 'Total', amount: '620 Tk'),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        child: 
                        Obx(() => ElevatedButton(
                          onPressed: () {
                            if(controller.selectedIndex>=0){
                              buildShowDialog(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: controller.selectedIndex.value<0 ? Colors.white : null,
                              foregroundColor: controller.selectedIndex.value<0 ? Colors.black : null
                          ),
                          child: Text(
                            'Checkout',
                            style: AppTextStyles.medium18,
                          ),
                        ),)
                      ),
                      SizedBox(height: 8.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}
