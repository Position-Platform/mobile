// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedColumnWithTypeConverter<User?, String> user =
      GeneratedColumn<String>('user', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<User?>($UserTableTable.$converterusern);
  @override
  List<GeneratedColumn> get $columns => [id, user];
  @override
  String get aliasedName => _alias ?? 'user_table';
  @override
  String get actualTableName => 'user_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_userMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      user: $UserTableTable.$converterusern.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user'])),
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }

  static TypeConverter<User, String> $converteruser = const UserConverter();
  static TypeConverter<User?, String?> $converterusern =
      NullAwareTypeConverter.wrap($converteruser);
}

class UserTableData extends DataClass implements Insertable<UserTableData> {
  final int id;
  final User? user;
  const UserTableData({required this.id, this.user});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || user != null) {
      final converter = $UserTableTable.$converterusern;
      map['user'] = Variable<String>(converter.toSql(user));
    }
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: Value(id),
      user: user == null && nullToAbsent ? const Value.absent() : Value(user),
    );
  }

  factory UserTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      id: serializer.fromJson<int>(json['id']),
      user: serializer.fromJson<User?>(json['user']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'user': serializer.toJson<User?>(user),
    };
  }

  UserTableData copyWith({int? id, Value<User?> user = const Value.absent()}) =>
      UserTableData(
        id: id ?? this.id,
        user: user.present ? user.value : this.user,
      );
  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('id: $id, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, user);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.id == this.id &&
          other.user == this.user);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<int> id;
  final Value<User?> user;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.user = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.id = const Value.absent(),
    this.user = const Value.absent(),
  });
  static Insertable<UserTableData> custom({
    Expression<int>? id,
    Expression<String>? user,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (user != null) 'user': user,
    });
  }

  UserTableCompanion copyWith({Value<int>? id, Value<User?>? user}) {
    return UserTableCompanion(
      id: id ?? this.id,
      user: user ?? this.user,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (user.present) {
      final converter = $UserTableTable.$converterusern;
      map['user'] = Variable<String>(converter.toSql(user.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }
}

class $SearchTableTable extends SearchTable
    with TableInfo<$SearchTableTable, SearchTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _suggestionMeta =
      const VerificationMeta('suggestion');
  @override
  late final GeneratedColumn<String> suggestion = GeneratedColumn<String>(
      'suggestion', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, suggestion];
  @override
  String get aliasedName => _alias ?? 'search_table';
  @override
  String get actualTableName => 'search_table';
  @override
  VerificationContext validateIntegrity(Insertable<SearchTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('suggestion')) {
      context.handle(
          _suggestionMeta,
          suggestion.isAcceptableOrUnknown(
              data['suggestion']!, _suggestionMeta));
    } else if (isInserting) {
      context.missing(_suggestionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SearchTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      suggestion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}suggestion'])!,
    );
  }

  @override
  $SearchTableTable createAlias(String alias) {
    return $SearchTableTable(attachedDatabase, alias);
  }
}

class SearchTableData extends DataClass implements Insertable<SearchTableData> {
  final int id;
  final String suggestion;
  const SearchTableData({required this.id, required this.suggestion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['suggestion'] = Variable<String>(suggestion);
    return map;
  }

  SearchTableCompanion toCompanion(bool nullToAbsent) {
    return SearchTableCompanion(
      id: Value(id),
      suggestion: Value(suggestion),
    );
  }

  factory SearchTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchTableData(
      id: serializer.fromJson<int>(json['id']),
      suggestion: serializer.fromJson<String>(json['suggestion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'suggestion': serializer.toJson<String>(suggestion),
    };
  }

  SearchTableData copyWith({int? id, String? suggestion}) => SearchTableData(
        id: id ?? this.id,
        suggestion: suggestion ?? this.suggestion,
      );
  @override
  String toString() {
    return (StringBuffer('SearchTableData(')
          ..write('id: $id, ')
          ..write('suggestion: $suggestion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, suggestion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchTableData &&
          other.id == this.id &&
          other.suggestion == this.suggestion);
}

class SearchTableCompanion extends UpdateCompanion<SearchTableData> {
  final Value<int> id;
  final Value<String> suggestion;
  const SearchTableCompanion({
    this.id = const Value.absent(),
    this.suggestion = const Value.absent(),
  });
  SearchTableCompanion.insert({
    this.id = const Value.absent(),
    required String suggestion,
  }) : suggestion = Value(suggestion);
  static Insertable<SearchTableData> custom({
    Expression<int>? id,
    Expression<String>? suggestion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (suggestion != null) 'suggestion': suggestion,
    });
  }

  SearchTableCompanion copyWith({Value<int>? id, Value<String>? suggestion}) {
    return SearchTableCompanion(
      id: id ?? this.id,
      suggestion: suggestion ?? this.suggestion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (suggestion.present) {
      map['suggestion'] = Variable<String>(suggestion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchTableCompanion(')
          ..write('id: $id, ')
          ..write('suggestion: $suggestion')
          ..write(')'))
        .toString();
  }
}

class $CategoryTableTable extends CategoryTable
    with TableInfo<$CategoryTableTable, CategoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumnWithTypeConverter<Category?, String> category =
      GeneratedColumn<String>('category', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Category?>($CategoryTableTable.$convertercategoryn);
  @override
  List<GeneratedColumn> get $columns => [id, category];
  @override
  String get aliasedName => _alias ?? 'category_table';
  @override
  String get actualTableName => 'category_table';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_categoryMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      category: $CategoryTableTable.$convertercategoryn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])),
    );
  }

  @override
  $CategoryTableTable createAlias(String alias) {
    return $CategoryTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Category, String> $convertercategory =
      const CategoryConverter();
  static TypeConverter<Category?, String?> $convertercategoryn =
      NullAwareTypeConverter.wrap($convertercategory);
}

class CategoryTableData extends DataClass
    implements Insertable<CategoryTableData> {
  final int id;
  final Category? category;
  const CategoryTableData({required this.id, this.category});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || category != null) {
      final converter = $CategoryTableTable.$convertercategoryn;
      map['category'] = Variable<String>(converter.toSql(category));
    }
    return map;
  }

  CategoryTableCompanion toCompanion(bool nullToAbsent) {
    return CategoryTableCompanion(
      id: Value(id),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
    );
  }

  factory CategoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryTableData(
      id: serializer.fromJson<int>(json['id']),
      category: serializer.fromJson<Category?>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'category': serializer.toJson<Category?>(category),
    };
  }

  CategoryTableData copyWith(
          {int? id, Value<Category?> category = const Value.absent()}) =>
      CategoryTableData(
        id: id ?? this.id,
        category: category.present ? category.value : this.category,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryTableData(')
          ..write('id: $id, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryTableData &&
          other.id == this.id &&
          other.category == this.category);
}

class CategoryTableCompanion extends UpdateCompanion<CategoryTableData> {
  final Value<int> id;
  final Value<Category?> category;
  const CategoryTableCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
  });
  CategoryTableCompanion.insert({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
  });
  static Insertable<CategoryTableData> custom({
    Expression<int>? id,
    Expression<String>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
    });
  }

  CategoryTableCompanion copyWith(
      {Value<int>? id, Value<Category?>? category}) {
    return CategoryTableCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (category.present) {
      final converter = $CategoryTableTable.$convertercategoryn;
      map['category'] = Variable<String>(converter.toSql(category.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableCompanion(')
          ..write('id: $id, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

class $EtablissementTableTable extends EtablissementTable
    with TableInfo<$EtablissementTableTable, EtablissementTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EtablissementTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _etablissementMeta =
      const VerificationMeta('etablissement');
  @override
  late final GeneratedColumnWithTypeConverter<Datum?, String> etablissement =
      GeneratedColumn<String>('etablissement', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Datum?>(
              $EtablissementTableTable.$converteretablissementn);
  static const VerificationMeta _isOnlineMeta =
      const VerificationMeta('isOnline');
  @override
  late final GeneratedColumn<bool> isOnline =
      GeneratedColumn<bool>('is_online', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_online" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(true));
  static const VerificationMeta _isUpdateMeta =
      const VerificationMeta('isUpdate');
  @override
  late final GeneratedColumn<bool> isUpdate =
      GeneratedColumn<bool>('is_update', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_update" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, etablissement, isOnline, isUpdate];
  @override
  String get aliasedName => _alias ?? 'etablissement_table';
  @override
  String get actualTableName => 'etablissement_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<EtablissementTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_etablissementMeta, const VerificationResult.success());
    if (data.containsKey('is_online')) {
      context.handle(_isOnlineMeta,
          isOnline.isAcceptableOrUnknown(data['is_online']!, _isOnlineMeta));
    }
    if (data.containsKey('is_update')) {
      context.handle(_isUpdateMeta,
          isUpdate.isAcceptableOrUnknown(data['is_update']!, _isUpdateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EtablissementTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EtablissementTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      etablissement: $EtablissementTableTable.$converteretablissementn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}etablissement'])),
      isOnline: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_online'])!,
      isUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_update'])!,
    );
  }

  @override
  $EtablissementTableTable createAlias(String alias) {
    return $EtablissementTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Datum, String> $converteretablissement =
      const EtablissementConverter();
  static TypeConverter<Datum?, String?> $converteretablissementn =
      NullAwareTypeConverter.wrap($converteretablissement);
}

class EtablissementTableData extends DataClass
    implements Insertable<EtablissementTableData> {
  final int id;
  final Datum? etablissement;
  final bool isOnline;
  final bool isUpdate;
  const EtablissementTableData(
      {required this.id,
      this.etablissement,
      required this.isOnline,
      required this.isUpdate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || etablissement != null) {
      final converter = $EtablissementTableTable.$converteretablissementn;
      map['etablissement'] = Variable<String>(converter.toSql(etablissement));
    }
    map['is_online'] = Variable<bool>(isOnline);
    map['is_update'] = Variable<bool>(isUpdate);
    return map;
  }

  EtablissementTableCompanion toCompanion(bool nullToAbsent) {
    return EtablissementTableCompanion(
      id: Value(id),
      etablissement: etablissement == null && nullToAbsent
          ? const Value.absent()
          : Value(etablissement),
      isOnline: Value(isOnline),
      isUpdate: Value(isUpdate),
    );
  }

  factory EtablissementTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EtablissementTableData(
      id: serializer.fromJson<int>(json['id']),
      etablissement: serializer.fromJson<Datum?>(json['etablissement']),
      isOnline: serializer.fromJson<bool>(json['isOnline']),
      isUpdate: serializer.fromJson<bool>(json['isUpdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'etablissement': serializer.toJson<Datum?>(etablissement),
      'isOnline': serializer.toJson<bool>(isOnline),
      'isUpdate': serializer.toJson<bool>(isUpdate),
    };
  }

  EtablissementTableData copyWith(
          {int? id,
          Value<Datum?> etablissement = const Value.absent(),
          bool? isOnline,
          bool? isUpdate}) =>
      EtablissementTableData(
        id: id ?? this.id,
        etablissement:
            etablissement.present ? etablissement.value : this.etablissement,
        isOnline: isOnline ?? this.isOnline,
        isUpdate: isUpdate ?? this.isUpdate,
      );
  @override
  String toString() {
    return (StringBuffer('EtablissementTableData(')
          ..write('id: $id, ')
          ..write('etablissement: $etablissement, ')
          ..write('isOnline: $isOnline, ')
          ..write('isUpdate: $isUpdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, etablissement, isOnline, isUpdate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EtablissementTableData &&
          other.id == this.id &&
          other.etablissement == this.etablissement &&
          other.isOnline == this.isOnline &&
          other.isUpdate == this.isUpdate);
}

class EtablissementTableCompanion
    extends UpdateCompanion<EtablissementTableData> {
  final Value<int> id;
  final Value<Datum?> etablissement;
  final Value<bool> isOnline;
  final Value<bool> isUpdate;
  const EtablissementTableCompanion({
    this.id = const Value.absent(),
    this.etablissement = const Value.absent(),
    this.isOnline = const Value.absent(),
    this.isUpdate = const Value.absent(),
  });
  EtablissementTableCompanion.insert({
    this.id = const Value.absent(),
    this.etablissement = const Value.absent(),
    this.isOnline = const Value.absent(),
    this.isUpdate = const Value.absent(),
  });
  static Insertable<EtablissementTableData> custom({
    Expression<int>? id,
    Expression<String>? etablissement,
    Expression<bool>? isOnline,
    Expression<bool>? isUpdate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (etablissement != null) 'etablissement': etablissement,
      if (isOnline != null) 'is_online': isOnline,
      if (isUpdate != null) 'is_update': isUpdate,
    });
  }

  EtablissementTableCompanion copyWith(
      {Value<int>? id,
      Value<Datum?>? etablissement,
      Value<bool>? isOnline,
      Value<bool>? isUpdate}) {
    return EtablissementTableCompanion(
      id: id ?? this.id,
      etablissement: etablissement ?? this.etablissement,
      isOnline: isOnline ?? this.isOnline,
      isUpdate: isUpdate ?? this.isUpdate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (etablissement.present) {
      final converter = $EtablissementTableTable.$converteretablissementn;
      map['etablissement'] =
          Variable<String>(converter.toSql(etablissement.value));
    }
    if (isOnline.present) {
      map['is_online'] = Variable<bool>(isOnline.value);
    }
    if (isUpdate.present) {
      map['is_update'] = Variable<bool>(isUpdate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EtablissementTableCompanion(')
          ..write('id: $id, ')
          ..write('etablissement: $etablissement, ')
          ..write('isOnline: $isOnline, ')
          ..write('isUpdate: $isUpdate')
          ..write(')'))
        .toString();
  }
}

class $FavoriteTableTable extends FavoriteTable
    with TableInfo<$FavoriteTableTable, FavoriteTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _etablissementMeta =
      const VerificationMeta('etablissement');
  @override
  late final GeneratedColumnWithTypeConverter<Datum?, String> etablissement =
      GeneratedColumn<String>('etablissement', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Datum?>($FavoriteTableTable.$converteretablissementn);
  static const VerificationMeta _isFavoriteMeta =
      const VerificationMeta('isFavorite');
  @override
  late final GeneratedColumn<bool> isFavorite =
      GeneratedColumn<bool>('is_favorite', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_favorite" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, etablissement, isFavorite];
  @override
  String get aliasedName => _alias ?? 'favorite_table';
  @override
  String get actualTableName => 'favorite_table';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_etablissementMeta, const VerificationResult.success());
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite']!, _isFavoriteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      etablissement: $FavoriteTableTable.$converteretablissementn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}etablissement'])),
      isFavorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favorite'])!,
    );
  }

  @override
  $FavoriteTableTable createAlias(String alias) {
    return $FavoriteTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Datum, String> $converteretablissement =
      const EtablissementConverter();
  static TypeConverter<Datum?, String?> $converteretablissementn =
      NullAwareTypeConverter.wrap($converteretablissement);
}

class FavoriteTableData extends DataClass
    implements Insertable<FavoriteTableData> {
  final int id;
  final Datum? etablissement;
  final bool isFavorite;
  const FavoriteTableData(
      {required this.id, this.etablissement, required this.isFavorite});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || etablissement != null) {
      final converter = $FavoriteTableTable.$converteretablissementn;
      map['etablissement'] = Variable<String>(converter.toSql(etablissement));
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    return map;
  }

  FavoriteTableCompanion toCompanion(bool nullToAbsent) {
    return FavoriteTableCompanion(
      id: Value(id),
      etablissement: etablissement == null && nullToAbsent
          ? const Value.absent()
          : Value(etablissement),
      isFavorite: Value(isFavorite),
    );
  }

  factory FavoriteTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteTableData(
      id: serializer.fromJson<int>(json['id']),
      etablissement: serializer.fromJson<Datum?>(json['etablissement']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'etablissement': serializer.toJson<Datum?>(etablissement),
      'isFavorite': serializer.toJson<bool>(isFavorite),
    };
  }

  FavoriteTableData copyWith(
          {int? id,
          Value<Datum?> etablissement = const Value.absent(),
          bool? isFavorite}) =>
      FavoriteTableData(
        id: id ?? this.id,
        etablissement:
            etablissement.present ? etablissement.value : this.etablissement,
        isFavorite: isFavorite ?? this.isFavorite,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteTableData(')
          ..write('id: $id, ')
          ..write('etablissement: $etablissement, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, etablissement, isFavorite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteTableData &&
          other.id == this.id &&
          other.etablissement == this.etablissement &&
          other.isFavorite == this.isFavorite);
}

class FavoriteTableCompanion extends UpdateCompanion<FavoriteTableData> {
  final Value<int> id;
  final Value<Datum?> etablissement;
  final Value<bool> isFavorite;
  const FavoriteTableCompanion({
    this.id = const Value.absent(),
    this.etablissement = const Value.absent(),
    this.isFavorite = const Value.absent(),
  });
  FavoriteTableCompanion.insert({
    this.id = const Value.absent(),
    this.etablissement = const Value.absent(),
    this.isFavorite = const Value.absent(),
  });
  static Insertable<FavoriteTableData> custom({
    Expression<int>? id,
    Expression<String>? etablissement,
    Expression<bool>? isFavorite,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (etablissement != null) 'etablissement': etablissement,
      if (isFavorite != null) 'is_favorite': isFavorite,
    });
  }

  FavoriteTableCompanion copyWith(
      {Value<int>? id, Value<Datum?>? etablissement, Value<bool>? isFavorite}) {
    return FavoriteTableCompanion(
      id: id ?? this.id,
      etablissement: etablissement ?? this.etablissement,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (etablissement.present) {
      final converter = $FavoriteTableTable.$converteretablissementn;
      map['etablissement'] =
          Variable<String>(converter.toSql(etablissement.value));
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteTableCompanion(')
          ..write('id: $id, ')
          ..write('etablissement: $etablissement, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $SearchTableTable searchTable = $SearchTableTable(this);
  late final $CategoryTableTable categoryTable = $CategoryTableTable(this);
  late final $EtablissementTableTable etablissementTable =
      $EtablissementTableTable(this);
  late final $FavoriteTableTable favoriteTable = $FavoriteTableTable(this);
  late final UserDao userDao = UserDao(this as MyDatabase);
  late final SearchDao searchDao = SearchDao(this as MyDatabase);
  late final CategoryDao categoryDao = CategoryDao(this as MyDatabase);
  late final EtablissementDao etablissementDao =
      EtablissementDao(this as MyDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        userTable,
        searchTable,
        categoryTable,
        etablissementTable,
        favoriteTable
      ];
}
