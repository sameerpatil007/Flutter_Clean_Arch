import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../cubits/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, 1),
        child: SingleChildScrollView(
          child: Card(
            color: Theme.of(context).cardColor,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              // decoration: const BoxDecoration(
              //     color: Colors.transparent,
              //     borderRadius: BorderRadius.horizontal(left: Radius.circular(18.0), right: Radius.circular(18.0))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  _EmailInput(),
                  const SizedBox(height: 18),
                  _PasswordInput(),
                  Align(alignment: Alignment.centerLeft, child: _ResendOtpButton()),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _CancelButton(),
                      _LoginButton(),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _SignUpButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          textCapitalization: TextCapitalization.none,
          // style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'user.email@domain.com',
            errorText: state.email.invalid ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.otp != current.otp,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) => context.read<LoginCubit>().otpChanged(password),
          obscureText: true,
          keyboardType: TextInputType.number,
          maxLength: 6,
          // style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: 'OTP',
            helperText: 'OTP sent to registered email and mobile number',
            errorText: state.otp.invalid ? 'invalid OTP' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: state.status.isValidated ? () => context.read<LoginCubit>().authenticateUser() : null,
                child: const Text('Submit'),
              );
      },
    );
  }
}

class _ResendOtpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('loginForm_resendOtp_textButton'),
      // onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
      onPressed: () {},
      child: const Text('Resend OTP'),
    );
  }
}

class _CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: const Key('loginForm_cancelButton_outlinedButton'),
      style: OutlinedButton.styleFrom(foregroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
      // onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
      onPressed: () {},
      child: const Text('Cancel'),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('loginForm_createAccount_textButton'),
      // onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
      onPressed: () {},
      child: const Text('New user? Register Now'),
    );
  }
}
