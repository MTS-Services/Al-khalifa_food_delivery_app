import 'package:al_khalifa/app/data/app_colors.dart';
import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/modules/order_history/models/my_order_model.dart';
import 'package:al_khalifa/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/order_history_controller.dart';

class OrderHistoryView extends GetView<OrderHistoryController> {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.fetchMyOrders();
        },

        child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text('Order History', style: AppTextStyles.medium18),
                  SizedBox(height: 8.h),
                  Text(
                    'Showing all your order history',
                    style: AppTextStyles.medium14,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Card(
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Active', style: AppTextStyles.medium18),
                        ),
                      ),
                      Spacer(),
                      Card(
                        color: Colors.deepOrangeAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Panding', style: AppTextStyles.medium18),
                        ),
                      ),
                    ],
                  ),
                 Obx((){
                   return  ListView.builder(
                     itemCount: controller.myOrders.length,
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemBuilder: (context, index) {
                       final MyOrderModel order = controller.myOrders[index];
                       if(order.status==controller.orderStatus.value){
                         return  GestureDetector(
                           onTap: (){
                             Get.toNamed(Routes.ORDER,arguments: {"order_details":order});
                           },
                           child: Padding(
                             padding: const EdgeInsets.symmetric(vertical: 8.0),
                             child: Container(
                               width: double.infinity,
                               height: 90,
                               decoration: BoxDecoration(
                                 color: AppColors.greyLightColor,
                                 borderRadius: BorderRadius.circular(8),
                               ),
                               child: Padding(
                                 padding: const EdgeInsets.all(10),
                                 child: Row(
                                   children: [
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text(
                                           '${order.deliveryAddress}',
                                           style: TextStyle(fontSize: 16),
                                         ),
                                         Text(
                                           '${order.updatedAt}',
                                           style: TextStyle(fontSize: 16),
                                         ),
                                       ],
                                     ),
                                     Spacer(),
                                     Column(
                                       children: [
                                         Text(
                                           'Payment',
                                           style: TextStyle(fontSize: 15),
                                         ),
                                         Card(
                                           color: Colors.green,
                                           child: Padding(
                                             padding: const EdgeInsets.all(3.0),
                                             child: Text(
                                               '${order.totalAmount}',
                                               style: AppTextStyles.medium14,
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ),
                         );
                       }else{
                         return SizedBox();
                       }
                     },
                   );
                 })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
