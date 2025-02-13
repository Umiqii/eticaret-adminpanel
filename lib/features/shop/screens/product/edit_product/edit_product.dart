import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../../controllers/product/edit_product_controller.dart';
import 'responsive_screens/edit_product_desktop.dart';
import 'responsive_screens/edit_product_mobile.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProductController());
    final product = Get.arguments;
    controller.initProductData(product);
    return TSiteTemplate(desktop: EditProductDesktopScreen(product: product), mobile: EditProductMobileScreen(product: product));
  }
}
