import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_1/services/api_services.dart';

final providersGetScope = FutureProvider((ref) => UserApiServices.getUsers());
