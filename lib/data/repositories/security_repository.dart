import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Local PIN patterns (not production auth).
///
/// Uses SharedPreferences instead of flutter_secure_storage so the app builds
/// on Windows without the Visual Studio ATL (`atlstr.h`) dependency that
/// flutter_secure_storage_windows requires. PIN is still SHA-256 hashed.
class SecurityRepository {
  SecurityRepository({SharedPreferences? prefs}) : _prefsOverride = prefs;

  final SharedPreferences? _prefsOverride;
  static const _pinKey = 'mofobank_pin_hash';
  static const _saltKey = 'mofobank_pin_salt';

  Future<SharedPreferences> get _prefs async =>
      _prefsOverride ?? SharedPreferences.getInstance();

  Future<bool> hasPin() async {
    final prefs = await _prefs;
    final hash = prefs.getString(_pinKey);
    return hash != null && hash.isNotEmpty;
  }

  Future<void> setPin(String pin) async {
    final prefs = await _prefs;
    final salt = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _hash(pin, salt);
    await prefs.setString(_saltKey, salt);
    await prefs.setString(_pinKey, hash);
  }

  Future<bool> verifyPin(String pin) async {
    final prefs = await _prefs;
    final salt = prefs.getString(_saltKey);
    final hash = prefs.getString(_pinKey);
    if (salt == null || hash == null) {
      return false;
    }
    return _hash(pin, salt) == hash;
  }

  Future<void> clearPin() async {
    final prefs = await _prefs;
    await prefs.remove(_pinKey);
    await prefs.remove(_saltKey);
  }

  String _hash(String pin, String salt) {
    final bytes = utf8.encode('$salt::$pin::mofobank');
    return sha256.convert(bytes).toString();
  }
}
