// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProfilesTable extends Profiles with TableInfo<$ProfilesTable, Profile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Learner'),
  );
  static const VerificationMeta _handleMeta = const VerificationMeta('handle');
  @override
  late final GeneratedColumn<String> handle = GeneratedColumn<String>(
    'handle',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('learner'),
  );
  static const VerificationMeta _homeMarketIdMeta = const VerificationMeta(
    'homeMarketId',
  );
  @override
  late final GeneratedColumn<String> homeMarketId = GeneratedColumn<String>(
    'home_market_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _xpMeta = const VerificationMeta('xp');
  @override
  late final GeneratedColumn<int> xp = GeneratedColumn<int>(
    'xp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _boostSpendMinorMeta = const VerificationMeta(
    'boostSpendMinor',
  );
  @override
  late final GeneratedColumn<int> boostSpendMinor = GeneratedColumn<int>(
    'boost_spend_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _accuracySumMeta = const VerificationMeta(
    'accuracySum',
  );
  @override
  late final GeneratedColumn<double> accuracySum = GeneratedColumn<double>(
    'accuracy_sum',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _accuracyCountMeta = const VerificationMeta(
    'accuracyCount',
  );
  @override
  late final GeneratedColumn<int> accuracyCount = GeneratedColumn<int>(
    'accuracy_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _onboardedMeta = const VerificationMeta(
    'onboarded',
  );
  @override
  late final GeneratedColumn<bool> onboarded = GeneratedColumn<bool>(
    'onboarded',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("onboarded" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _hintsOwnedMeta = const VerificationMeta(
    'hintsOwned',
  );
  @override
  late final GeneratedColumn<int> hintsOwned = GeneratedColumn<int>(
    'hints_owned',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _retriesOwnedMeta = const VerificationMeta(
    'retriesOwned',
  );
  @override
  late final GeneratedColumn<int> retriesOwned = GeneratedColumn<int>(
    'retries_owned',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _themeBadgeMeta = const VerificationMeta(
    'themeBadge',
  );
  @override
  late final GeneratedColumn<bool> themeBadge = GeneratedColumn<bool>(
    'theme_badge',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("theme_badge" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _biometricsEnabledMeta = const VerificationMeta(
    'biometricsEnabled',
  );
  @override
  late final GeneratedColumn<bool> biometricsEnabled = GeneratedColumn<bool>(
    'biometrics_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("biometrics_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    displayName,
    handle,
    homeMarketId,
    xp,
    boostSpendMinor,
    accuracySum,
    accuracyCount,
    onboarded,
    hintsOwned,
    retriesOwned,
    themeBadge,
    biometricsEnabled,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Profile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    }
    if (data.containsKey('handle')) {
      context.handle(
        _handleMeta,
        handle.isAcceptableOrUnknown(data['handle']!, _handleMeta),
      );
    }
    if (data.containsKey('home_market_id')) {
      context.handle(
        _homeMarketIdMeta,
        homeMarketId.isAcceptableOrUnknown(
          data['home_market_id']!,
          _homeMarketIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_homeMarketIdMeta);
    }
    if (data.containsKey('xp')) {
      context.handle(_xpMeta, xp.isAcceptableOrUnknown(data['xp']!, _xpMeta));
    }
    if (data.containsKey('boost_spend_minor')) {
      context.handle(
        _boostSpendMinorMeta,
        boostSpendMinor.isAcceptableOrUnknown(
          data['boost_spend_minor']!,
          _boostSpendMinorMeta,
        ),
      );
    }
    if (data.containsKey('accuracy_sum')) {
      context.handle(
        _accuracySumMeta,
        accuracySum.isAcceptableOrUnknown(
          data['accuracy_sum']!,
          _accuracySumMeta,
        ),
      );
    }
    if (data.containsKey('accuracy_count')) {
      context.handle(
        _accuracyCountMeta,
        accuracyCount.isAcceptableOrUnknown(
          data['accuracy_count']!,
          _accuracyCountMeta,
        ),
      );
    }
    if (data.containsKey('onboarded')) {
      context.handle(
        _onboardedMeta,
        onboarded.isAcceptableOrUnknown(data['onboarded']!, _onboardedMeta),
      );
    }
    if (data.containsKey('hints_owned')) {
      context.handle(
        _hintsOwnedMeta,
        hintsOwned.isAcceptableOrUnknown(data['hints_owned']!, _hintsOwnedMeta),
      );
    }
    if (data.containsKey('retries_owned')) {
      context.handle(
        _retriesOwnedMeta,
        retriesOwned.isAcceptableOrUnknown(
          data['retries_owned']!,
          _retriesOwnedMeta,
        ),
      );
    }
    if (data.containsKey('theme_badge')) {
      context.handle(
        _themeBadgeMeta,
        themeBadge.isAcceptableOrUnknown(data['theme_badge']!, _themeBadgeMeta),
      );
    }
    if (data.containsKey('biometrics_enabled')) {
      context.handle(
        _biometricsEnabledMeta,
        biometricsEnabled.isAcceptableOrUnknown(
          data['biometrics_enabled']!,
          _biometricsEnabledMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Profile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Profile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      handle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}handle'],
      )!,
      homeMarketId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}home_market_id'],
      )!,
      xp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}xp'],
      )!,
      boostSpendMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}boost_spend_minor'],
      )!,
      accuracySum: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}accuracy_sum'],
      )!,
      accuracyCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}accuracy_count'],
      )!,
      onboarded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}onboarded'],
      )!,
      hintsOwned: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hints_owned'],
      )!,
      retriesOwned: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retries_owned'],
      )!,
      themeBadge: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}theme_badge'],
      )!,
      biometricsEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}biometrics_enabled'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(attachedDatabase, alias);
  }
}

class Profile extends DataClass implements Insertable<Profile> {
  final int id;
  final String displayName;
  final String handle;
  final String homeMarketId;
  final int xp;
  final int boostSpendMinor;
  final double accuracySum;
  final int accuracyCount;
  final bool onboarded;
  final int hintsOwned;
  final int retriesOwned;
  final bool themeBadge;
  final bool biometricsEnabled;
  final DateTime createdAt;
  const Profile({
    required this.id,
    required this.displayName,
    required this.handle,
    required this.homeMarketId,
    required this.xp,
    required this.boostSpendMinor,
    required this.accuracySum,
    required this.accuracyCount,
    required this.onboarded,
    required this.hintsOwned,
    required this.retriesOwned,
    required this.themeBadge,
    required this.biometricsEnabled,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['display_name'] = Variable<String>(displayName);
    map['handle'] = Variable<String>(handle);
    map['home_market_id'] = Variable<String>(homeMarketId);
    map['xp'] = Variable<int>(xp);
    map['boost_spend_minor'] = Variable<int>(boostSpendMinor);
    map['accuracy_sum'] = Variable<double>(accuracySum);
    map['accuracy_count'] = Variable<int>(accuracyCount);
    map['onboarded'] = Variable<bool>(onboarded);
    map['hints_owned'] = Variable<int>(hintsOwned);
    map['retries_owned'] = Variable<int>(retriesOwned);
    map['theme_badge'] = Variable<bool>(themeBadge);
    map['biometrics_enabled'] = Variable<bool>(biometricsEnabled);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      id: Value(id),
      displayName: Value(displayName),
      handle: Value(handle),
      homeMarketId: Value(homeMarketId),
      xp: Value(xp),
      boostSpendMinor: Value(boostSpendMinor),
      accuracySum: Value(accuracySum),
      accuracyCount: Value(accuracyCount),
      onboarded: Value(onboarded),
      hintsOwned: Value(hintsOwned),
      retriesOwned: Value(retriesOwned),
      themeBadge: Value(themeBadge),
      biometricsEnabled: Value(biometricsEnabled),
      createdAt: Value(createdAt),
    );
  }

