import 'package:coffeeihmproject/constants/colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../holders/current_user.dart';
import '../../../../../widgets/products_widgets/snack_bar.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {super.key,
      required this.text,
      required this.sender,
      this.isImage = false});

  final String text;
  final String sender;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(sender)
            .text
            .subtitle1(context)
            .make()
            .box
            .color(sender == CurrentUser().getUser().name
                ? coffeeCakeColor
                : brownCoffeeColor.withOpacity(0.5))
            .p16
            .rounded
            .alignCenter
            .makeCentered(),
        Expanded(
          child: isImage
              ? Stack(children: [
                  Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03) ,
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: coffeeCakeColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 2,
                              color: blackCoffeeColor,
                              offset: Offset(1, 1))
                        ]),
                    child: Image.network(
                      fit: BoxFit.cover,
                      text,
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress == null
                              ? child
                              : const Center(
                                  child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: CircularProgressIndicator()),
                                ),
                    ),
                  ),

                  IconButton(
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(getSnackBar('Added to Gallery!'));
                        final tempDir = await getTemporaryDirectory();
                        final path = '${tempDir.path}/myfile.jpg';
                        await Dio().download(text, path);
                        await GallerySaver.saveImage(path,
                            albumName: "MyCoffee"); 
                      },
                      icon: const Icon(
                        Icons.download,
                        color: Colors.greenAccent,
                        size: 35,
                      )),

                ])
              : text.trim().text.bodyText1(context).make().px8(),
        ),
      ],
    ).py8();
  }
}
