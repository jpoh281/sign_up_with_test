import 'package:dartz/dartz.dart';
import 'package:sign_up_with_test/error.dart';
import 'package:sign_up_with_test/validation_use_cases/validation_use_case.dart';

class PhoneValidationUseCase implements ValidationUseCase {
  @override
  Either<List<ValidateFailure>, String> call(String phone) {
    RegExp regExp = RegExp('^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})');
    List<ValidateFailure> failureList = [];
    if (regExp.hasMatch(phone)) {
      return Right(phone);
    } else {
      failureList.add(PhoneValidationFailure(phone));
      return Left(failureList);
    }
  }
}
