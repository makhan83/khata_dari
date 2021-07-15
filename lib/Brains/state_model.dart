import 'dart:ui';
class StateName {
  const StateName({
    required this.stateName,
  });

  final String stateName;

  @override
  String toString() {
    return '$stateName';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is StateName && other.stateName == stateName ;
  }

  @override
  int get hashCode => hashValues(stateName,'');
}