  factory Profile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Profile(
      id: serializer.fromJson<int>(json['id']),
      displayName: serializer.fromJson<String>(json['displayName']),
      handle: serializer.fromJson<String>(json['handle']),
      homeMarketId: serializer.fromJson<String>(json['homeMarketId']),
      xp: serializer.fromJson<int>(json['xp']),
      boostSpendMinor: serializer.fromJson<int>(json['boostSpendMinor']),
      accuracySum: serializer.fromJson<double>(json['accuracySum']),
      accuracyCount: serializer.fromJson<int>(json['accuracyCount']),
      onboarded: serializer.fromJson<bool>(json['onboarded']),
      hintsOwned: serializer.fromJson<int>(json['hintsOwned']),
      retriesOwned: serializer.fromJson<int>(json['retriesOwned']),
      themeBadge: serializer.fromJson<bool>(json['themeBadge']),
      biometricsEnabled: serializer.fromJson<bool>(json['biometricsEnabled']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'displayName': serializer.toJson<String>(displayName),
      'handle': serializer.toJson<String>(handle),
      'homeMarketId': serializer.toJson<String>(homeMarketId),
      'xp': serializer.toJson<int>(xp),
      'boostSpendMinor': serializer.toJson<int>(boostSpendMinor),
      'accuracySum': serializer.toJson<double>(accuracySum),
      'accuracyCount': serializer.toJson<int>(accuracyCount),
      'onboarded': serializer.toJson<bool>(onboarded),
      'hintsOwned': serializer.toJson<int>(hintsOwned),
      'retriesOwned': serializer.toJson<int>(retriesOwned),
      'themeBadge': serializer.toJson<bool>(themeBadge),
      'biometricsEnabled': serializer.toJson<bool>(biometricsEnabled),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Profile copyWith({
    int? id,
    String? displayName,
    String? handle,
    String? homeMarketId,
    int? xp,
    int? boostSpendMinor,
    double? accuracySum,
    int? accuracyCount,
    bool? onboarded,
    int? hintsOwned,
    int? retriesOwned,
    bool? themeBadge,
    bool? biometricsEnabled,
    DateTime? createdAt,
  }) => Profile(
    id: id ?? this.id,
    displayName: displayName ?? this.displayName,
    handle: handle ?? this.handle,
    homeMarketId: homeMarketId ?? this.homeMarketId,
    xp: xp ?? this.xp,
    boostSpendMinor: boostSpendMinor ?? this.boostSpendMinor,
    accuracySum: accuracySum ?? this.accuracySum,
    accuracyCount: accuracyCount ?? this.accuracyCount,
    onboarded: onboarded ?? this.onboarded,
    hintsOwned: hintsOwned ?? this.hintsOwned,
    retriesOwned: retriesOwned ?? this.retriesOwned,
    themeBadge: themeBadge ?? this.themeBadge,
    biometricsEnabled: biometricsEnabled ?? this.biometricsEnabled,
    createdAt: createdAt ?? this.createdAt,
  );
  Profile copyWithCompanion(ProfilesCompanion data) {
    return Profile(
      id: data.id.present ? data.id.value : this.id,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      handle: data.handle.present ? data.handle.value : this.handle,
      homeMarketId: data.homeMarketId.present
          ? data.homeMarketId.value
          : this.homeMarketId,
      xp: data.xp.present ? data.xp.value : this.xp,
      boostSpendMinor: data.boostSpendMinor.present
          ? data.boostSpendMinor.value
          : this.boostSpendMinor,
      accuracySum: data.accuracySum.present
          ? data.accuracySum.value
          : this.accuracySum,
      accuracyCount: data.accuracyCount.present
          ? data.accuracyCount.value
          : this.accuracyCount,
      onboarded: data.onboarded.present ? data.onboarded.value : this.onboarded,
      hintsOwned: data.hintsOwned.present
          ? data.hintsOwned.value
          : this.hintsOwned,
      retriesOwned: data.retriesOwned.present
          ? data.retriesOwned.value
          : this.retriesOwned,
      themeBadge: data.themeBadge.present
          ? data.themeBadge.value
          : this.themeBadge,
      biometricsEnabled: data.biometricsEnabled.present
          ? data.biometricsEnabled.value
          : this.biometricsEnabled,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Profile(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('handle: $handle, ')
          ..write('homeMarketId: $homeMarketId, ')
          ..write('xp: $xp, ')
          ..write('boostSpendMinor: $boostSpendMinor, ')
          ..write('accuracySum: $accuracySum, ')
          ..write('accuracyCount: $accuracyCount, ')
          ..write('onboarded: $onboarded, ')
          ..write('hintsOwned: $hintsOwned, ')
          ..write('retriesOwned: $retriesOwned, ')
          ..write('themeBadge: $themeBadge, ')
          ..write('biometricsEnabled: $biometricsEnabled, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    displayName,
    handle,
    homeMarketId,
    xp,
    boostSpendMinor,
    accuracySum,
    accuracyCount,
    onboarded,
    hintsOwned,
    retriesOwned,
    themeBadge,
    biometricsEnabled,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Profile &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.handle == this.handle &&
          other.homeMarketId == this.homeMarketId &&
          other.xp == this.xp &&
          other.boostSpendMinor == this.boostSpendMinor &&
          other.accuracySum == this.accuracySum &&
          other.accuracyCount == this.accuracyCount &&
          other.onboarded == this.onboarded &&
          other.hintsOwned == this.hintsOwned &&
          other.retriesOwned == this.retriesOwned &&
          other.themeBadge == this.themeBadge &&
          other.biometricsEnabled == this.biometricsEnabled &&
          other.createdAt == this.createdAt);
}

class ProfilesCompanion extends UpdateCompanion<Profile> {
  final Value<int> id;
  final Value<String> displayName;
  final Value<String> handle;
  final Value<String> homeMarketId;
  final Value<int> xp;
  final Value<int> boostSpendMinor;
  final Value<double> accuracySum;
  final Value<int> accuracyCount;
  final Value<bool> onboarded;
  final Value<int> hintsOwned;
  final Value<int> retriesOwned;
  final Value<bool> themeBadge;
  final Value<bool> biometricsEnabled;
  final Value<DateTime> createdAt;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.handle = const Value.absent(),
    this.homeMarketId = const Value.absent(),
    this.xp = const Value.absent(),
    this.boostSpendMinor = const Value.absent(),
    this.accuracySum = const Value.absent(),
    this.accuracyCount = const Value.absent(),
    this.onboarded = const Value.absent(),
    this.hintsOwned = const Value.absent(),
    this.retriesOwned = const Value.absent(),
    this.themeBadge = const Value.absent(),
    this.biometricsEnabled = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProfilesCompanion.insert({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.handle = const Value.absent(),
    required String homeMarketId,
    this.xp = const Value.absent(),
    this.boostSpendMinor = const Value.absent(),
    this.accuracySum = const Value.absent(),
    this.accuracyCount = const Value.absent(),
    this.onboarded = const Value.absent(),
    this.hintsOwned = const Value.absent(),
    this.retriesOwned = const Value.absent(),
    this.themeBadge = const Value.absent(),
    this.biometricsEnabled = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : homeMarketId = Value(homeMarketId);
  static Insertable<Profile> custom({
    Expression<int>? id,
    Expression<String>? displayName,
    Expression<String>? handle,
    Expression<String>? homeMarketId,
    Expression<int>? xp,
    Expression<int>? boostSpendMinor,
    Expression<double>? accuracySum,
    Expression<int>? accuracyCount,
    Expression<bool>? onboarded,
    Expression<int>? hintsOwned,
    Expression<int>? retriesOwned,
    Expression<bool>? themeBadge,
    Expression<bool>? biometricsEnabled,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (handle != null) 'handle': handle,
      if (homeMarketId != null) 'home_market_id': homeMarketId,
      if (xp != null) 'xp': xp,
      if (boostSpendMinor != null) 'boost_spend_minor': boostSpendMinor,
      if (accuracySum != null) 'accuracy_sum': accuracySum,
      if (accuracyCount != null) 'accuracy_count': accuracyCount,
      if (onboarded != null) 'onboarded': onboarded,
      if (hintsOwned != null) 'hints_owned': hintsOwned,
      if (retriesOwned != null) 'retries_owned': retriesOwned,
      if (themeBadge != null) 'theme_badge': themeBadge,
      if (biometricsEnabled != null) 'biometrics_enabled': biometricsEnabled,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProfilesCompanion copyWith({
    Value<int>? id,
    Value<String>? displayName,
    Value<String>? handle,
    Value<String>? homeMarketId,
    Value<int>? xp,
    Value<int>? boostSpendMinor,
    Value<double>? accuracySum,
    Value<int>? accuracyCount,
    Value<bool>? onboarded,
    Value<int>? hintsOwned,
    Value<int>? retriesOwned,
    Value<bool>? themeBadge,
    Value<bool>? biometricsEnabled,
    Value<DateTime>? createdAt,
  }) {
    return ProfilesCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      handle: handle ?? this.handle,
      homeMarketId: homeMarketId ?? this.homeMarketId,
      xp: xp ?? this.xp,
      boostSpendMinor: boostSpendMinor ?? this.boostSpendMinor,
      accuracySum: accuracySum ?? this.accuracySum,
      accuracyCount: accuracyCount ?? this.accuracyCount,
      onboarded: onboarded ?? this.onboarded,
      hintsOwned: hintsOwned ?? this.hintsOwned,
      retriesOwned: retriesOwned ?? this.retriesOwned,
      themeBadge: themeBadge ?? this.themeBadge,
      biometricsEnabled: biometricsEnabled ?? this.biometricsEnabled,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (handle.present) {
      map['handle'] = Variable<String>(handle.value);
    }
    if (homeMarketId.present) {
      map['home_market_id'] = Variable<String>(homeMarketId.value);
    }
    if (xp.present) {
      map['xp'] = Variable<int>(xp.value);
    }
    if (boostSpendMinor.present) {
      map['boost_spend_minor'] = Variable<int>(boostSpendMinor.value);
    }
    if (accuracySum.present) {
      map['accuracy_sum'] = Variable<double>(accuracySum.value);
    }
    if (accuracyCount.present) {
      map['accuracy_count'] = Variable<int>(accuracyCount.value);
    }
    if (onboarded.present) {
      map['onboarded'] = Variable<bool>(onboarded.value);
    }
    if (hintsOwned.present) {
      map['hints_owned'] = Variable<int>(hintsOwned.value);
    }
    if (retriesOwned.present) {
      map['retries_owned'] = Variable<int>(retriesOwned.value);
    }
    if (themeBadge.present) {
      map['theme_badge'] = Variable<bool>(themeBadge.value);
    }
    if (biometricsEnabled.present) {
      map['biometrics_enabled'] = Variable<bool>(biometricsEnabled.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('handle: $handle, ')
          ..write('homeMarketId: $homeMarketId, ')
          ..write('xp: $xp, ')
          ..write('boostSpendMinor: $boostSpendMinor, ')
          ..write('accuracySum: $accuracySum, ')
          ..write('accuracyCount: $accuracyCount, ')
          ..write('onboarded: $onboarded, ')
          ..write('hintsOwned: $hintsOwned, ')
          ..write('retriesOwned: $retriesOwned, ')
          ..write('themeBadge: $themeBadge, ')
          ..write('biometricsEnabled: $biometricsEnabled, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _balanceMinorMeta = const VerificationMeta(
    'balanceMinor',
  );
  @override
  late final GeneratedColumn<int> balanceMinor = GeneratedColumn<int>(
    'balance_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('wallet'),
  );
  static const VerificationMeta _ownerHandleMeta = const VerificationMeta(
    'ownerHandle',
  );
  @override
  late final GeneratedColumn<String> ownerHandle = GeneratedColumn<String>(
    'owner_handle',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    currencyCode,
    balanceMinor,
    kind,
    ownerHandle,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Account> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('balance_minor')) {
      context.handle(
        _balanceMinorMeta,
        balanceMinor.isAcceptableOrUnknown(
          data['balance_minor']!,
          _balanceMinorMeta,
        ),
      );
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    }
    if (data.containsKey('owner_handle')) {
      context.handle(
        _ownerHandleMeta,
        ownerHandle.isAcceptableOrUnknown(
          data['owner_handle']!,
          _ownerHandleMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Account map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Account(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      balanceMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}balance_minor'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      ownerHandle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_handle'],
      ),
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }
}

class Account extends DataClass implements Insertable<Account> {
  final String id;
  final String name;
  final String currencyCode;
  final int balanceMinor;
  final String kind;

  /// null = current user; otherwise peer handle for directory accounts
  final String? ownerHandle;
  const Account({
    required this.id,
    required this.name,
    required this.currencyCode,
    required this.balanceMinor,
    required this.kind,
    this.ownerHandle,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['currency_code'] = Variable<String>(currencyCode);
    map['balance_minor'] = Variable<int>(balanceMinor);
    map['kind'] = Variable<String>(kind);
    if (!nullToAbsent || ownerHandle != null) {
      map['owner_handle'] = Variable<String>(ownerHandle);
    }
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      name: Value(name),
      currencyCode: Value(currencyCode),
      balanceMinor: Value(balanceMinor),
      kind: Value(kind),
      ownerHandle: ownerHandle == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerHandle),
    );
  }

  factory Account.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      balanceMinor: serializer.fromJson<int>(json['balanceMinor']),
      kind: serializer.fromJson<String>(json['kind']),
      ownerHandle: serializer.fromJson<String?>(json['ownerHandle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'balanceMinor': serializer.toJson<int>(balanceMinor),
      'kind': serializer.toJson<String>(kind),
      'ownerHandle': serializer.toJson<String?>(ownerHandle),
    };
  }

  Account copyWith({
    String? id,
    String? name,
    String? currencyCode,
    int? balanceMinor,
    String? kind,
    Value<String?> ownerHandle = const Value.absent(),
  }) => Account(
    id: id ?? this.id,
    name: name ?? this.name,
    currencyCode: currencyCode ?? this.currencyCode,
    balanceMinor: balanceMinor ?? this.balanceMinor,
    kind: kind ?? this.kind,
    ownerHandle: ownerHandle.present ? ownerHandle.value : this.ownerHandle,
  );
  Account copyWithCompanion(AccountsCompanion data) {
    return Account(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      balanceMinor: data.balanceMinor.present
          ? data.balanceMinor.value
          : this.balanceMinor,
      kind: data.kind.present ? data.kind.value : this.kind,
      ownerHandle: data.ownerHandle.present
          ? data.ownerHandle.value
          : this.ownerHandle,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('balanceMinor: $balanceMinor, ')
          ..write('kind: $kind, ')
          ..write('ownerHandle: $ownerHandle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, currencyCode, balanceMinor, kind, ownerHandle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          other.id == this.id &&
          other.name == this.name &&
          other.currencyCode == this.currencyCode &&
          other.balanceMinor == this.balanceMinor &&
          other.kind == this.kind &&
          other.ownerHandle == this.ownerHandle);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> currencyCode;
  final Value<int> balanceMinor;
  final Value<String> kind;
  final Value<String?> ownerHandle;
  final Value<int> rowid;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.balanceMinor = const Value.absent(),
    this.kind = const Value.absent(),
    this.ownerHandle = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountsCompanion.insert({
    required String id,
    required String name,
    required String currencyCode,
    this.balanceMinor = const Value.absent(),
    this.kind = const Value.absent(),
    this.ownerHandle = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       currencyCode = Value(currencyCode);
  static Insertable<Account> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? currencyCode,
    Expression<int>? balanceMinor,
    Expression<String>? kind,
    Expression<String>? ownerHandle,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (balanceMinor != null) 'balance_minor': balanceMinor,
      if (kind != null) 'kind': kind,
      if (ownerHandle != null) 'owner_handle': ownerHandle,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? currencyCode,
    Value<int>? balanceMinor,
    Value<String>? kind,
    Value<String?>? ownerHandle,
    Value<int>? rowid,
  }) {
    return AccountsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      currencyCode: currencyCode ?? this.currencyCode,
      balanceMinor: balanceMinor ?? this.balanceMinor,
      kind: kind ?? this.kind,
      ownerHandle: ownerHandle ?? this.ownerHandle,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (balanceMinor.present) {
      map['balance_minor'] = Variable<int>(balanceMinor.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (ownerHandle.present) {
      map['owner_handle'] = Variable<String>(ownerHandle.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('balanceMinor: $balanceMinor, ')
          ..write('kind: $kind, ')
          ..write('ownerHandle: $ownerHandle, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BankCardsTable extends BankCards
    with TableInfo<$BankCardsTable, BankCard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BankCardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
    'token',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastFourMeta = const VerificationMeta(
    'lastFour',
  );
  @override
  late final GeneratedColumn<String> lastFour = GeneratedColumn<String>(
    'last_four',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _frozenMeta = const VerificationMeta('frozen');
  @override
  late final GeneratedColumn<bool> frozen = GeneratedColumn<bool>(
    'frozen',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("frozen" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    accountId,
    token,
    lastFour,
    label,
    frozen,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bank_cards';
  @override
  VerificationContext validateIntegrity(
    Insertable<BankCard> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('token')) {
      context.handle(
        _tokenMeta,
        token.isAcceptableOrUnknown(data['token']!, _tokenMeta),
      );
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('last_four')) {
      context.handle(
        _lastFourMeta,
        lastFour.isAcceptableOrUnknown(data['last_four']!, _lastFourMeta),
      );
    } else if (isInserting) {
      context.missing(_lastFourMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('frozen')) {
      context.handle(
        _frozenMeta,
        frozen.isAcceptableOrUnknown(data['frozen']!, _frozenMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BankCard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BankCard(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      )!,
      token: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}token'],
      )!,
      lastFour: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_four'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      frozen: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}frozen'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $BankCardsTable createAlias(String alias) {
    return $BankCardsTable(attachedDatabase, alias);
  }
}

class BankCard extends DataClass implements Insertable<BankCard> {
  final String id;
  final String accountId;
  final String token;
  final String lastFour;
  final String label;
  final bool frozen;
  final DateTime createdAt;
  const BankCard({
    required this.id,
    required this.accountId,
    required this.token,
    required this.lastFour,
    required this.label,
    required this.frozen,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['account_id'] = Variable<String>(accountId);
    map['token'] = Variable<String>(token);
    map['last_four'] = Variable<String>(lastFour);
    map['label'] = Variable<String>(label);
    map['frozen'] = Variable<bool>(frozen);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BankCardsCompanion toCompanion(bool nullToAbsent) {
    return BankCardsCompanion(
      id: Value(id),
      accountId: Value(accountId),
      token: Value(token),
      lastFour: Value(lastFour),
      label: Value(label),
      frozen: Value(frozen),
      createdAt: Value(createdAt),
    );
  }

  factory BankCard.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BankCard(
      id: serializer.fromJson<String>(json['id']),
      accountId: serializer.fromJson<String>(json['accountId']),
      token: serializer.fromJson<String>(json['token']),
      lastFour: serializer.fromJson<String>(json['lastFour']),
      label: serializer.fromJson<String>(json['label']),
      frozen: serializer.fromJson<bool>(json['frozen']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'accountId': serializer.toJson<String>(accountId),
      'token': serializer.toJson<String>(token),
      'lastFour': serializer.toJson<String>(lastFour),
      'label': serializer.toJson<String>(label),
      'frozen': serializer.toJson<bool>(frozen),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BankCard copyWith({
    String? id,
    String? accountId,
    String? token,
    String? lastFour,
    String? label,
    bool? frozen,
    DateTime? createdAt,
  }) => BankCard(
    id: id ?? this.id,
    accountId: accountId ?? this.accountId,
    token: token ?? this.token,
    lastFour: lastFour ?? this.lastFour,
    label: label ?? this.label,
    frozen: frozen ?? this.frozen,
    createdAt: createdAt ?? this.createdAt,
  );
  BankCard copyWithCompanion(BankCardsCompanion data) {
    return BankCard(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      token: data.token.present ? data.token.value : this.token,
      lastFour: data.lastFour.present ? data.lastFour.value : this.lastFour,
      label: data.label.present ? data.label.value : this.label,
      frozen: data.frozen.present ? data.frozen.value : this.frozen,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BankCard(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('token: $token, ')
          ..write('lastFour: $lastFour, ')
          ..write('label: $label, ')
          ..write('frozen: $frozen, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, accountId, token, lastFour, label, frozen, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BankCard &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.token == this.token &&
          other.lastFour == this.lastFour &&
          other.label == this.label &&
          other.frozen == this.frozen &&
          other.createdAt == this.createdAt);
}

class BankCardsCompanion extends UpdateCompanion<BankCard> {
  final Value<String> id;
  final Value<String> accountId;
  final Value<String> token;
  final Value<String> lastFour;
  final Value<String> label;
  final Value<bool> frozen;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const BankCardsCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.token = const Value.absent(),
    this.lastFour = const Value.absent(),
    this.label = const Value.absent(),
    this.frozen = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BankCardsCompanion.insert({
    required String id,
    required String accountId,
    required String token,
    required String lastFour,
    required String label,
    this.frozen = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       accountId = Value(accountId),
       token = Value(token),
       lastFour = Value(lastFour),
       label = Value(label);
  static Insertable<BankCard> custom({
    Expression<String>? id,
    Expression<String>? accountId,
    Expression<String>? token,
    Expression<String>? lastFour,
    Expression<String>? label,
    Expression<bool>? frozen,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'account_id': accountId,
      if (token != null) 'token': token,
      if (lastFour != null) 'last_four': lastFour,
      if (label != null) 'label': label,
      if (frozen != null) 'frozen': frozen,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BankCardsCompanion copyWith({
    Value<String>? id,
    Value<String>? accountId,
    Value<String>? token,
    Value<String>? lastFour,
    Value<String>? label,
    Value<bool>? frozen,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return BankCardsCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      token: token ?? this.token,
      lastFour: lastFour ?? this.lastFour,
      label: label ?? this.label,
      frozen: frozen ?? this.frozen,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (lastFour.present) {
      map['last_four'] = Variable<String>(lastFour.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (frozen.present) {
      map['frozen'] = Variable<bool>(frozen.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankCardsCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('token: $token, ')
          ..write('lastFour: $lastFour, ')
          ..write('label: $label, ')
          ..write('frozen: $frozen, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CardVaultSecretsTable extends CardVaultSecrets
    with TableInfo<$CardVaultSecretsTable, CardVaultSecret> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardVaultSecretsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
    'token',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _panMeta = const VerificationMeta('pan');
  @override
  late final GeneratedColumn<String> pan = GeneratedColumn<String>(
    'pan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiryMmYyMeta = const VerificationMeta(
    'expiryMmYy',
  );
  @override
  late final GeneratedColumn<String> expiryMmYy = GeneratedColumn<String>(
    'expiry_mm_yy',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cvvMeta = const VerificationMeta('cvv');
  @override
  late final GeneratedColumn<String> cvv = GeneratedColumn<String>(
    'cvv',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [token, pan, expiryMmYy, cvv];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'card_vault_secrets';
  @override
  VerificationContext validateIntegrity(
    Insertable<CardVaultSecret> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('token')) {
      context.handle(
        _tokenMeta,
        token.isAcceptableOrUnknown(data['token']!, _tokenMeta),
      );
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('pan')) {
      context.handle(
        _panMeta,
        pan.isAcceptableOrUnknown(data['pan']!, _panMeta),
      );
    } else if (isInserting) {
      context.missing(_panMeta);
    }
    if (data.containsKey('expiry_mm_yy')) {
      context.handle(
        _expiryMmYyMeta,
        expiryMmYy.isAcceptableOrUnknown(
          data['expiry_mm_yy']!,
          _expiryMmYyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_expiryMmYyMeta);
    }
    if (data.containsKey('cvv')) {
      context.handle(
        _cvvMeta,
        cvv.isAcceptableOrUnknown(data['cvv']!, _cvvMeta),
      );
    } else if (isInserting) {
      context.missing(_cvvMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {token};
  @override
  CardVaultSecret map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardVaultSecret(
      token: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}token'],
      )!,
      pan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pan'],
      )!,
      expiryMmYy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expiry_mm_yy'],
      )!,
      cvv: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cvv'],
      )!,
    );
  }

  @override
  $CardVaultSecretsTable createAlias(String alias) {
    return $CardVaultSecretsTable(attachedDatabase, alias);
  }
}

class CardVaultSecret extends DataClass implements Insertable<CardVaultSecret> {
  final String token;
  final String pan;
  final String expiryMmYy;
  final String cvv;
  const CardVaultSecret({
    required this.token,
    required this.pan,
    required this.expiryMmYy,
    required this.cvv,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['token'] = Variable<String>(token);
    map['pan'] = Variable<String>(pan);
    map['expiry_mm_yy'] = Variable<String>(expiryMmYy);
    map['cvv'] = Variable<String>(cvv);
    return map;
  }

  CardVaultSecretsCompanion toCompanion(bool nullToAbsent) {
    return CardVaultSecretsCompanion(
      token: Value(token),
      pan: Value(pan),
      expiryMmYy: Value(expiryMmYy),
      cvv: Value(cvv),
    );
  }

  factory CardVaultSecret.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardVaultSecret(
      token: serializer.fromJson<String>(json['token']),
      pan: serializer.fromJson<String>(json['pan']),
      expiryMmYy: serializer.fromJson<String>(json['expiryMmYy']),
      cvv: serializer.fromJson<String>(json['cvv']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'token': serializer.toJson<String>(token),
      'pan': serializer.toJson<String>(pan),
      'expiryMmYy': serializer.toJson<String>(expiryMmYy),
      'cvv': serializer.toJson<String>(cvv),
    };
  }

  CardVaultSecret copyWith({
    String? token,
    String? pan,
    String? expiryMmYy,
    String? cvv,
  }) => CardVaultSecret(
    token: token ?? this.token,
    pan: pan ?? this.pan,
    expiryMmYy: expiryMmYy ?? this.expiryMmYy,
    cvv: cvv ?? this.cvv,
  );
  CardVaultSecret copyWithCompanion(CardVaultSecretsCompanion data) {
    return CardVaultSecret(
      token: data.token.present ? data.token.value : this.token,
      pan: data.pan.present ? data.pan.value : this.pan,
      expiryMmYy: data.expiryMmYy.present
          ? data.expiryMmYy.value
          : this.expiryMmYy,
      cvv: data.cvv.present ? data.cvv.value : this.cvv,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CardVaultSecret(')
          ..write('token: $token, ')
          ..write('pan: $pan, ')
          ..write('expiryMmYy: $expiryMmYy, ')
          ..write('cvv: $cvv')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(token, pan, expiryMmYy, cvv);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardVaultSecret &&
          other.token == this.token &&
          other.pan == this.pan &&
          other.expiryMmYy == this.expiryMmYy &&
          other.cvv == this.cvv);
}

class CardVaultSecretsCompanion extends UpdateCompanion<CardVaultSecret> {
  final Value<String> token;
  final Value<String> pan;
  final Value<String> expiryMmYy;
  final Value<String> cvv;
  final Value<int> rowid;
  const CardVaultSecretsCompanion({
    this.token = const Value.absent(),
    this.pan = const Value.absent(),
    this.expiryMmYy = const Value.absent(),
    this.cvv = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CardVaultSecretsCompanion.insert({
    required String token,
    required String pan,
    required String expiryMmYy,
    required String cvv,
    this.rowid = const Value.absent(),
  }) : token = Value(token),
       pan = Value(pan),
       expiryMmYy = Value(expiryMmYy),
       cvv = Value(cvv);
  static Insertable<CardVaultSecret> custom({
    Expression<String>? token,
    Expression<String>? pan,
    Expression<String>? expiryMmYy,
    Expression<String>? cvv,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (token != null) 'token': token,
      if (pan != null) 'pan': pan,
      if (expiryMmYy != null) 'expiry_mm_yy': expiryMmYy,
      if (cvv != null) 'cvv': cvv,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CardVaultSecretsCompanion copyWith({
    Value<String>? token,
    Value<String>? pan,
    Value<String>? expiryMmYy,
    Value<String>? cvv,
    Value<int>? rowid,
  }) {
    return CardVaultSecretsCompanion(
      token: token ?? this.token,
      pan: pan ?? this.pan,
      expiryMmYy: expiryMmYy ?? this.expiryMmYy,
      cvv: cvv ?? this.cvv,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (pan.present) {
      map['pan'] = Variable<String>(pan.value);
    }
    if (expiryMmYy.present) {
      map['expiry_mm_yy'] = Variable<String>(expiryMmYy.value);
    }
    if (cvv.present) {
      map['cvv'] = Variable<String>(cvv.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardVaultSecretsCompanion(')
          ..write('token: $token, ')
          ..write('pan: $pan, ')
          ..write('expiryMmYy: $expiryMmYy, ')
          ..write('cvv: $cvv, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DepositAccountsTable extends DepositAccounts
    with TableInfo<$DepositAccountsTable, DepositAccount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DepositAccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _openedAtMeta = const VerificationMeta(
    'openedAt',
  );
  @override
  late final GeneratedColumn<DateTime> openedAt = GeneratedColumn<DateTime>(
    'opened_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _lastAccrualAtMeta = const VerificationMeta(
    'lastAccrualAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastAccrualAt =
      GeneratedColumn<DateTime>(
        'last_accrual_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    accountId,
    productId,
    openedAt,
    lastAccrualAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'deposit_accounts';
  @override
  VerificationContext validateIntegrity(
    Insertable<DepositAccount> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('opened_at')) {
      context.handle(
        _openedAtMeta,
        openedAt.isAcceptableOrUnknown(data['opened_at']!, _openedAtMeta),
      );
    }
    if (data.containsKey('last_accrual_at')) {
      context.handle(
        _lastAccrualAtMeta,
        lastAccrualAt.isAcceptableOrUnknown(
          data['last_accrual_at']!,
          _lastAccrualAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DepositAccount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DepositAccount(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      openedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}opened_at'],
      )!,
      lastAccrualAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_accrual_at'],
      )!,
    );
  }

  @override
  $DepositAccountsTable createAlias(String alias) {
    return $DepositAccountsTable(attachedDatabase, alias);
  }
}

class DepositAccount extends DataClass implements Insertable<DepositAccount> {
  final String id;
  final String accountId;
  final String productId;
  final DateTime openedAt;
  final DateTime lastAccrualAt;
  const DepositAccount({
    required this.id,
    required this.accountId,
    required this.productId,
    required this.openedAt,
    required this.lastAccrualAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['account_id'] = Variable<String>(accountId);
    map['product_id'] = Variable<String>(productId);
    map['opened_at'] = Variable<DateTime>(openedAt);
    map['last_accrual_at'] = Variable<DateTime>(lastAccrualAt);
    return map;
  }

  DepositAccountsCompanion toCompanion(bool nullToAbsent) {
    return DepositAccountsCompanion(
      id: Value(id),
      accountId: Value(accountId),
      productId: Value(productId),
      openedAt: Value(openedAt),
      lastAccrualAt: Value(lastAccrualAt),
    );
  }

  factory DepositAccount.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DepositAccount(
      id: serializer.fromJson<String>(json['id']),
      accountId: serializer.fromJson<String>(json['accountId']),
      productId: serializer.fromJson<String>(json['productId']),
      openedAt: serializer.fromJson<DateTime>(json['openedAt']),
      lastAccrualAt: serializer.fromJson<DateTime>(json['lastAccrualAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'accountId': serializer.toJson<String>(accountId),
      'productId': serializer.toJson<String>(productId),
      'openedAt': serializer.toJson<DateTime>(openedAt),
      'lastAccrualAt': serializer.toJson<DateTime>(lastAccrualAt),
    };
  }

  DepositAccount copyWith({
    String? id,
    String? accountId,
    String? productId,
    DateTime? openedAt,
    DateTime? lastAccrualAt,
  }) => DepositAccount(
    id: id ?? this.id,
    accountId: accountId ?? this.accountId,
    productId: productId ?? this.productId,
    openedAt: openedAt ?? this.openedAt,
    lastAccrualAt: lastAccrualAt ?? this.lastAccrualAt,
  );
  DepositAccount copyWithCompanion(DepositAccountsCompanion data) {
    return DepositAccount(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      productId: data.productId.present ? data.productId.value : this.productId,
      openedAt: data.openedAt.present ? data.openedAt.value : this.openedAt,
      lastAccrualAt: data.lastAccrualAt.present
          ? data.lastAccrualAt.value
          : this.lastAccrualAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DepositAccount(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('productId: $productId, ')
          ..write('openedAt: $openedAt, ')
          ..write('lastAccrualAt: $lastAccrualAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, accountId, productId, openedAt, lastAccrualAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DepositAccount &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.productId == this.productId &&
          other.openedAt == this.openedAt &&
          other.lastAccrualAt == this.lastAccrualAt);
}

class DepositAccountsCompanion extends UpdateCompanion<DepositAccount> {
  final Value<String> id;
  final Value<String> accountId;
  final Value<String> productId;
  final Value<DateTime> openedAt;
  final Value<DateTime> lastAccrualAt;
  final Value<int> rowid;
  const DepositAccountsCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.productId = const Value.absent(),
    this.openedAt = const Value.absent(),
    this.lastAccrualAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DepositAccountsCompanion.insert({
    required String id,
    required String accountId,
    required String productId,
    this.openedAt = const Value.absent(),
    this.lastAccrualAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       accountId = Value(accountId),
       productId = Value(productId);
  static Insertable<DepositAccount> custom({
    Expression<String>? id,
    Expression<String>? accountId,
    Expression<String>? productId,
    Expression<DateTime>? openedAt,
    Expression<DateTime>? lastAccrualAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'account_id': accountId,
      if (productId != null) 'product_id': productId,
      if (openedAt != null) 'opened_at': openedAt,
      if (lastAccrualAt != null) 'last_accrual_at': lastAccrualAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DepositAccountsCompanion copyWith({
    Value<String>? id,
    Value<String>? accountId,
    Value<String>? productId,
    Value<DateTime>? openedAt,
    Value<DateTime>? lastAccrualAt,
    Value<int>? rowid,
  }) {
    return DepositAccountsCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      productId: productId ?? this.productId,
      openedAt: openedAt ?? this.openedAt,
      lastAccrualAt: lastAccrualAt ?? this.lastAccrualAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (openedAt.present) {
      map['opened_at'] = Variable<DateTime>(openedAt.value);
    }
    if (lastAccrualAt.present) {
      map['last_accrual_at'] = Variable<DateTime>(lastAccrualAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DepositAccountsCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('productId: $productId, ')
          ..write('openedAt: $openedAt, ')
          ..write('lastAccrualAt: $lastAccrualAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DirectoryUsersTable extends DirectoryUsers
    with TableInfo<$DirectoryUsersTable, DirectoryUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DirectoryUsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _handleMeta = const VerificationMeta('handle');
  @override
  late final GeneratedColumn<String> handle = GeneratedColumn<String>(
    'handle',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [handle, displayName, accountId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'directory_users';
  @override
  VerificationContext validateIntegrity(
    Insertable<DirectoryUser> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('handle')) {
      context.handle(
        _handleMeta,
        handle.isAcceptableOrUnknown(data['handle']!, _handleMeta),
      );
    } else if (isInserting) {
      context.missing(_handleMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {handle};
  @override
  DirectoryUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DirectoryUser(
      handle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}handle'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      )!,
    );
  }

  @override
  $DirectoryUsersTable createAlias(String alias) {
    return $DirectoryUsersTable(attachedDatabase, alias);
  }
}

class DirectoryUser extends DataClass implements Insertable<DirectoryUser> {
  final String handle;
  final String displayName;
  final String accountId;
  const DirectoryUser({
    required this.handle,
    required this.displayName,
    required this.accountId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['handle'] = Variable<String>(handle);
    map['display_name'] = Variable<String>(displayName);
    map['account_id'] = Variable<String>(accountId);
    return map;
  }

  DirectoryUsersCompanion toCompanion(bool nullToAbsent) {
    return DirectoryUsersCompanion(
      handle: Value(handle),
      displayName: Value(displayName),
      accountId: Value(accountId),
    );
  }

  factory DirectoryUser.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DirectoryUser(
      handle: serializer.fromJson<String>(json['handle']),
      displayName: serializer.fromJson<String>(json['displayName']),
      accountId: serializer.fromJson<String>(json['accountId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'handle': serializer.toJson<String>(handle),
      'displayName': serializer.toJson<String>(displayName),
      'accountId': serializer.toJson<String>(accountId),
    };
  }

  DirectoryUser copyWith({
    String? handle,
    String? displayName,
    String? accountId,
  }) => DirectoryUser(
    handle: handle ?? this.handle,
    displayName: displayName ?? this.displayName,
    accountId: accountId ?? this.accountId,
  );
  DirectoryUser copyWithCompanion(DirectoryUsersCompanion data) {
    return DirectoryUser(
      handle: data.handle.present ? data.handle.value : this.handle,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DirectoryUser(')
          ..write('handle: $handle, ')
          ..write('displayName: $displayName, ')
          ..write('accountId: $accountId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(handle, displayName, accountId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DirectoryUser &&
          other.handle == this.handle &&
          other.displayName == this.displayName &&
          other.accountId == this.accountId);
}

class DirectoryUsersCompanion extends UpdateCompanion<DirectoryUser> {
  final Value<String> handle;
  final Value<String> displayName;
  final Value<String> accountId;
  final Value<int> rowid;
  const DirectoryUsersCompanion({
    this.handle = const Value.absent(),
    this.displayName = const Value.absent(),
    this.accountId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DirectoryUsersCompanion.insert({
    required String handle,
    required String displayName,
    required String accountId,
    this.rowid = const Value.absent(),
  }) : handle = Value(handle),
       displayName = Value(displayName),
       accountId = Value(accountId);
  static Insertable<DirectoryUser> custom({
    Expression<String>? handle,
    Expression<String>? displayName,
    Expression<String>? accountId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (handle != null) 'handle': handle,
      if (displayName != null) 'display_name': displayName,
      if (accountId != null) 'account_id': accountId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DirectoryUsersCompanion copyWith({
    Value<String>? handle,
    Value<String>? displayName,
    Value<String>? accountId,
    Value<int>? rowid,
  }) {
    return DirectoryUsersCompanion(
      handle: handle ?? this.handle,
      displayName: displayName ?? this.displayName,
      accountId: accountId ?? this.accountId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (handle.present) {
      map['handle'] = Variable<String>(handle.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DirectoryUsersCompanion(')
          ..write('handle: $handle, ')
          ..write('displayName: $displayName, ')
          ..write('accountId: $accountId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LedgerEntriesTable extends LedgerEntries
    with TableInfo<$LedgerEntriesTable, LedgerEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LedgerEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idempotencyKeyMeta = const VerificationMeta(
    'idempotencyKey',
  );
  @override
  late final GeneratedColumn<String> idempotencyKey = GeneratedColumn<String>(
    'idempotency_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _counterpartyMeta = const VerificationMeta(
    'counterparty',
  );
  @override
  late final GeneratedColumn<String> counterparty = GeneratedColumn<String>(
    'counterparty',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    accountId,
    amountMinor,
    currencyCode,
    type,
    description,
    idempotencyKey,
    counterparty,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ledger_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<LedgerEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('idempotency_key')) {
      context.handle(
        _idempotencyKeyMeta,
        idempotencyKey.isAcceptableOrUnknown(
          data['idempotency_key']!,
          _idempotencyKeyMeta,
        ),
      );
    }
    if (data.containsKey('counterparty')) {
      context.handle(
        _counterpartyMeta,
        counterparty.isAcceptableOrUnknown(
          data['counterparty']!,
          _counterpartyMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LedgerEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LedgerEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      )!,
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      idempotencyKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}idempotency_key'],
      ),
      counterparty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}counterparty'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LedgerEntriesTable createAlias(String alias) {
    return $LedgerEntriesTable(attachedDatabase, alias);
  }
}

class LedgerEntry extends DataClass implements Insertable<LedgerEntry> {
  final String id;
  final String accountId;
  final int amountMinor;
  final String currencyCode;
  final String type;
  final String description;
  final String? idempotencyKey;
  final String? counterparty;
  final DateTime createdAt;
  const LedgerEntry({
    required this.id,
    required this.accountId,
    required this.amountMinor,
    required this.currencyCode,
    required this.type,
    required this.description,
    this.idempotencyKey,
    this.counterparty,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['account_id'] = Variable<String>(accountId);
    map['amount_minor'] = Variable<int>(amountMinor);
    map['currency_code'] = Variable<String>(currencyCode);
    map['type'] = Variable<String>(type);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || idempotencyKey != null) {
      map['idempotency_key'] = Variable<String>(idempotencyKey);
    }
    if (!nullToAbsent || counterparty != null) {
      map['counterparty'] = Variable<String>(counterparty);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LedgerEntriesCompanion toCompanion(bool nullToAbsent) {
    return LedgerEntriesCompanion(
      id: Value(id),
      accountId: Value(accountId),
      amountMinor: Value(amountMinor),
      currencyCode: Value(currencyCode),
      type: Value(type),
      description: Value(description),
      idempotencyKey: idempotencyKey == null && nullToAbsent
          ? const Value.absent()
          : Value(idempotencyKey),
      counterparty: counterparty == null && nullToAbsent
          ? const Value.absent()
          : Value(counterparty),
      createdAt: Value(createdAt),
    );
  }

  factory LedgerEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LedgerEntry(
      id: serializer.fromJson<String>(json['id']),
      accountId: serializer.fromJson<String>(json['accountId']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      type: serializer.fromJson<String>(json['type']),
      description: serializer.fromJson<String>(json['description']),
      idempotencyKey: serializer.fromJson<String?>(json['idempotencyKey']),
      counterparty: serializer.fromJson<String?>(json['counterparty']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'accountId': serializer.toJson<String>(accountId),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'type': serializer.toJson<String>(type),
      'description': serializer.toJson<String>(description),
      'idempotencyKey': serializer.toJson<String?>(idempotencyKey),
      'counterparty': serializer.toJson<String?>(counterparty),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LedgerEntry copyWith({
    String? id,
    String? accountId,
    int? amountMinor,
    String? currencyCode,
    String? type,
    String? description,
    Value<String?> idempotencyKey = const Value.absent(),
    Value<String?> counterparty = const Value.absent(),
    DateTime? createdAt,
  }) => LedgerEntry(
    id: id ?? this.id,
    accountId: accountId ?? this.accountId,
    amountMinor: amountMinor ?? this.amountMinor,
    currencyCode: currencyCode ?? this.currencyCode,
    type: type ?? this.type,
    description: description ?? this.description,
    idempotencyKey: idempotencyKey.present
        ? idempotencyKey.value
        : this.idempotencyKey,
    counterparty: counterparty.present ? counterparty.value : this.counterparty,
    createdAt: createdAt ?? this.createdAt,
  );
  LedgerEntry copyWithCompanion(LedgerEntriesCompanion data) {
    return LedgerEntry(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      type: data.type.present ? data.type.value : this.type,
      description: data.description.present
          ? data.description.value
          : this.description,
      idempotencyKey: data.idempotencyKey.present
          ? data.idempotencyKey.value
          : this.idempotencyKey,
      counterparty: data.counterparty.present
          ? data.counterparty.value
          : this.counterparty,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LedgerEntry(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('idempotencyKey: $idempotencyKey, ')
          ..write('counterparty: $counterparty, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    accountId,
    amountMinor,
    currencyCode,
    type,
    description,
    idempotencyKey,
    counterparty,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LedgerEntry &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.amountMinor == this.amountMinor &&
          other.currencyCode == this.currencyCode &&
          other.type == this.type &&
          other.description == this.description &&
          other.idempotencyKey == this.idempotencyKey &&
          other.counterparty == this.counterparty &&
          other.createdAt == this.createdAt);
}

class LedgerEntriesCompanion extends UpdateCompanion<LedgerEntry> {
  final Value<String> id;
  final Value<String> accountId;
  final Value<int> amountMinor;
  final Value<String> currencyCode;
  final Value<String> type;
  final Value<String> description;
  final Value<String?> idempotencyKey;
  final Value<String?> counterparty;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const LedgerEntriesCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.idempotencyKey = const Value.absent(),
    this.counterparty = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LedgerEntriesCompanion.insert({
    required String id,
    required String accountId,
    required int amountMinor,
    required String currencyCode,
    required String type,
    required String description,
    this.idempotencyKey = const Value.absent(),
    this.counterparty = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       accountId = Value(accountId),
       amountMinor = Value(amountMinor),
       currencyCode = Value(currencyCode),
       type = Value(type),
       description = Value(description);
  static Insertable<LedgerEntry> custom({
    Expression<String>? id,
    Expression<String>? accountId,
    Expression<int>? amountMinor,
    Expression<String>? currencyCode,
    Expression<String>? type,
    Expression<String>? description,
    Expression<String>? idempotencyKey,
    Expression<String>? counterparty,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'account_id': accountId,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (idempotencyKey != null) 'idempotency_key': idempotencyKey,
      if (counterparty != null) 'counterparty': counterparty,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LedgerEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? accountId,
    Value<int>? amountMinor,
    Value<String>? currencyCode,
    Value<String>? type,
    Value<String>? description,
    Value<String?>? idempotencyKey,
    Value<String?>? counterparty,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return LedgerEntriesCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      amountMinor: amountMinor ?? this.amountMinor,
      currencyCode: currencyCode ?? this.currencyCode,
      type: type ?? this.type,
      description: description ?? this.description,
      idempotencyKey: idempotencyKey ?? this.idempotencyKey,
      counterparty: counterparty ?? this.counterparty,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (idempotencyKey.present) {
      map['idempotency_key'] = Variable<String>(idempotencyKey.value);
    }
    if (counterparty.present) {
      map['counterparty'] = Variable<String>(counterparty.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LedgerEntriesCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('idempotencyKey: $idempotencyKey, ')
          ..write('counterparty: $counterparty, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MissionProgressTable extends MissionProgress
    with TableInfo<$MissionProgressTable, MissionProgressData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MissionProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _missionIdMeta = const VerificationMeta(
    'missionId',
  );
  @override
  late final GeneratedColumn<String> missionId = GeneratedColumn<String>(
    'mission_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unlockedMeta = const VerificationMeta(
    'unlocked',
  );
  @override
  late final GeneratedColumn<bool> unlocked = GeneratedColumn<bool>(
    'unlocked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("unlocked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _completedMeta = const VerificationMeta(
    'completed',
  );
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
    'completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _bestPerformanceMeta = const VerificationMeta(
    'bestPerformance',
  );
  @override
  late final GeneratedColumn<double> bestPerformance = GeneratedColumn<double>(
    'best_performance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    missionId,
    unlocked,
    completed,
    bestPerformance,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mission_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<MissionProgressData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('mission_id')) {
      context.handle(
        _missionIdMeta,
        missionId.isAcceptableOrUnknown(data['mission_id']!, _missionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_missionIdMeta);
    }
    if (data.containsKey('unlocked')) {
      context.handle(
        _unlockedMeta,
        unlocked.isAcceptableOrUnknown(data['unlocked']!, _unlockedMeta),
      );
    }
    if (data.containsKey('completed')) {
      context.handle(
        _completedMeta,
        completed.isAcceptableOrUnknown(data['completed']!, _completedMeta),
      );
    }
    if (data.containsKey('best_performance')) {
      context.handle(
        _bestPerformanceMeta,
        bestPerformance.isAcceptableOrUnknown(
          data['best_performance']!,
          _bestPerformanceMeta,
        ),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {missionId};
  @override
  MissionProgressData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MissionProgressData(
      missionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mission_id'],
      )!,
      unlocked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}unlocked'],
      )!,
      completed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}completed'],
      )!,
      bestPerformance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}best_performance'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $MissionProgressTable createAlias(String alias) {
    return $MissionProgressTable(attachedDatabase, alias);
  }
}

class MissionProgressData extends DataClass
    implements Insertable<MissionProgressData> {
  final String missionId;
  final bool unlocked;
  final bool completed;
  final double bestPerformance;
  final DateTime? completedAt;
  const MissionProgressData({
    required this.missionId,
    required this.unlocked,
    required this.completed,
    required this.bestPerformance,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['mission_id'] = Variable<String>(missionId);
    map['unlocked'] = Variable<bool>(unlocked);
    map['completed'] = Variable<bool>(completed);
    map['best_performance'] = Variable<double>(bestPerformance);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  MissionProgressCompanion toCompanion(bool nullToAbsent) {
    return MissionProgressCompanion(
      missionId: Value(missionId),
      unlocked: Value(unlocked),
      completed: Value(completed),
      bestPerformance: Value(bestPerformance),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory MissionProgressData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MissionProgressData(
      missionId: serializer.fromJson<String>(json['missionId']),
      unlocked: serializer.fromJson<bool>(json['unlocked']),
      completed: serializer.fromJson<bool>(json['completed']),
      bestPerformance: serializer.fromJson<double>(json['bestPerformance']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'missionId': serializer.toJson<String>(missionId),
      'unlocked': serializer.toJson<bool>(unlocked),
      'completed': serializer.toJson<bool>(completed),
      'bestPerformance': serializer.toJson<double>(bestPerformance),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  MissionProgressData copyWith({
    String? missionId,
    bool? unlocked,
    bool? completed,
    double? bestPerformance,
    Value<DateTime?> completedAt = const Value.absent(),
  }) => MissionProgressData(
    missionId: missionId ?? this.missionId,
    unlocked: unlocked ?? this.unlocked,
    completed: completed ?? this.completed,
    bestPerformance: bestPerformance ?? this.bestPerformance,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  MissionProgressData copyWithCompanion(MissionProgressCompanion data) {
    return MissionProgressData(
      missionId: data.missionId.present ? data.missionId.value : this.missionId,
      unlocked: data.unlocked.present ? data.unlocked.value : this.unlocked,
      completed: data.completed.present ? data.completed.value : this.completed,
      bestPerformance: data.bestPerformance.present
          ? data.bestPerformance.value
          : this.bestPerformance,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MissionProgressData(')
          ..write('missionId: $missionId, ')
          ..write('unlocked: $unlocked, ')
          ..write('completed: $completed, ')
          ..write('bestPerformance: $bestPerformance, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(missionId, unlocked, completed, bestPerformance, completedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MissionProgressData &&
          other.missionId == this.missionId &&
          other.unlocked == this.unlocked &&
          other.completed == this.completed &&
          other.bestPerformance == this.bestPerformance &&
          other.completedAt == this.completedAt);
}

class MissionProgressCompanion extends UpdateCompanion<MissionProgressData> {
  final Value<String> missionId;
  final Value<bool> unlocked;
  final Value<bool> completed;
  final Value<double> bestPerformance;
  final Value<DateTime?> completedAt;
  final Value<int> rowid;
  const MissionProgressCompanion({
    this.missionId = const Value.absent(),
    this.unlocked = const Value.absent(),
    this.completed = const Value.absent(),
    this.bestPerformance = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MissionProgressCompanion.insert({
    required String missionId,
    this.unlocked = const Value.absent(),
    this.completed = const Value.absent(),
    this.bestPerformance = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : missionId = Value(missionId);
  static Insertable<MissionProgressData> custom({
    Expression<String>? missionId,
    Expression<bool>? unlocked,
    Expression<bool>? completed,
    Expression<double>? bestPerformance,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (missionId != null) 'mission_id': missionId,
      if (unlocked != null) 'unlocked': unlocked,
      if (completed != null) 'completed': completed,
      if (bestPerformance != null) 'best_performance': bestPerformance,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MissionProgressCompanion copyWith({
    Value<String>? missionId,
    Value<bool>? unlocked,
    Value<bool>? completed,
    Value<double>? bestPerformance,
    Value<DateTime?>? completedAt,
    Value<int>? rowid,
  }) {
    return MissionProgressCompanion(
      missionId: missionId ?? this.missionId,
      unlocked: unlocked ?? this.unlocked,
      completed: completed ?? this.completed,
      bestPerformance: bestPerformance ?? this.bestPerformance,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (missionId.present) {
      map['mission_id'] = Variable<String>(missionId.value);
    }
    if (unlocked.present) {
      map['unlocked'] = Variable<bool>(unlocked.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (bestPerformance.present) {
      map['best_performance'] = Variable<double>(bestPerformance.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MissionProgressCompanion(')
          ..write('missionId: $missionId, ')
          ..write('unlocked: $unlocked, ')
          ..write('completed: $completed, ')
          ..write('bestPerformance: $bestPerformance, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FxCacheTable extends FxCache with TableInfo<$FxCacheTable, FxCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FxCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _baseCurrencyMeta = const VerificationMeta(
    'baseCurrency',
  );
  @override
  late final GeneratedColumn<String> baseCurrency = GeneratedColumn<String>(
    'base_currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quoteCurrencyMeta = const VerificationMeta(
    'quoteCurrency',
  );
  @override
  late final GeneratedColumn<String> quoteCurrency = GeneratedColumn<String>(
    'quote_currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<double> rate = GeneratedColumn<double>(
    'rate',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fetchedAtMeta = const VerificationMeta(
    'fetchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> fetchedAt = GeneratedColumn<DateTime>(
    'fetched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    baseCurrency,
    quoteCurrency,
    rate,
    fetchedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fx_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<FxCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('base_currency')) {
      context.handle(
        _baseCurrencyMeta,
        baseCurrency.isAcceptableOrUnknown(
          data['base_currency']!,
          _baseCurrencyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_baseCurrencyMeta);
    }
    if (data.containsKey('quote_currency')) {
      context.handle(
        _quoteCurrencyMeta,
        quoteCurrency.isAcceptableOrUnknown(
          data['quote_currency']!,
          _quoteCurrencyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quoteCurrencyMeta);
    }
    if (data.containsKey('rate')) {
      context.handle(
        _rateMeta,
        rate.isAcceptableOrUnknown(data['rate']!, _rateMeta),
      );
    } else if (isInserting) {
      context.missing(_rateMeta);
    }
    if (data.containsKey('fetched_at')) {
      context.handle(
        _fetchedAtMeta,
        fetchedAt.isAcceptableOrUnknown(data['fetched_at']!, _fetchedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_fetchedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {baseCurrency, quoteCurrency};
  @override
  FxCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FxCacheData(
      baseCurrency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}base_currency'],
      )!,
      quoteCurrency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quote_currency'],
      )!,
      rate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rate'],
      )!,
      fetchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fetched_at'],
      )!,
    );
  }

  @override
  $FxCacheTable createAlias(String alias) {
    return $FxCacheTable(attachedDatabase, alias);
  }
}

class FxCacheData extends DataClass implements Insertable<FxCacheData> {
  final String baseCurrency;
  final String quoteCurrency;
  final double rate;
  final DateTime fetchedAt;
  const FxCacheData({
    required this.baseCurrency,
    required this.quoteCurrency,
    required this.rate,
    required this.fetchedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['base_currency'] = Variable<String>(baseCurrency);
    map['quote_currency'] = Variable<String>(quoteCurrency);
    map['rate'] = Variable<double>(rate);
    map['fetched_at'] = Variable<DateTime>(fetchedAt);
    return map;
  }

  FxCacheCompanion toCompanion(bool nullToAbsent) {
    return FxCacheCompanion(
      baseCurrency: Value(baseCurrency),
      quoteCurrency: Value(quoteCurrency),
      rate: Value(rate),
      fetchedAt: Value(fetchedAt),
    );
  }

  factory FxCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FxCacheData(
      baseCurrency: serializer.fromJson<String>(json['baseCurrency']),
      quoteCurrency: serializer.fromJson<String>(json['quoteCurrency']),
      rate: serializer.fromJson<double>(json['rate']),
      fetchedAt: serializer.fromJson<DateTime>(json['fetchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'baseCurrency': serializer.toJson<String>(baseCurrency),
      'quoteCurrency': serializer.toJson<String>(quoteCurrency),
      'rate': serializer.toJson<double>(rate),
      'fetchedAt': serializer.toJson<DateTime>(fetchedAt),
    };
  }

  FxCacheData copyWith({
    String? baseCurrency,
    String? quoteCurrency,
    double? rate,
    DateTime? fetchedAt,
  }) => FxCacheData(
    baseCurrency: baseCurrency ?? this.baseCurrency,
    quoteCurrency: quoteCurrency ?? this.quoteCurrency,
    rate: rate ?? this.rate,
    fetchedAt: fetchedAt ?? this.fetchedAt,
  );
  FxCacheData copyWithCompanion(FxCacheCompanion data) {
    return FxCacheData(
      baseCurrency: data.baseCurrency.present
          ? data.baseCurrency.value
          : this.baseCurrency,
      quoteCurrency: data.quoteCurrency.present
          ? data.quoteCurrency.value
          : this.quoteCurrency,
      rate: data.rate.present ? data.rate.value : this.rate,
      fetchedAt: data.fetchedAt.present ? data.fetchedAt.value : this.fetchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FxCacheData(')
          ..write('baseCurrency: $baseCurrency, ')
          ..write('quoteCurrency: $quoteCurrency, ')
          ..write('rate: $rate, ')
          ..write('fetchedAt: $fetchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(baseCurrency, quoteCurrency, rate, fetchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FxCacheData &&
          other.baseCurrency == this.baseCurrency &&
          other.quoteCurrency == this.quoteCurrency &&
          other.rate == this.rate &&
          other.fetchedAt == this.fetchedAt);
}

class FxCacheCompanion extends UpdateCompanion<FxCacheData> {
  final Value<String> baseCurrency;
  final Value<String> quoteCurrency;
  final Value<double> rate;
  final Value<DateTime> fetchedAt;
  final Value<int> rowid;
  const FxCacheCompanion({
    this.baseCurrency = const Value.absent(),
    this.quoteCurrency = const Value.absent(),
    this.rate = const Value.absent(),
    this.fetchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FxCacheCompanion.insert({
    required String baseCurrency,
    required String quoteCurrency,
    required double rate,
    required DateTime fetchedAt,
    this.rowid = const Value.absent(),
  }) : baseCurrency = Value(baseCurrency),
       quoteCurrency = Value(quoteCurrency),
       rate = Value(rate),
       fetchedAt = Value(fetchedAt);
  static Insertable<FxCacheData> custom({
    Expression<String>? baseCurrency,
    Expression<String>? quoteCurrency,
    Expression<double>? rate,
    Expression<DateTime>? fetchedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (baseCurrency != null) 'base_currency': baseCurrency,
      if (quoteCurrency != null) 'quote_currency': quoteCurrency,
      if (rate != null) 'rate': rate,
      if (fetchedAt != null) 'fetched_at': fetchedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FxCacheCompanion copyWith({
    Value<String>? baseCurrency,
    Value<String>? quoteCurrency,
    Value<double>? rate,
    Value<DateTime>? fetchedAt,
    Value<int>? rowid,
  }) {
    return FxCacheCompanion(
      baseCurrency: baseCurrency ?? this.baseCurrency,
      quoteCurrency: quoteCurrency ?? this.quoteCurrency,
      rate: rate ?? this.rate,
      fetchedAt: fetchedAt ?? this.fetchedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (baseCurrency.present) {
      map['base_currency'] = Variable<String>(baseCurrency.value);
    }
    if (quoteCurrency.present) {
      map['quote_currency'] = Variable<String>(quoteCurrency.value);
    }
    if (rate.present) {
      map['rate'] = Variable<double>(rate.value);
    }
    if (fetchedAt.present) {
      map['fetched_at'] = Variable<DateTime>(fetchedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FxCacheCompanion(')
          ..write('baseCurrency: $baseCurrency, ')
          ..write('quoteCurrency: $quoteCurrency, ')
          ..write('rate: $rate, ')
          ..write('fetchedAt: $fetchedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BudgetItemsTable extends BudgetItems
    with TableInfo<$BudgetItemsTable, BudgetItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BudgetItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isIncomeMeta = const VerificationMeta(
    'isIncome',
  );
  @override
  late final GeneratedColumn<bool> isIncome = GeneratedColumn<bool>(
    'is_income',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_income" IN (0, 1))',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    category,
    amountMinor,
    isIncome,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budget_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<BudgetItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('is_income')) {
      context.handle(
        _isIncomeMeta,
        isIncome.isAcceptableOrUnknown(data['is_income']!, _isIncomeMeta),
      );
    } else if (isInserting) {
      context.missing(_isIncomeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BudgetItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BudgetItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      amountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_minor'],
      )!,
      isIncome: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_income'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $BudgetItemsTable createAlias(String alias) {
    return $BudgetItemsTable(attachedDatabase, alias);
  }
}

class BudgetItem extends DataClass implements Insertable<BudgetItem> {
  final String id;
  final String category;
  final int amountMinor;
  final bool isIncome;
  final DateTime createdAt;
  const BudgetItem({
    required this.id,
    required this.category,
    required this.amountMinor,
    required this.isIncome,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['category'] = Variable<String>(category);
    map['amount_minor'] = Variable<int>(amountMinor);
    map['is_income'] = Variable<bool>(isIncome);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BudgetItemsCompanion toCompanion(bool nullToAbsent) {
    return BudgetItemsCompanion(
      id: Value(id),
      category: Value(category),
      amountMinor: Value(amountMinor),
      isIncome: Value(isIncome),
      createdAt: Value(createdAt),
    );
  }

  factory BudgetItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BudgetItem(
      id: serializer.fromJson<String>(json['id']),
      category: serializer.fromJson<String>(json['category']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      isIncome: serializer.fromJson<bool>(json['isIncome']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'category': serializer.toJson<String>(category),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'isIncome': serializer.toJson<bool>(isIncome),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BudgetItem copyWith({
    String? id,
    String? category,
    int? amountMinor,
    bool? isIncome,
    DateTime? createdAt,
  }) => BudgetItem(
    id: id ?? this.id,
    category: category ?? this.category,
    amountMinor: amountMinor ?? this.amountMinor,
    isIncome: isIncome ?? this.isIncome,
    createdAt: createdAt ?? this.createdAt,
  );
  BudgetItem copyWithCompanion(BudgetItemsCompanion data) {
    return BudgetItem(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
      amountMinor: data.amountMinor.present
          ? data.amountMinor.value
          : this.amountMinor,
      isIncome: data.isIncome.present ? data.isIncome.value : this.isIncome,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BudgetItem(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('isIncome: $isIncome, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, category, amountMinor, isIncome, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BudgetItem &&
          other.id == this.id &&
          other.category == this.category &&
          other.amountMinor == this.amountMinor &&
          other.isIncome == this.isIncome &&
          other.createdAt == this.createdAt);
}

class BudgetItemsCompanion extends UpdateCompanion<BudgetItem> {
  final Value<String> id;
  final Value<String> category;
  final Value<int> amountMinor;
  final Value<bool> isIncome;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const BudgetItemsCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.isIncome = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BudgetItemsCompanion.insert({
    required String id,
    required String category,
    required int amountMinor,
    required bool isIncome,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       category = Value(category),
       amountMinor = Value(amountMinor),
       isIncome = Value(isIncome);
  static Insertable<BudgetItem> custom({
    Expression<String>? id,
    Expression<String>? category,
    Expression<int>? amountMinor,
    Expression<bool>? isIncome,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (isIncome != null) 'is_income': isIncome,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BudgetItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? category,
    Value<int>? amountMinor,
    Value<bool>? isIncome,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return BudgetItemsCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      amountMinor: amountMinor ?? this.amountMinor,
      isIncome: isIncome ?? this.isIncome,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (isIncome.present) {
      map['is_income'] = Variable<bool>(isIncome.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetItemsCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('isIncome: $isIncome, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SavingsGoalsTable extends SavingsGoals
    with TableInfo<$SavingsGoalsTable, SavingsGoal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavingsGoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetMinorMeta = const VerificationMeta(
    'targetMinor',
  );
  @override
  late final GeneratedColumn<int> targetMinor = GeneratedColumn<int>(
    'target_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _savedMinorMeta = const VerificationMeta(
    'savedMinor',
  );
  @override
  late final GeneratedColumn<int> savedMinor = GeneratedColumn<int>(
    'saved_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    targetMinor,
    savedMinor,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'savings_goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<SavingsGoal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('target_minor')) {
      context.handle(
        _targetMinorMeta,
        targetMinor.isAcceptableOrUnknown(
          data['target_minor']!,
          _targetMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetMinorMeta);
    }
    if (data.containsKey('saved_minor')) {
      context.handle(
        _savedMinorMeta,
        savedMinor.isAcceptableOrUnknown(data['saved_minor']!, _savedMinorMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavingsGoal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavingsGoal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      targetMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_minor'],
      )!,
      savedMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}saved_minor'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SavingsGoalsTable createAlias(String alias) {
    return $SavingsGoalsTable(attachedDatabase, alias);
  }
}

class SavingsGoal extends DataClass implements Insertable<SavingsGoal> {
  final String id;
  final String title;
  final int targetMinor;
  final int savedMinor;
  final DateTime createdAt;
  const SavingsGoal({
    required this.id,
    required this.title,
    required this.targetMinor,
    required this.savedMinor,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['target_minor'] = Variable<int>(targetMinor);
    map['saved_minor'] = Variable<int>(savedMinor);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SavingsGoalsCompanion toCompanion(bool nullToAbsent) {
    return SavingsGoalsCompanion(
      id: Value(id),
      title: Value(title),
      targetMinor: Value(targetMinor),
      savedMinor: Value(savedMinor),
      createdAt: Value(createdAt),
    );
  }

  factory SavingsGoal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavingsGoal(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      targetMinor: serializer.fromJson<int>(json['targetMinor']),
      savedMinor: serializer.fromJson<int>(json['savedMinor']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'targetMinor': serializer.toJson<int>(targetMinor),
      'savedMinor': serializer.toJson<int>(savedMinor),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SavingsGoal copyWith({
    String? id,
    String? title,
    int? targetMinor,
    int? savedMinor,
    DateTime? createdAt,
  }) => SavingsGoal(
    id: id ?? this.id,
    title: title ?? this.title,
    targetMinor: targetMinor ?? this.targetMinor,
    savedMinor: savedMinor ?? this.savedMinor,
    createdAt: createdAt ?? this.createdAt,
  );
  SavingsGoal copyWithCompanion(SavingsGoalsCompanion data) {
    return SavingsGoal(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      targetMinor: data.targetMinor.present
          ? data.targetMinor.value
          : this.targetMinor,
      savedMinor: data.savedMinor.present
          ? data.savedMinor.value
          : this.savedMinor,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavingsGoal(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('targetMinor: $targetMinor, ')
          ..write('savedMinor: $savedMinor, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, targetMinor, savedMinor, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavingsGoal &&
          other.id == this.id &&
          other.title == this.title &&
          other.targetMinor == this.targetMinor &&
          other.savedMinor == this.savedMinor &&
          other.createdAt == this.createdAt);
}

class SavingsGoalsCompanion extends UpdateCompanion<SavingsGoal> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> targetMinor;
  final Value<int> savedMinor;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const SavingsGoalsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.targetMinor = const Value.absent(),
    this.savedMinor = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SavingsGoalsCompanion.insert({
    required String id,
    required String title,
    required int targetMinor,
    this.savedMinor = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       targetMinor = Value(targetMinor);
  static Insertable<SavingsGoal> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? targetMinor,
    Expression<int>? savedMinor,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (targetMinor != null) 'target_minor': targetMinor,
      if (savedMinor != null) 'saved_minor': savedMinor,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SavingsGoalsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<int>? targetMinor,
    Value<int>? savedMinor,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return SavingsGoalsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      targetMinor: targetMinor ?? this.targetMinor,
      savedMinor: savedMinor ?? this.savedMinor,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (targetMinor.present) {
      map['target_minor'] = Variable<int>(targetMinor.value);
    }
    if (savedMinor.present) {
      map['saved_minor'] = Variable<int>(savedMinor.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavingsGoalsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('targetMinor: $targetMinor, ')
          ..write('savedMinor: $savedMinor, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProfilesTable profiles = $ProfilesTable(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $BankCardsTable bankCards = $BankCardsTable(this);
  late final $CardVaultSecretsTable cardVaultSecrets = $CardVaultSecretsTable(
    this,
  );
  late final $DepositAccountsTable depositAccounts = $DepositAccountsTable(
    this,
  );
  late final $DirectoryUsersTable directoryUsers = $DirectoryUsersTable(this);
  late final $LedgerEntriesTable ledgerEntries = $LedgerEntriesTable(this);
  late final $MissionProgressTable missionProgress = $MissionProgressTable(
    this,
  );
  late final $FxCacheTable fxCache = $FxCacheTable(this);
  late final $BudgetItemsTable budgetItems = $BudgetItemsTable(this);
  late final $SavingsGoalsTable savingsGoals = $SavingsGoalsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    profiles,
    accounts,
    bankCards,
    cardVaultSecrets,
    depositAccounts,
    directoryUsers,
    ledgerEntries,
    missionProgress,
    fxCache,
    budgetItems,
    savingsGoals,
  ];
}

typedef $$ProfilesTableCreateCompanionBuilder = ProfilesCompanion Function({
  Value<int> id,
  Value<String> displayName,
  Value<String> handle,
  required String homeMarketId,
  Value<int> xp,
  Value<int> boostSpendMinor,
  Value<double> accuracySum,
  Value<int> accuracyCount,
  Value<bool> onboarded,
  Value<int> hintsOwned,
  Value<int> retriesOwned,
  Value<bool> themeBadge,
  Value<bool> biometricsEnabled,
  Value<DateTime> createdAt,
});
typedef $$ProfilesTableUpdateCompanionBuilder = ProfilesCompanion Function({
  Value<int> id,
  Value<String> displayName,
  Value<String> handle,
  Value<String> homeMarketId,
  Value<int> xp,
  Value<int> boostSpendMinor,
  Value<double> accuracySum,
  Value<int> accuracyCount,
  Value<bool> onboarded,
  Value<int> hintsOwned,
  Value<int> retriesOwned,
  Value<bool> themeBadge,
  Value<bool> biometricsEnabled,
  Value<DateTime> createdAt,
});

class $$ProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get handle => $composableBuilder(
    column: $table.handle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homeMarketId => $composableBuilder(
    column: $table.homeMarketId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get xp => $composableBuilder(
    column: $table.xp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get boostSpendMinor => $composableBuilder(
    column: $table.boostSpendMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get accuracySum => $composableBuilder(
    column: $table.accuracySum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get accuracyCount => $composableBuilder(
    column: $table.accuracyCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get onboarded => $composableBuilder(
    column: $table.onboarded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hintsOwned => $composableBuilder(
    column: $table.hintsOwned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retriesOwned => $composableBuilder(
    column: $table.retriesOwned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get themeBadge => $composableBuilder(
    column: $table.themeBadge,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get biometricsEnabled => $composableBuilder(
    column: $table.biometricsEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get handle => $composableBuilder(
    column: $table.handle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homeMarketId => $composableBuilder(
    column: $table.homeMarketId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get xp => $composableBuilder(
    column: $table.xp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get boostSpendMinor => $composableBuilder(
    column: $table.boostSpendMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get accuracySum => $composableBuilder(
    column: $table.accuracySum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get accuracyCount => $composableBuilder(
    column: $table.accuracyCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get onboarded => $composableBuilder(
    column: $table.onboarded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hintsOwned => $composableBuilder(
    column: $table.hintsOwned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retriesOwned => $composableBuilder(
    column: $table.retriesOwned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get themeBadge => $composableBuilder(
    column: $table.themeBadge,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get biometricsEnabled => $composableBuilder(
    column: $table.biometricsEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get handle =>
      $composableBuilder(column: $table.handle, builder: (column) => column);

  GeneratedColumn<String> get homeMarketId => $composableBuilder(
    column: $table.homeMarketId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get xp =>
      $composableBuilder(column: $table.xp, builder: (column) => column);

  GeneratedColumn<int> get boostSpendMinor => $composableBuilder(
    column: $table.boostSpendMinor,
    builder: (column) => column,
  );

  GeneratedColumn<double> get accuracySum => $composableBuilder(
    column: $table.accuracySum,
    builder: (column) => column,
  );

  GeneratedColumn<int> get accuracyCount => $composableBuilder(
    column: $table.accuracyCount,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get onboarded =>
      $composableBuilder(column: $table.onboarded, builder: (column) => column);

  GeneratedColumn<int> get hintsOwned => $composableBuilder(
    column: $table.hintsOwned,
    builder: (column) => column,
  );

  GeneratedColumn<int> get retriesOwned => $composableBuilder(
    column: $table.retriesOwned,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get themeBadge => $composableBuilder(
    column: $table.themeBadge,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get biometricsEnabled => $composableBuilder(
    column: $table.biometricsEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfilesTable,
          Profile,
          $$ProfilesTableFilterComposer,
          $$ProfilesTableOrderingComposer,
          $$ProfilesTableAnnotationComposer,
          $$ProfilesTableCreateCompanionBuilder,
          $$ProfilesTableUpdateCompanionBuilder,
          (Profile, BaseReferences<_$AppDatabase, $ProfilesTable, Profile>),
          Profile,
          PrefetchHooks Function()
        > {
  $$ProfilesTableTableManager(_$AppDatabase db, $ProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String> handle = const Value.absent(),
                Value<String> homeMarketId = const Value.absent(),
                Value<int> xp = const Value.absent(),
                Value<int> boostSpendMinor = const Value.absent(),
                Value<double> accuracySum = const Value.absent(),
                Value<int> accuracyCount = const Value.absent(),
                Value<bool> onboarded = const Value.absent(),
                Value<int> hintsOwned = const Value.absent(),
                Value<int> retriesOwned = const Value.absent(),
                Value<bool> themeBadge = const Value.absent(),
                Value<bool> biometricsEnabled = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProfilesCompanion(
                id: id,
                displayName: displayName,
                handle: handle,
                homeMarketId: homeMarketId,
                xp: xp,
                boostSpendMinor: boostSpendMinor,
                accuracySum: accuracySum,
                accuracyCount: accuracyCount,
                onboarded: onboarded,
                hintsOwned: hintsOwned,
                retriesOwned: retriesOwned,
                themeBadge: themeBadge,
                biometricsEnabled: biometricsEnabled,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String> handle = const Value.absent(),
                required String homeMarketId,
                Value<int> xp = const Value.absent(),
                Value<int> boostSpendMinor = const Value.absent(),
                Value<double> accuracySum = const Value.absent(),
                Value<int> accuracyCount = const Value.absent(),
                Value<bool> onboarded = const Value.absent(),
                Value<int> hintsOwned = const Value.absent(),
                Value<int> retriesOwned = const Value.absent(),
                Value<bool> themeBadge = const Value.absent(),
                Value<bool> biometricsEnabled = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProfilesCompanion.insert(
                id: id,
                displayName: displayName,
                handle: handle,
                homeMarketId: homeMarketId,
                xp: xp,
                boostSpendMinor: boostSpendMinor,
                accuracySum: accuracySum,
                accuracyCount: accuracyCount,
                onboarded: onboarded,
                hintsOwned: hintsOwned,
                retriesOwned: retriesOwned,
                themeBadge: themeBadge,
                biometricsEnabled: biometricsEnabled,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfilesTable,
      Profile,
      $$ProfilesTableFilterComposer,
      $$ProfilesTableOrderingComposer,
      $$ProfilesTableAnnotationComposer,
      $$ProfilesTableCreateCompanionBuilder,
      $$ProfilesTableUpdateCompanionBuilder,
      (Profile, BaseReferences<_$AppDatabase, $ProfilesTable, Profile>),
      Profile,
      PrefetchHooks Function()
    >;
typedef $$AccountsTableCreateCompanionBuilder = AccountsCompanion Function({
  required String id,
  required String name,
  required String currencyCode,
  Value<int> balanceMinor,
  Value<String> kind,
  Value<String?> ownerHandle,
  Value<int> rowid,
});
typedef $$AccountsTableUpdateCompanionBuilder = AccountsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> currencyCode,
  Value<int> balanceMinor,
  Value<String> kind,
  Value<String?> ownerHandle,
  Value<int> rowid,
});

class $$AccountsTableFilterComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get balanceMinor => $composableBuilder(
    column: $table.balanceMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerHandle => $composableBuilder(
    column: $table.ownerHandle,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get balanceMinor => $composableBuilder(
    column: $table.balanceMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerHandle => $composableBuilder(
    column: $table.ownerHandle,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<int> get balanceMinor => $composableBuilder(
    column: $table.balanceMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get ownerHandle => $composableBuilder(
    column: $table.ownerHandle,
    builder: (column) => column,
  );
}

class $$AccountsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountsTable,
          Account,
          $$AccountsTableFilterComposer,
          $$AccountsTableOrderingComposer,
          $$AccountsTableAnnotationComposer,
          $$AccountsTableCreateCompanionBuilder,
          $$AccountsTableUpdateCompanionBuilder,
          (Account, BaseReferences<_$AppDatabase, $AccountsTable, Account>),
          Account,
          PrefetchHooks Function()
        > {
  $$AccountsTableTableManager(_$AppDatabase db, $AccountsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<int> balanceMinor = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String?> ownerHandle = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AccountsCompanion(
                id: id,
                name: name,
                currencyCode: currencyCode,
                balanceMinor: balanceMinor,
                kind: kind,
                ownerHandle: ownerHandle,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String currencyCode,
                Value<int> balanceMinor = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String?> ownerHandle = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AccountsCompanion.insert(
                id: id,
                name: name,
                currencyCode: currencyCode,
                balanceMinor: balanceMinor,
                kind: kind,
                ownerHandle: ownerHandle,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AccountsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountsTable,
      Account,
      $$AccountsTableFilterComposer,
      $$AccountsTableOrderingComposer,
      $$AccountsTableAnnotationComposer,
      $$AccountsTableCreateCompanionBuilder,
      $$AccountsTableUpdateCompanionBuilder,
      (Account, BaseReferences<_$AppDatabase, $AccountsTable, Account>),
      Account,
      PrefetchHooks Function()
    >;
typedef $$BankCardsTableCreateCompanionBuilder = BankCardsCompanion Function({
  required String id,
  required String accountId,
  required String token,
  required String lastFour,
  required String label,
  Value<bool> frozen,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$BankCardsTableUpdateCompanionBuilder = BankCardsCompanion Function({
  Value<String> id,
  Value<String> accountId,
  Value<String> token,
  Value<String> lastFour,
  Value<String> label,
  Value<bool> frozen,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$BankCardsTableFilterComposer
    extends Composer<_$AppDatabase, $BankCardsTable> {
  $$BankCardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastFour => $composableBuilder(
    column: $table.lastFour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get frozen => $composableBuilder(
    column: $table.frozen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BankCardsTableOrderingComposer
    extends Composer<_$AppDatabase, $BankCardsTable> {
  $$BankCardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastFour => $composableBuilder(
    column: $table.lastFour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get frozen => $composableBuilder(
    column: $table.frozen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BankCardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BankCardsTable> {
  $$BankCardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);

  GeneratedColumn<String> get lastFour =>
      $composableBuilder(column: $table.lastFour, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<bool> get frozen =>
      $composableBuilder(column: $table.frozen, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$BankCardsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BankCardsTable,
          BankCard,
          $$BankCardsTableFilterComposer,
          $$BankCardsTableOrderingComposer,
          $$BankCardsTableAnnotationComposer,
          $$BankCardsTableCreateCompanionBuilder,
          $$BankCardsTableUpdateCompanionBuilder,
          (BankCard, BaseReferences<_$AppDatabase, $BankCardsTable, BankCard>),
          BankCard,
          PrefetchHooks Function()
        > {
  $$BankCardsTableTableManager(_$AppDatabase db, $BankCardsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BankCardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BankCardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BankCardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> accountId = const Value.absent(),
                Value<String> token = const Value.absent(),
                Value<String> lastFour = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<bool> frozen = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BankCardsCompanion(
                id: id,
                accountId: accountId,
                token: token,
                lastFour: lastFour,
                label: label,
                frozen: frozen,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String accountId,
                required String token,
                required String lastFour,
                required String label,
                Value<bool> frozen = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BankCardsCompanion.insert(
                id: id,
                accountId: accountId,
                token: token,
                lastFour: lastFour,
                label: label,
                frozen: frozen,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BankCardsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BankCardsTable,
      BankCard,
      $$BankCardsTableFilterComposer,
      $$BankCardsTableOrderingComposer,
      $$BankCardsTableAnnotationComposer,
      $$BankCardsTableCreateCompanionBuilder,
      $$BankCardsTableUpdateCompanionBuilder,
      (BankCard, BaseReferences<_$AppDatabase, $BankCardsTable, BankCard>),
      BankCard,
      PrefetchHooks Function()
    >;
typedef $$CardVaultSecretsTableCreateCompanionBuilder =
    CardVaultSecretsCompanion Function({
      required String token,
      required String pan,
      required String expiryMmYy,
      required String cvv,
      Value<int> rowid,
    });
typedef $$CardVaultSecretsTableUpdateCompanionBuilder =
    CardVaultSecretsCompanion Function({
      Value<String> token,
      Value<String> pan,
      Value<String> expiryMmYy,
      Value<String> cvv,
      Value<int> rowid,
    });

class $$CardVaultSecretsTableFilterComposer
    extends Composer<_$AppDatabase, $CardVaultSecretsTable> {
  $$CardVaultSecretsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pan => $composableBuilder(
    column: $table.pan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expiryMmYy => $composableBuilder(
    column: $table.expiryMmYy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cvv => $composableBuilder(
    column: $table.cvv,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CardVaultSecretsTableOrderingComposer
    extends Composer<_$AppDatabase, $CardVaultSecretsTable> {
  $$CardVaultSecretsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pan => $composableBuilder(
    column: $table.pan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expiryMmYy => $composableBuilder(
    column: $table.expiryMmYy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cvv => $composableBuilder(
    column: $table.cvv,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CardVaultSecretsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardVaultSecretsTable> {
  $$CardVaultSecretsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);

  GeneratedColumn<String> get pan =>
      $composableBuilder(column: $table.pan, builder: (column) => column);

  GeneratedColumn<String> get expiryMmYy => $composableBuilder(
    column: $table.expiryMmYy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cvv =>
      $composableBuilder(column: $table.cvv, builder: (column) => column);
}

class $$CardVaultSecretsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CardVaultSecretsTable,
          CardVaultSecret,
          $$CardVaultSecretsTableFilterComposer,
          $$CardVaultSecretsTableOrderingComposer,
          $$CardVaultSecretsTableAnnotationComposer,
          $$CardVaultSecretsTableCreateCompanionBuilder,
          $$CardVaultSecretsTableUpdateCompanionBuilder,
          (
            CardVaultSecret,
            BaseReferences<
              _$AppDatabase,
              $CardVaultSecretsTable,
              CardVaultSecret
            >,
          ),
          CardVaultSecret,
          PrefetchHooks Function()
        > {
  $$CardVaultSecretsTableTableManager(
    _$AppDatabase db,
    $CardVaultSecretsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardVaultSecretsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardVaultSecretsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardVaultSecretsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> token = const Value.absent(),
                Value<String> pan = const Value.absent(),
                Value<String> expiryMmYy = const Value.absent(),
                Value<String> cvv = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CardVaultSecretsCompanion(
                token: token,
                pan: pan,
                expiryMmYy: expiryMmYy,
                cvv: cvv,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String token,
                required String pan,
                required String expiryMmYy,
                required String cvv,
                Value<int> rowid = const Value.absent(),
              }) => CardVaultSecretsCompanion.insert(
                token: token,
                pan: pan,
                expiryMmYy: expiryMmYy,
                cvv: cvv,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CardVaultSecretsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CardVaultSecretsTable,
      CardVaultSecret,
      $$CardVaultSecretsTableFilterComposer,
      $$CardVaultSecretsTableOrderingComposer,
      $$CardVaultSecretsTableAnnotationComposer,
      $$CardVaultSecretsTableCreateCompanionBuilder,
      $$CardVaultSecretsTableUpdateCompanionBuilder,
      (
        CardVaultSecret,
        BaseReferences<_$AppDatabase, $CardVaultSecretsTable, CardVaultSecret>,
      ),
      CardVaultSecret,
      PrefetchHooks Function()
    >;
typedef $$DepositAccountsTableCreateCompanionBuilder =
    DepositAccountsCompanion Function({
      required String id,
      required String accountId,
      required String productId,
      Value<DateTime> openedAt,
      Value<DateTime> lastAccrualAt,
      Value<int> rowid,
    });
typedef $$DepositAccountsTableUpdateCompanionBuilder =
    DepositAccountsCompanion Function({
      Value<String> id,
      Value<String> accountId,
      Value<String> productId,
      Value<DateTime> openedAt,
      Value<DateTime> lastAccrualAt,
      Value<int> rowid,
    });

class $$DepositAccountsTableFilterComposer
    extends Composer<_$AppDatabase, $DepositAccountsTable> {
  $$DepositAccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get openedAt => $composableBuilder(
    column: $table.openedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastAccrualAt => $composableBuilder(
    column: $table.lastAccrualAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DepositAccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $DepositAccountsTable> {
  $$DepositAccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get openedAt => $composableBuilder(
    column: $table.openedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastAccrualAt => $composableBuilder(
    column: $table.lastAccrualAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DepositAccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DepositAccountsTable> {
  $$DepositAccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<DateTime> get openedAt =>
      $composableBuilder(column: $table.openedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastAccrualAt => $composableBuilder(
    column: $table.lastAccrualAt,
    builder: (column) => column,
  );
}

class $$DepositAccountsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DepositAccountsTable,
          DepositAccount,
          $$DepositAccountsTableFilterComposer,
          $$DepositAccountsTableOrderingComposer,
          $$DepositAccountsTableAnnotationComposer,
          $$DepositAccountsTableCreateCompanionBuilder,
          $$DepositAccountsTableUpdateCompanionBuilder,
          (
            DepositAccount,
            BaseReferences<
              _$AppDatabase,
              $DepositAccountsTable,
              DepositAccount
            >,
          ),
          DepositAccount,
          PrefetchHooks Function()
        > {
  $$DepositAccountsTableTableManager(
    _$AppDatabase db,
    $DepositAccountsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DepositAccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DepositAccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DepositAccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> accountId = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<DateTime> openedAt = const Value.absent(),
                Value<DateTime> lastAccrualAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DepositAccountsCompanion(
                id: id,
                accountId: accountId,
                productId: productId,
                openedAt: openedAt,
                lastAccrualAt: lastAccrualAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String accountId,
                required String productId,
                Value<DateTime> openedAt = const Value.absent(),
                Value<DateTime> lastAccrualAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DepositAccountsCompanion.insert(
                id: id,
                accountId: accountId,
                productId: productId,
                openedAt: openedAt,
                lastAccrualAt: lastAccrualAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DepositAccountsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DepositAccountsTable,
      DepositAccount,
      $$DepositAccountsTableFilterComposer,
      $$DepositAccountsTableOrderingComposer,
      $$DepositAccountsTableAnnotationComposer,
      $$DepositAccountsTableCreateCompanionBuilder,
      $$DepositAccountsTableUpdateCompanionBuilder,
      (
        DepositAccount,
        BaseReferences<_$AppDatabase, $DepositAccountsTable, DepositAccount>,
      ),
      DepositAccount,
      PrefetchHooks Function()
    >;
typedef $$DirectoryUsersTableCreateCompanionBuilder =
    DirectoryUsersCompanion Function({
      required String handle,
      required String displayName,
      required String accountId,
      Value<int> rowid,
    });
typedef $$DirectoryUsersTableUpdateCompanionBuilder =
    DirectoryUsersCompanion Function({
      Value<String> handle,
      Value<String> displayName,
      Value<String> accountId,
      Value<int> rowid,
    });

class $$DirectoryUsersTableFilterComposer
    extends Composer<_$AppDatabase, $DirectoryUsersTable> {
  $$DirectoryUsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get handle => $composableBuilder(
    column: $table.handle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DirectoryUsersTableOrderingComposer
    extends Composer<_$AppDatabase, $DirectoryUsersTable> {
  $$DirectoryUsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get handle => $composableBuilder(
    column: $table.handle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DirectoryUsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $DirectoryUsersTable> {
  $$DirectoryUsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get handle =>
      $composableBuilder(column: $table.handle, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);
}

class $$DirectoryUsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DirectoryUsersTable,
          DirectoryUser,
          $$DirectoryUsersTableFilterComposer,
          $$DirectoryUsersTableOrderingComposer,
          $$DirectoryUsersTableAnnotationComposer,
          $$DirectoryUsersTableCreateCompanionBuilder,
          $$DirectoryUsersTableUpdateCompanionBuilder,
          (
            DirectoryUser,
            BaseReferences<_$AppDatabase, $DirectoryUsersTable, DirectoryUser>,
          ),
          DirectoryUser,
          PrefetchHooks Function()
        > {
  $$DirectoryUsersTableTableManager(
    _$AppDatabase db,
    $DirectoryUsersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DirectoryUsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DirectoryUsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DirectoryUsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> handle = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String> accountId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DirectoryUsersCompanion(
                handle: handle,
                displayName: displayName,
                accountId: accountId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String handle,
                required String displayName,
                required String accountId,
                Value<int> rowid = const Value.absent(),
              }) => DirectoryUsersCompanion.insert(
                handle: handle,
                displayName: displayName,
                accountId: accountId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DirectoryUsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DirectoryUsersTable,
      DirectoryUser,
      $$DirectoryUsersTableFilterComposer,
      $$DirectoryUsersTableOrderingComposer,
      $$DirectoryUsersTableAnnotationComposer,
      $$DirectoryUsersTableCreateCompanionBuilder,
      $$DirectoryUsersTableUpdateCompanionBuilder,
      (
        DirectoryUser,
        BaseReferences<_$AppDatabase, $DirectoryUsersTable, DirectoryUser>,
      ),
      DirectoryUser,
      PrefetchHooks Function()
    >;
typedef $$LedgerEntriesTableCreateCompanionBuilder =
    LedgerEntriesCompanion Function({
      required String id,
      required String accountId,
      required int amountMinor,
      required String currencyCode,
      required String type,
      required String description,
      Value<String?> idempotencyKey,
      Value<String?> counterparty,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$LedgerEntriesTableUpdateCompanionBuilder =
    LedgerEntriesCompanion Function({
      Value<String> id,
      Value<String> accountId,
      Value<int> amountMinor,
      Value<String> currencyCode,
      Value<String> type,
      Value<String> description,
      Value<String?> idempotencyKey,
      Value<String?> counterparty,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$LedgerEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $LedgerEntriesTable> {
  $$LedgerEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get counterparty => $composableBuilder(
    column: $table.counterparty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LedgerEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $LedgerEntriesTable> {
  $$LedgerEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get counterparty => $composableBuilder(
    column: $table.counterparty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LedgerEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LedgerEntriesTable> {
  $$LedgerEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get counterparty => $composableBuilder(
    column: $table.counterparty,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LedgerEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LedgerEntriesTable,
          LedgerEntry,
          $$LedgerEntriesTableFilterComposer,
          $$LedgerEntriesTableOrderingComposer,
          $$LedgerEntriesTableAnnotationComposer,
          $$LedgerEntriesTableCreateCompanionBuilder,
          $$LedgerEntriesTableUpdateCompanionBuilder,
          (
            LedgerEntry,
            BaseReferences<_$AppDatabase, $LedgerEntriesTable, LedgerEntry>,
          ),
          LedgerEntry,
          PrefetchHooks Function()
        > {
  $$LedgerEntriesTableTableManager(_$AppDatabase db, $LedgerEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LedgerEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LedgerEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LedgerEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> accountId = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> idempotencyKey = const Value.absent(),
                Value<String?> counterparty = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LedgerEntriesCompanion(
                id: id,
                accountId: accountId,
                amountMinor: amountMinor,
                currencyCode: currencyCode,
                type: type,
                description: description,
                idempotencyKey: idempotencyKey,
                counterparty: counterparty,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String accountId,
                required int amountMinor,
                required String currencyCode,
                required String type,
                required String description,
                Value<String?> idempotencyKey = const Value.absent(),
                Value<String?> counterparty = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LedgerEntriesCompanion.insert(
                id: id,
                accountId: accountId,
                amountMinor: amountMinor,
                currencyCode: currencyCode,
                type: type,
                description: description,
                idempotencyKey: idempotencyKey,
                counterparty: counterparty,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LedgerEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LedgerEntriesTable,
      LedgerEntry,
      $$LedgerEntriesTableFilterComposer,
      $$LedgerEntriesTableOrderingComposer,
      $$LedgerEntriesTableAnnotationComposer,
      $$LedgerEntriesTableCreateCompanionBuilder,
      $$LedgerEntriesTableUpdateCompanionBuilder,
      (
        LedgerEntry,
        BaseReferences<_$AppDatabase, $LedgerEntriesTable, LedgerEntry>,
      ),
      LedgerEntry,
      PrefetchHooks Function()
    >;
typedef $$MissionProgressTableCreateCompanionBuilder =
    MissionProgressCompanion Function({
      required String missionId,
      Value<bool> unlocked,
      Value<bool> completed,
      Value<double> bestPerformance,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });
typedef $$MissionProgressTableUpdateCompanionBuilder =
    MissionProgressCompanion Function({
      Value<String> missionId,
      Value<bool> unlocked,
      Value<bool> completed,
      Value<double> bestPerformance,
      Value<DateTime?> completedAt,
      Value<int> rowid,
    });

class $$MissionProgressTableFilterComposer
    extends Composer<_$AppDatabase, $MissionProgressTable> {
  $$MissionProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get missionId => $composableBuilder(
    column: $table.missionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get unlocked => $composableBuilder(
    column: $table.unlocked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get bestPerformance => $composableBuilder(
    column: $table.bestPerformance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MissionProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $MissionProgressTable> {
  $$MissionProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get missionId => $composableBuilder(
    column: $table.missionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get unlocked => $composableBuilder(
    column: $table.unlocked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get bestPerformance => $composableBuilder(
    column: $table.bestPerformance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MissionProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $MissionProgressTable> {
  $$MissionProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get missionId =>
      $composableBuilder(column: $table.missionId, builder: (column) => column);

  GeneratedColumn<bool> get unlocked =>
      $composableBuilder(column: $table.unlocked, builder: (column) => column);

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  GeneratedColumn<double> get bestPerformance => $composableBuilder(
    column: $table.bestPerformance,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$MissionProgressTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MissionProgressTable,
          MissionProgressData,
          $$MissionProgressTableFilterComposer,
          $$MissionProgressTableOrderingComposer,
          $$MissionProgressTableAnnotationComposer,
          $$MissionProgressTableCreateCompanionBuilder,
          $$MissionProgressTableUpdateCompanionBuilder,
          (
            MissionProgressData,
            BaseReferences<
              _$AppDatabase,
              $MissionProgressTable,
              MissionProgressData
            >,
          ),
          MissionProgressData,
          PrefetchHooks Function()
        > {
  $$MissionProgressTableTableManager(
    _$AppDatabase db,
    $MissionProgressTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MissionProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MissionProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MissionProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> missionId = const Value.absent(),
                Value<bool> unlocked = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                Value<double> bestPerformance = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MissionProgressCompanion(
                missionId: missionId,
                unlocked: unlocked,
                completed: completed,
                bestPerformance: bestPerformance,
                completedAt: completedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String missionId,
                Value<bool> unlocked = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                Value<double> bestPerformance = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MissionProgressCompanion.insert(
                missionId: missionId,
                unlocked: unlocked,
                completed: completed,
                bestPerformance: bestPerformance,
                completedAt: completedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MissionProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MissionProgressTable,
      MissionProgressData,
      $$MissionProgressTableFilterComposer,
      $$MissionProgressTableOrderingComposer,
      $$MissionProgressTableAnnotationComposer,
      $$MissionProgressTableCreateCompanionBuilder,
      $$MissionProgressTableUpdateCompanionBuilder,
      (
        MissionProgressData,
        BaseReferences<
          _$AppDatabase,
          $MissionProgressTable,
          MissionProgressData
        >,
      ),
      MissionProgressData,
      PrefetchHooks Function()
    >;
typedef $$FxCacheTableCreateCompanionBuilder = FxCacheCompanion Function({
  required String baseCurrency,
  required String quoteCurrency,
  required double rate,
  required DateTime fetchedAt,
  Value<int> rowid,
});
typedef $$FxCacheTableUpdateCompanionBuilder = FxCacheCompanion Function({
  Value<String> baseCurrency,
  Value<String> quoteCurrency,
  Value<double> rate,
  Value<DateTime> fetchedAt,
  Value<int> rowid,
});

class $$FxCacheTableFilterComposer
    extends Composer<_$AppDatabase, $FxCacheTable> {
  $$FxCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get baseCurrency => $composableBuilder(
    column: $table.baseCurrency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quoteCurrency => $composableBuilder(
    column: $table.quoteCurrency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rate => $composableBuilder(
    column: $table.rate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FxCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $FxCacheTable> {
  $$FxCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get baseCurrency => $composableBuilder(
    column: $table.baseCurrency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quoteCurrency => $composableBuilder(
    column: $table.quoteCurrency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rate => $composableBuilder(
    column: $table.rate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FxCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $FxCacheTable> {
  $$FxCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get baseCurrency => $composableBuilder(
    column: $table.baseCurrency,
    builder: (column) => column,
  );

  GeneratedColumn<String> get quoteCurrency => $composableBuilder(
    column: $table.quoteCurrency,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rate =>
      $composableBuilder(column: $table.rate, builder: (column) => column);

  GeneratedColumn<DateTime> get fetchedAt =>
      $composableBuilder(column: $table.fetchedAt, builder: (column) => column);
}

class $$FxCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FxCacheTable,
          FxCacheData,
          $$FxCacheTableFilterComposer,
          $$FxCacheTableOrderingComposer,
          $$FxCacheTableAnnotationComposer,
          $$FxCacheTableCreateCompanionBuilder,
          $$FxCacheTableUpdateCompanionBuilder,
          (
            FxCacheData,
            BaseReferences<_$AppDatabase, $FxCacheTable, FxCacheData>,
          ),
          FxCacheData,
          PrefetchHooks Function()
        > {
  $$FxCacheTableTableManager(_$AppDatabase db, $FxCacheTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FxCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FxCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FxCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> baseCurrency = const Value.absent(),
                Value<String> quoteCurrency = const Value.absent(),
                Value<double> rate = const Value.absent(),
                Value<DateTime> fetchedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FxCacheCompanion(
                baseCurrency: baseCurrency,
                quoteCurrency: quoteCurrency,
                rate: rate,
                fetchedAt: fetchedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String baseCurrency,
                required String quoteCurrency,
                required double rate,
                required DateTime fetchedAt,
                Value<int> rowid = const Value.absent(),
              }) => FxCacheCompanion.insert(
                baseCurrency: baseCurrency,
                quoteCurrency: quoteCurrency,
                rate: rate,
                fetchedAt: fetchedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FxCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FxCacheTable,
      FxCacheData,
      $$FxCacheTableFilterComposer,
      $$FxCacheTableOrderingComposer,
      $$FxCacheTableAnnotationComposer,
      $$FxCacheTableCreateCompanionBuilder,
      $$FxCacheTableUpdateCompanionBuilder,
      (FxCacheData, BaseReferences<_$AppDatabase, $FxCacheTable, FxCacheData>),
      FxCacheData,
      PrefetchHooks Function()
    >;
typedef $$BudgetItemsTableCreateCompanionBuilder =
    BudgetItemsCompanion Function({
      required String id,
      required String category,
      required int amountMinor,
      required bool isIncome,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$BudgetItemsTableUpdateCompanionBuilder =
    BudgetItemsCompanion Function({
      Value<String> id,
      Value<String> category,
      Value<int> amountMinor,
      Value<bool> isIncome,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$BudgetItemsTableFilterComposer
    extends Composer<_$AppDatabase, $BudgetItemsTable> {
  $$BudgetItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isIncome => $composableBuilder(
    column: $table.isIncome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BudgetItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $BudgetItemsTable> {
  $$BudgetItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isIncome => $composableBuilder(
    column: $table.isIncome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BudgetItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BudgetItemsTable> {
  $$BudgetItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isIncome =>
      $composableBuilder(column: $table.isIncome, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$BudgetItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BudgetItemsTable,
          BudgetItem,
          $$BudgetItemsTableFilterComposer,
          $$BudgetItemsTableOrderingComposer,
          $$BudgetItemsTableAnnotationComposer,
          $$BudgetItemsTableCreateCompanionBuilder,
          $$BudgetItemsTableUpdateCompanionBuilder,
          (
            BudgetItem,
            BaseReferences<_$AppDatabase, $BudgetItemsTable, BudgetItem>,
          ),
          BudgetItem,
          PrefetchHooks Function()
        > {
  $$BudgetItemsTableTableManager(_$AppDatabase db, $BudgetItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BudgetItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BudgetItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BudgetItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<bool> isIncome = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BudgetItemsCompanion(
                id: id,
                category: category,
                amountMinor: amountMinor,
                isIncome: isIncome,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String category,
                required int amountMinor,
                required bool isIncome,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BudgetItemsCompanion.insert(
                id: id,
                category: category,
                amountMinor: amountMinor,
                isIncome: isIncome,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BudgetItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BudgetItemsTable,
      BudgetItem,
      $$BudgetItemsTableFilterComposer,
      $$BudgetItemsTableOrderingComposer,
      $$BudgetItemsTableAnnotationComposer,
      $$BudgetItemsTableCreateCompanionBuilder,
      $$BudgetItemsTableUpdateCompanionBuilder,
      (
        BudgetItem,
        BaseReferences<_$AppDatabase, $BudgetItemsTable, BudgetItem>,
      ),
      BudgetItem,
      PrefetchHooks Function()
    >;
typedef $$SavingsGoalsTableCreateCompanionBuilder =
    SavingsGoalsCompanion Function({
      required String id,
      required String title,
      required int targetMinor,
      Value<int> savedMinor,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$SavingsGoalsTableUpdateCompanionBuilder =
    SavingsGoalsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<int> targetMinor,
      Value<int> savedMinor,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$SavingsGoalsTableFilterComposer
    extends Composer<_$AppDatabase, $SavingsGoalsTable> {
  $$SavingsGoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetMinor => $composableBuilder(
    column: $table.targetMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get savedMinor => $composableBuilder(
    column: $table.savedMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SavingsGoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $SavingsGoalsTable> {
  $$SavingsGoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetMinor => $composableBuilder(
    column: $table.targetMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get savedMinor => $composableBuilder(
    column: $table.savedMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SavingsGoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavingsGoalsTable> {
  $$SavingsGoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get targetMinor => $composableBuilder(
    column: $table.targetMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get savedMinor => $composableBuilder(
    column: $table.savedMinor,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SavingsGoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SavingsGoalsTable,
          SavingsGoal,
          $$SavingsGoalsTableFilterComposer,
          $$SavingsGoalsTableOrderingComposer,
          $$SavingsGoalsTableAnnotationComposer,
          $$SavingsGoalsTableCreateCompanionBuilder,
          $$SavingsGoalsTableUpdateCompanionBuilder,
          (
            SavingsGoal,
            BaseReferences<_$AppDatabase, $SavingsGoalsTable, SavingsGoal>,
          ),
          SavingsGoal,
          PrefetchHooks Function()
        > {
  $$SavingsGoalsTableTableManager(_$AppDatabase db, $SavingsGoalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavingsGoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavingsGoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavingsGoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> targetMinor = const Value.absent(),
                Value<int> savedMinor = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SavingsGoalsCompanion(
                id: id,
                title: title,
                targetMinor: targetMinor,
                savedMinor: savedMinor,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required int targetMinor,
                Value<int> savedMinor = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SavingsGoalsCompanion.insert(
                id: id,
                title: title,
                targetMinor: targetMinor,
                savedMinor: savedMinor,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SavingsGoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SavingsGoalsTable,
      SavingsGoal,
      $$SavingsGoalsTableFilterComposer,
      $$SavingsGoalsTableOrderingComposer,
      $$SavingsGoalsTableAnnotationComposer,
      $$SavingsGoalsTableCreateCompanionBuilder,
      $$SavingsGoalsTableUpdateCompanionBuilder,
      (
        SavingsGoal,
        BaseReferences<_$AppDatabase, $SavingsGoalsTable, SavingsGoal>,
      ),
      SavingsGoal,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProfilesTableTableManager get profiles =>
      $$ProfilesTableTableManager(_db, _db.profiles);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db, _db.accounts);
  $$BankCardsTableTableManager get bankCards =>
      $$BankCardsTableTableManager(_db, _db.bankCards);
  $$CardVaultSecretsTableTableManager get cardVaultSecrets =>
      $$CardVaultSecretsTableTableManager(_db, _db.cardVaultSecrets);
  $$DepositAccountsTableTableManager get depositAccounts =>
      $$DepositAccountsTableTableManager(_db, _db.depositAccounts);
  $$DirectoryUsersTableTableManager get directoryUsers =>
      $$DirectoryUsersTableTableManager(_db, _db.directoryUsers);
  $$LedgerEntriesTableTableManager get ledgerEntries =>
      $$LedgerEntriesTableTableManager(_db, _db.ledgerEntries);
  $$MissionProgressTableTableManager get missionProgress =>
      $$MissionProgressTableTableManager(_db, _db.missionProgress);
  $$FxCacheTableTableManager get fxCache =>
      $$FxCacheTableTableManager(_db, _db.fxCache);
  $$BudgetItemsTableTableManager get budgetItems =>
      $$BudgetItemsTableTableManager(_db, _db.budgetItems);
  $$SavingsGoalsTableTableManager get savingsGoals =>
      $$SavingsGoalsTableTableManager(_db, _db.savingsGoals);
}
