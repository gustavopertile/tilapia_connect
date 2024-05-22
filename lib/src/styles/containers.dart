import 'package:flutter/material.dart';

import 'colors.dart';

const BoxDecoration containerModal = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
);

final BoxDecoration containerWithOrangeBorder = BoxDecoration(
  border: Border.all(
    color: primaryColor,
  ),
  borderRadius: BorderRadius.circular(10),
);

final BoxDecoration containerWithBorder = BoxDecoration(
  border: Border.all(
    color: Colors.white,
  ),
  borderRadius: BorderRadius.circular(10),
);

final BoxDecoration containerWithBorderRadius = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
);
