import 'package:flutter/material.dart';

/* TextStyle */
// heading
const TextStyle h1 = TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
const TextStyle h2 = TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
const TextStyle h3 = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
const TextStyle h4 = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
const TextStyle h5 = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
const TextStyle h6 = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
// body
const TextStyle b1 = TextStyle(fontSize: 18, fontWeight: FontWeight.normal);
const TextStyle b2 = TextStyle(fontSize: 16, fontWeight: FontWeight.normal);
const TextStyle b3 = TextStyle(fontSize: 14, fontWeight: FontWeight.normal);
const TextStyle b4 = TextStyle(fontSize: 12, fontWeight: FontWeight.normal);
const TextStyle b5 = TextStyle(fontSize: 11, fontWeight: FontWeight.normal);
const TextStyle b6 = TextStyle(fontSize: 10, fontWeight: FontWeight.normal);

/* SizedBox */
// height
const SizedBox sbh32 = SizedBox(height: 32);
const SizedBox sbh24 = SizedBox(height: 24);
const SizedBox sbh20 = SizedBox(height: 20);
const SizedBox sbh16 = SizedBox(height: 16);
const SizedBox sbh12 = SizedBox(height: 12);
const SizedBox sbh8 = SizedBox(height: 8);
const SizedBox sbh4 = SizedBox(height: 4);
// width
const SizedBox sbw4 = SizedBox(width: 4);
const SizedBox sbw8 = SizedBox(width: 8);
const SizedBox sbw12 = SizedBox(width: 12);
const SizedBox sbw16 = SizedBox(width: 16);
const SizedBox sbw20 = SizedBox(width: 20);
const SizedBox sbw24 = SizedBox(width: 24);
const SizedBox sbw32 = SizedBox(width: 32);

TextStyle? largeTitle(BuildContext context) => Theme.of(context).textTheme.titleLarge;
TextStyle? mediumTitle(BuildContext context) => Theme.of(context).textTheme.titleMedium;

const Color themeColor = Colors.amber;