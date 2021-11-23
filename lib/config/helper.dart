import 'dart:math';

const double degrees2Radians = pi / 180.0;
const double radians2Degrees = 180.0 / pi;

double degrees(double radians) => radians * radians2Degrees;

double radians(double degrees) =>
    degrees * degrees2Radians; // convert degree to radians
