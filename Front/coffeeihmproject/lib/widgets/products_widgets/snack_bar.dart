import 'package:flutter/material.dart';

SnackBar getSnackBar(String text) =>  SnackBar(
            content: Text(text),
            action: SnackBarAction(
              label: 'ok',
              onPressed: () {},));