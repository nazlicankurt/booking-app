import 'package:dartz/dartz.dart';
import 'package:flutter_booking_app/core/errors/failure.dart';


typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;
