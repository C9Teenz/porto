import 'package:equatable/equatable.dart';

class UserModels extends Equatable {
  final String id;
  final String name;
  final String email;
  final String hobby;
  final int balance;

  const UserModels({
    required this.id,
    required this.email,
    required this.name,
    this.hobby = '',
    this.balance = 0,
  });
  @override
  List<Object?> get props => [id, name, email, hobby, balance];
}
