import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tilapia_connect/src/styles/buttons.dart';
import 'package:tilapia_connect/src/styles/colors.dart';
import 'package:tilapia_connect/src/styles/containers.dart';
import 'package:tilapia_connect/src/styles/text.dart';

class Balance extends StatelessWidget {
  final double width;
  final bool showBalance;
  final VoidCallback onPressed;
  final Widget balance;
  const Balance({
    required this.width,
    required this.showBalance,
    required this.onPressed,
    required this.balance,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 22,
                child: Text(
                  'R\$',
                  style: textWhite.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              balance,
            ],
          ),
          Container(
            width: 40,
            height: 40,
            decoration: containerWithBorder.copyWith(borderRadius: BorderRadius.circular(50), color: Colors.white),
            child: IconButton(
              iconSize: 23,
              padding: EdgeInsets.zero,
              onPressed: () {
                onPressed();
              },
              icon: Icon(showBalance ? Icons.visibility_off_outlined : Icons.visibility, color: Colors.grey.shade600),
            ),
          )
        ],
      ),
    );
  }
}

class ExtractHome extends StatelessWidget {
  final double width;
  final double height;
  final String trc;
  final String date;
  final String value;
  final String id;
  const ExtractHome({
    required this.width,
    required this.height,
    required this.trc,
    required this.date,
    required this.value,
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/audit', arguments: id);
      },
      style: buttonStyleDefault,
      child: Container(
        height: height * .065,
        decoration: containerWithBorderRadius.copyWith(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade300,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: width * .15,
                height: height * .065,
                decoration: containerWithBorder.copyWith(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: const Offset(5, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: Icon(
                  CupertinoIcons.rectangle_on_rectangle_angled,
                  color: secondaryColor,
                  size: 30,
                )),
            SizedBox(
              width: width * .48,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    trc,
                    maxLines: 1,
                    style: defaultText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  SizedBox(
                    height: height * .003,
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(DateTime.parse(date)),
                    style: defaultText.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   width: width * .18,
            //   height: height * .035,
            //   child: Text(
            //     getCurrency(value),
            //     style: defaultText.copyWith(fontSize: 11.5),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ExtractItem extends StatelessWidget {
  final double width;
  final double height;
  final String trc;
  final String date;
  final String value;
  final String id;
  const ExtractItem({
    required this.width,
    required this.height,
    required this.trc,
    required this.date,
    required this.value,
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/audit', arguments: id);
      },
      style: buttonStyleDefault,
      child: Container(
        height: 60,
        decoration: containerWithBorderRadius.copyWith(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade300,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: width * .15,
                height: 60,
                decoration: containerWithBorder.copyWith(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: const Offset(5, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: Icon(
                  CupertinoIcons.rectangle_on_rectangle_angled,
                  color: secondaryColor,
                  size: 30,
                )),
            SizedBox(
              width: width * .55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    trc,
                    maxLines: 2,
                    style: defaultText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  SizedBox(
                    height: height * .003,
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(DateTime.parse(date)),
                    style: defaultText.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   width: width * .22,
            //   height: height * .035,
            //   child: Text(
            //     getCurrency(value),
            //     style: defaultText.copyWith(fontSize: 13),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class FreightDocumentsItem extends StatelessWidget {
  final String status;
  final double width;
  final double height;
  final String ciot;
  final String date;
  final String id;
  final String reproachReason;
  final ValueNotifier<bool> loading;
  final VoidCallback onPressed;
  const FreightDocumentsItem({
    required this.status,
    required this.width,
    required this.height,
    required this.ciot,
    required this.date,
    required this.id,
    required this.reproachReason,
    required this.loading,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      style: buttonStyleDefault,
      child: Container(
        height: 60,
        decoration: containerWithBorderRadius.copyWith(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade300,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * .16,
              height: 60,
              decoration: containerWithBorder.copyWith(
                color: status == 'Approved'
                    ? Colors.green.shade300
                    : status == 'Reproach'
                        ? Colors.red.shade300
                        : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(5, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  status == 'Approved'
                      ? CupertinoIcons.check_mark_circled
                      : status == 'Reproach'
                          ? CupertinoIcons.xmark_circle
                          : CupertinoIcons.time,
                  color: secondaryColor,
                  size: 35,
                ),
              ),
            ),
            AnimatedBuilder(
              animation: loading,
              builder: (context, _) {
                return loading.value
                    ? SizedBox(
                        width: width * .5,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: secondaryColor,
                                strokeWidth: 1.5,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        width: width * .8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ciot,
                              maxLines: 2,
                              style: defaultText.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            SizedBox(
                              height: height * .003,
                            ),
                            Text(
                              status == 'Approved'
                                  ? 'Aprovado'
                                  : status == 'Reproach'
                                      ? 'Reprovado - $reproachReason'
                                      : 'Pendente',
                              maxLines: 1,
                              style: defaultText.copyWith(
                                fontSize: 13,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SeeFreightDocumentsItem extends StatelessWidget {
  final String status;
  final double width;
  final double height;
  final String ciot;
  final String date;
  final String id;
  const SeeFreightDocumentsItem({
    required this.status,
    required this.width,
    required this.height,
    required this.ciot,
    required this.date,
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: buttonStyleDefault,
      child: Container(
        height: 60,
        decoration: containerWithBorderRadius.copyWith(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade300,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * .16,
              height: 60,
              decoration: containerWithBorder.copyWith(
                color: status == 'Approved' ? Colors.green.shade300 : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(5, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  status == 'Approved' ? CupertinoIcons.check_mark_circled : CupertinoIcons.time,
                  color: secondaryColor,
                  size: 35,
                ),
              ),
            ),
            SizedBox(
                width: width * .8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ciot,
                      maxLines: 2,
                      style: defaultText.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    SizedBox(
                      height: height * .003,
                    ),
                    Text(
                      status == 'Approved' ? 'Aprovado' : 'Pendente',
                      maxLines: 1,
                      style: defaultText.copyWith(
                        fontSize: 13,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class ContainerImagesDocumentsFreight extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final Uint8List image;
  const ContainerImagesDocumentsFreight({
    required this.width,
    required this.height,
    required this.title,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height * .39,
        decoration: containerWithBorder.copyWith(
          color: Colors.grey.shade300,
        ),
        child: TextButton(
          style: buttonStyleDefault,
          onPressed: () {
            final imageProvider = Image.memory(image).image;
            showImageViewer(context, imageProvider, swipeDismissible: true);
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: defaultText.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Center(
                  child: SizedBox(
                    child: Image.memory(
                      image,
                      width: width * 9 - 30,
                      height: height * .3,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class FreightDocumentsCriterion extends StatelessWidget {
  final double width;
  final double height;
  final String criterion;
  final bool image;
  final VoidCallback onPressed;
  const FreightDocumentsCriterion({
    required this.width,
    required this.height,
    required this.criterion,
    required this.image,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      style: buttonStyleDefault,
      child: Container(
        height: 60,
        decoration: containerWithBorderRadius.copyWith(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.withOpacity(.25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * .16,
              height: 60,
              decoration: containerWithBorder.copyWith(
                color: image ? Colors.green.shade300 : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(5, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  CupertinoIcons.camera,
                  color: secondaryColor,
                  size: 33,
                ),
              ),
            ),
            SizedBox(
              width: width * .8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    criterion,
                    maxLines: 2,
                    style: defaultText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
