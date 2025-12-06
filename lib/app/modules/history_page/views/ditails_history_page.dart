import 'package:al_khalifa/app/data/app_text_styles.dart';
import 'package:al_khalifa/app/data/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/history_page_controller.dart';
import '../model/payment_history_model.dart';

class DetailsHistoryPage extends StatelessWidget {
  final PaymentHistoryModel paymentHistoryModel;
  const DetailsHistoryPage({super.key, required this.paymentHistoryModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details History'), centerTitle: true),
      body: GetBuilder<HistoryPageController>(
        builder: (detailsController) {
          if(detailsController.detailsHistoryInProgress){
            return Center(child: CircularProgressIndicator(),);
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: detailsController.detailsHistory.value?.orderItems.length,
              itemBuilder: (context, index) {
                final detailsData=detailsController.detailsHistory.value?.orderItems[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order delivered',
                        style: AppTextStyles.bold15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6,vertical:10),
                        child: Container(
                            width: double.infinity,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Colors.grey,
                              image: DecorationImage(
                                image: NetworkImage(detailsData!.food!.foodImageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 4,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8,
                            children: [
                              Text(
                                'Name',
                                style: AppTextStyles.regular12,
                              ),

                              Text(
                                'Description',
                                style: AppTextStyles.regular12,
                              ),
                              Text(
                                'Delivered on',
                                style: AppTextStyles.regular12,
                              ),
                              Text(
                                'Order summary',
                                style: AppTextStyles.regular12,
                              ),
                              Text(
                                'Delivery address',
                                style: AppTextStyles.regular12,
                              ),
                              Text(
                                'Phone Number',
                                style: AppTextStyles.regular12,
                              ),
                              Text(
                                'Total price paid',
                                style: AppTextStyles.regular12,
                              ),
                            ],
                          ),

                          const SizedBox(width: 8,),
                          Expanded(
                            child: Column(
                              spacing: 8,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(detailsData.food!.name, style: AppTextStyles.bold12,),
                                Text(detailsData.food!.description, style: AppTextStyles.bold12,maxLines: 3,overflow: TextOverflow.ellipsis,),
                                Text('${paymentHistoryModel.updatedAt}', style: AppTextStyles.bold12),
                                Text(paymentHistoryModel.trxId,
                                  style: AppTextStyles.bold12,
                                ),
                                Text("${detailsController.detailsHistory.value?.deliveryAddress}", style: AppTextStyles.bold12,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                Text("${detailsController.detailsHistory.value?.phoneNumber}", style: AppTextStyles.bold12,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                Text('৳${paymentHistoryModel.totalAmount}', style: AppTextStyles.bold12),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
