import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import '../../../shared/infrastructure/inputs/inputs.dart';

// Como consumir el NotifierProvider
final registerFormProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormState>((ref) {
  return RegisterFormNotifier();
});

// Como implementar el Notifier de Riverpod
class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  RegisterFormNotifier() : super(RegisterFormState());

  onEmailChanged(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([newEmail, state.password]),
    );
  }
  
  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([newPassword, state.email]),
    );
  }

  onNameChanged(String value) {
    final newName = Name.dirty(value);
    state = state.copyWith(
      name: newName,
      isValid: Formz.validate([newName, state.name]),
    );
  }

  onFormSubmit() {
    _touchEveryField();

    if (!state.isValid) return;
    print(state);
  }
  _touchEveryField() {
      final name = Name.dirty(state.name.value);
      final email = Email.dirty(state.email.value);
      final password = Password.dirty(state.password.value);

      state = state.copyWith(
        isFormPosted: true,
        name: name,
        email: email,
        password: password,
        isValid: Formz.validate([name, email, password]),
      );
    }
  
}

class RegisterFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Name name;
  final Email email;
  final Password password;

  RegisterFormState({
    this.isPosting = false, 
    this.isFormPosted = false, 
    this.isValid = false, 
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    });

  RegisterFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Name? name,
    Email? email,
    Password? password,
  }) =>
      RegisterFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
      );
@override
  String toString() {
    return '''
  RegisterFormState:
    isPosting: $isPosting
    isFormPosted: $isFormPosted
    isValid: $isValid
    name: $name
    email: $email
    password: $password
    ''';
  }


}
