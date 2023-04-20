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
  @override
  List<GeneratedColumn> get $columns => [id, etablissement];
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
  const EtablissementTableData({required this.id, this.etablissement});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || etablissement != null) {
      final converter = $EtablissementTableTable.$converteretablissementn;
      map['etablissement'] = Variable<String>(converter.toSql(etablissement));
    }
    return map;
  }

  EtablissementTableCompanion toCompanion(bool nullToAbsent) {
    return EtablissementTableCompanion(
      id: Value(id),
      etablissement: etablissement == null && nullToAbsent
          ? const Value.absent()
          : Value(etablissement),
    );
  }

  factory EtablissementTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EtablissementTableData(
      id: serializer.fromJson<int>(json['id']),
      etablissement: serializer.fromJson<Datum?>(json['etablissement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'etablissement': serializer.toJson<Datum?>(etablissement),
    };
  }

  EtablissementTableData copyWith(
          {int? id, Value<Datum?> etablissement = const Value.absent()}) =>
      EtablissementTableData(
        id: id ?? this.id,
        etablissement:
            etablissement.present ? etablissement.value : this.etablissement,
      );
  @override
  String toString() {
    return (StringBuffer('EtablissementTableData(')
          ..write('id: $id, ')
          ..write('etablissement: $etablissement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, etablissement);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EtablissementTableData &&
          other.id == this.id &&
          other.etablissement == this.etablissement);
}

class EtablissementTableCompanion
    extends UpdateCompanion<EtablissementTableData> {
  final Value<int> id;
  final Value<Datum?> etablissement;
  const EtablissementTableCompanion({
    this.id = const Value.absent(),
    this.etablissement = const Value.absent(),
  });
  EtablissementTableCompanion.insert({
    this.id = const Value.absent(),
    this.etablissement = const Value.absent(),
  });
  static Insertable<EtablissementTableData> custom({
    Expression<int>? id,
    Expression<String>? etablissement,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (etablissement != null) 'etablissement': etablissement,
    });
  }

  EtablissementTableCompanion copyWith(
      {Value<int>? id, Value<Datum?>? etablissement}) {
    return EtablissementTableCompanion(
      id: id ?? this.id,
      etablissement: etablissement ?? this.etablissement,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EtablissementTableCompanion(')
          ..write('id: $id, ')
          ..write('etablissement: $etablissement')
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
  late final UserDao userDao = UserDao(this as MyDatabase);
  late final SearchDao searchDao = SearchDao(this as MyDatabase);
  late final CategoryDao categoryDao = CategoryDao(this as MyDatabase);
  late final EtablissementDao etablissementDao =
      EtablissementDao(this as MyDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userTable, searchTable, categoryTable, etablissementTable];
}
