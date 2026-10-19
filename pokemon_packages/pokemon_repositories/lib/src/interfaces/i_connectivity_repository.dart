//This is being ignored because connectivity is a bool
// ignore_for_file: one_member_abstracts

import 'package:fpdart/fpdart.dart';
import 'package:pokemon_core/pokemon_core.dart';

abstract interface class IConnectivityRepository {
  Stream<Either<Failure, bool>> getConnectivityStatus();
}
