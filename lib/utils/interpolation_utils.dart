import 'package:equations/equations.dart';

class InterpolationUtils {
  InterpolationUtils._();

  ///[interpolationPoints] - количество точек интерполяции, добавляемых между двумя соседними
  ///точками в исходном наборе значений [input].
  ///Если [paddingValue] != null, то к интерполированному результату будут добавлены точки
  ///f(input[0] - paddingValue) и f(input.last + paddingValue).
  static List<double> getInterpolatedValues(
      {required List<double> input,
      required int interpolationPoints,
      double? paddingValue}) {
    final polynomial = _getPolyInterpolation(input);
    final result =
        _calculateInterpolatedPoints(polynomial, input, interpolationPoints);

    if (paddingValue != null) {
      result.insert(0, polynomial.compute(-paddingValue));
      result.add(polynomial.compute(input.length - 1 + paddingValue));
    }
    return result;
  }

  static Interpolation _getPolyInterpolation(List<double> input) {
    final nodes = <InterpolationNode>[];
    for (int i = 0; i < input.length; i++) {
      nodes.add(InterpolationNode(x: i.toDouble(), y: input[i]));
    }

    return PolynomialInterpolation(nodes: nodes);
  }

  static List<double> _calculateInterpolatedPoints(Interpolation interpolation,
      List<double> input, int interpolationPoints) {
    final result = <double>[];

    for (int i = 0; i < input.length - 1; i++) {
      result.add(input[i]);
      for (int j = 1; j <= interpolationPoints; j++) {
        result.add(interpolation.compute(i + j / (interpolationPoints + 1)));
      }
    }
    result.add(input[input.length - 1]);

    return result;
  }
}
