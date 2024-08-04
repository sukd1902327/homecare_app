// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_care_app/models/getModel.dart';
import '../booking/bookService.dart';
import '/widgets/button.dart';
import '/widgets/serviceDetails.dart';

class MinorSurgeryPage extends StatelessWidget {
  const MinorSurgeryPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsModel controller = Get.find();
    String name = controller.itemsList[2][0];
    double price = controller.itemsList[2][2];
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(elevation: 0, title: const Text('جراحة صغرى')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.25,
              child: const Image(
                image: AssetImage('assets/images/surgery-ill.png')
              ),
            ),
            SizedBox(
              height: height * 0.45,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ServiceDetails(
                        headText: 'أسم الخدمة',
                        text: name,
                      ),
                      SizedBox(height: height * 0.02,),
                      ServiceDetails(
                        headText: 'الوصف',
                        text: 'هذه الخدمة تشمل:\nتصفية الجروح والحروق الصغيرة وخياطة الجروح',
                      ),
                      SizedBox(height: height * 0.02,),
                      ServiceDetails(
                        headText: 'التكلفة',
                        text: '$price ريال ',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Button(
              text: 'طلب الخدمة', 
              onPressed: () => Get.to(() => BookService(
                serviceName: name,
                servicePrice: price,
              ))
            ),
          ],
        ),
      ),
    );
  }
}