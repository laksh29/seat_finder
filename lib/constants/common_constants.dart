import 'package:flutter/material.dart';

import 'color_constants.dart';

//* build some empty space in column
SizedBox buildHeight(double height) => SizedBox(height: height);

//* build some empty space in row
SizedBox buildWidth(double width) => SizedBox(width: width);

//* snackbar to display
SnackBar displaySnackbar(String message) {
  return SnackBar(
    content: Text(
      message,
      style: TextStyle(color: ColorConstants.light),
    ),
    backgroundColor: ColorConstants.dark,
  );
}
