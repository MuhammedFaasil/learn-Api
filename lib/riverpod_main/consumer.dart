import 'package:flutter_riverpod/flutter_riverpod.dart';

// final counterApp = Provider<String>((ref) => 'Hello world');
final counterApp = StateProvider<int>((ref) => 0);
