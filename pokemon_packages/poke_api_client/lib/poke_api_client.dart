/// Barrel file allowing pokeon raw models to access data
/// inaccessible to other packages outside of poke_api_client
/// creates separation of the raw data layer and the domain layer,
/// allowing for better maintainability and scalability
library;

export 'src/dio/poke_dio.dart';
export 'src/models/raw_type_details_dto/damage_relations.dart';
export 'src/models/raw_type_details_dto/double_damage_from.dart';
export 'src/models/raw_type_details_dto/double_damage_to.dart';
export 'src/models/raw_type_details_dto/raw_type_details_dto.dart';
export 'src/poke_api_client.dart';
export 'src/services/injectable.dart';
export 'src/services/injectable.module.dart';
