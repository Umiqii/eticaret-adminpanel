
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/product/product_images_controller.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../models/product_model.dart';

class DragAndDropWidget extends StatelessWidget {
  DragAndDropWidget({Key? key, required this.product}) : super(key: key);

  final ProductModel product;
  final ProductImagesController controller = Get.put(ProductImagesController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 300,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        TImages.defaultMultiImageIcon,
                        width: 50,
                        height: 50,
                      ),
                      const Text('Drag and Drop Images here'),
                    ],
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: Row(
            //     children: [
            //       Expanded(
            //           flex: 2,
            //           child: SizedBox(
            //               height: 80,
            //               child: controller.additionalProductImagesToDisplay.isNotEmpty || controller.additionalProductImagesUrls.isNotEmpty
            //                   ? _uploadedImages()
            //                   : emptyList())),
            //       const SizedBox(width: TSizes.spaceBtwItems / 2),
            //       TRoundedContainer(
            //         width: 80,
            //         height: 80,
            //         showBorder: true,
            //         borderColor: TColors.grey,
            //         backgroundColor: TColors.white,
            //         onTap: () async {
            //           final files = await controller.dropzoneController.pickFiles(mime: ['image/jpeg', 'image/png'], multiple: true);
            //           // Handle the tapped files
            //           files.forEach((file) async {
            //             if (file is html.File) {
            //               print('Tapped file: ${file.name}');
            //               controller.additionalProductImagesToStore.add(file);
            //               final bytes = await controller.dropzoneController.getFileData(file);
            //               controller.additionalProductImagesToDisplay.add(Uint8List.fromList(bytes));
            //             }
            //           });
            //         },
            //         child: const Center(child: Icon(Iconsax.add)),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget emptyList() {
    return ListView.separated(
      itemCount: 6,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems / 2),
      itemBuilder: (context, index) => const TRoundedContainer(backgroundColor: TColors.primaryBackground, width: 80, height: 80),
    );
  }

  // ListView _uploadedImages() {
  //   return ListView.separated(
  //     scrollDirection: Axis.horizontal,
  //     itemCount: controller.additionalProductImagesUrls.length + controller.additionalProductImagesToDisplay.length,
  //     separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems / 2),
  //     itemBuilder: (context, index) {
  //       if (controller.additionalProductImagesUrls.isNotEmpty && index < controller.additionalProductImagesUrls.length) {
  //         // Show Image URL
  //         final image = controller.additionalProductImagesUrls[index];
  //         return TImageUploader(
  //           top: 0,
  //           right: 0,
  //           width: 80,
  //           height: 80,
  //           left: null,
  //           bottom: null,
  //           image: image,
  //           icon: Iconsax.trash,
  //           imageType: ImageType.network,
  //           onIconButtonPressed: () => controller.removeCloudImage(image, product),
  //         );
  //       } else {
  //         // Show Local Image
  //         final localIndex = index - controller.additionalProductImagesUrls.length;
  //         final image = controller.additionalProductImagesToDisplay[localIndex];
  //         return TImageUploader(
  //           top: 0,
  //           right: 0,
  //           width: 80,
  //           height: 80,
  //           left: null,
  //           bottom: null,
  //           memoryImage: image,
  //           icon: Iconsax.trash,
  //           imageType: ImageType.memory,
  //           onIconButtonPressed: () => controller.removeImage(localIndex),
  //         );
  //       }
  //     },
  //   );
  // }
}
