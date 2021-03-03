import 'dart:async';
import 'package:music_app/src/utils/app_utils.dart';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (String data, EventSink<String> sink) {
    if (!data.isValidEmail()) {
      sink.addError('Email no válido');
    } else {
      sink.add(data);
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (!data.isValidPassword()) {
        int requiredCharacters = 8 - data.length;
        String errorText = requiredCharacters > 1
            ? 'Faltan $requiredCharacters caracteres'
            : 'Falta $requiredCharacters caracter';
        sink.addError(errorText);
      } else {
        sink.add(data);
      }
    },
  );

  final validateUsername = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.isEmpty || data == null) {
        sink.addError('Campo requerido');
      } else {
        sink.add(data);
      }
    },
  );

  StreamTransformer<String, String> equals(String str) {
    return StreamTransformer<String, String>.fromHandlers(
      handleData: (data, sink) {
        if (data == str) {
          sink.addError('Campo repetido');
        } else {
          sink.add(str);
        }
      },
    );
  }
}
