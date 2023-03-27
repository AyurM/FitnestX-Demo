// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_selector_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoalSelectorEvent {
  Goal get goal => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Goal goal) goalSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Goal goal)? goalSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Goal goal)? goalSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoalSelected value) goalSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoalSelected value)? goalSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoalSelected value)? goalSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoalSelectorEventCopyWith<GoalSelectorEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalSelectorEventCopyWith<$Res> {
  factory $GoalSelectorEventCopyWith(
          GoalSelectorEvent value, $Res Function(GoalSelectorEvent) then) =
      _$GoalSelectorEventCopyWithImpl<$Res, GoalSelectorEvent>;
  @useResult
  $Res call({Goal goal});
}

/// @nodoc
class _$GoalSelectorEventCopyWithImpl<$Res, $Val extends GoalSelectorEvent>
    implements $GoalSelectorEventCopyWith<$Res> {
  _$GoalSelectorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goal = null,
  }) {
    return _then(_value.copyWith(
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as Goal,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoalSelectedCopyWith<$Res>
    implements $GoalSelectorEventCopyWith<$Res> {
  factory _$$GoalSelectedCopyWith(
          _$GoalSelected value, $Res Function(_$GoalSelected) then) =
      __$$GoalSelectedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Goal goal});
}

/// @nodoc
class __$$GoalSelectedCopyWithImpl<$Res>
    extends _$GoalSelectorEventCopyWithImpl<$Res, _$GoalSelected>
    implements _$$GoalSelectedCopyWith<$Res> {
  __$$GoalSelectedCopyWithImpl(
      _$GoalSelected _value, $Res Function(_$GoalSelected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goal = null,
  }) {
    return _then(_$GoalSelected(
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as Goal,
    ));
  }
}

/// @nodoc

class _$GoalSelected implements GoalSelected {
  const _$GoalSelected({required this.goal});

  @override
  final Goal goal;

  @override
  String toString() {
    return 'GoalSelectorEvent.goalSelected(goal: $goal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalSelected &&
            (identical(other.goal, goal) || other.goal == goal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, goal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalSelectedCopyWith<_$GoalSelected> get copyWith =>
      __$$GoalSelectedCopyWithImpl<_$GoalSelected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Goal goal) goalSelected,
  }) {
    return goalSelected(goal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Goal goal)? goalSelected,
  }) {
    return goalSelected?.call(goal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Goal goal)? goalSelected,
    required TResult orElse(),
  }) {
    if (goalSelected != null) {
      return goalSelected(goal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoalSelected value) goalSelected,
  }) {
    return goalSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoalSelected value)? goalSelected,
  }) {
    return goalSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoalSelected value)? goalSelected,
    required TResult orElse(),
  }) {
    if (goalSelected != null) {
      return goalSelected(this);
    }
    return orElse();
  }
}

abstract class GoalSelected implements GoalSelectorEvent {
  const factory GoalSelected({required final Goal goal}) = _$GoalSelected;

  @override
  Goal get goal;
  @override
  @JsonKey(ignore: true)
  _$$GoalSelectedCopyWith<_$GoalSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GoalSelectorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() goalSelectLoading,
    required TResult Function(String error) goalSelectError,
    required TResult Function() goalSelectSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? goalSelectLoading,
    TResult? Function(String error)? goalSelectError,
    TResult? Function()? goalSelectSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? goalSelectLoading,
    TResult Function(String error)? goalSelectError,
    TResult Function()? goalSelectSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GoalSelectLoading value) goalSelectLoading,
    required TResult Function(_GoalSelectError value) goalSelectError,
    required TResult Function(_GoalSelectSuccess value) goalSelectSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult? Function(_GoalSelectError value)? goalSelectError,
    TResult? Function(_GoalSelectSuccess value)? goalSelectSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult Function(_GoalSelectError value)? goalSelectError,
    TResult Function(_GoalSelectSuccess value)? goalSelectSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalSelectorStateCopyWith<$Res> {
  factory $GoalSelectorStateCopyWith(
          GoalSelectorState value, $Res Function(GoalSelectorState) then) =
      _$GoalSelectorStateCopyWithImpl<$Res, GoalSelectorState>;
}

/// @nodoc
class _$GoalSelectorStateCopyWithImpl<$Res, $Val extends GoalSelectorState>
    implements $GoalSelectorStateCopyWith<$Res> {
  _$GoalSelectorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$GoalSelectorStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'GoalSelectorState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() goalSelectLoading,
    required TResult Function(String error) goalSelectError,
    required TResult Function() goalSelectSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? goalSelectLoading,
    TResult? Function(String error)? goalSelectError,
    TResult? Function()? goalSelectSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? goalSelectLoading,
    TResult Function(String error)? goalSelectError,
    TResult Function()? goalSelectSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GoalSelectLoading value) goalSelectLoading,
    required TResult Function(_GoalSelectError value) goalSelectError,
    required TResult Function(_GoalSelectSuccess value) goalSelectSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult? Function(_GoalSelectError value)? goalSelectError,
    TResult? Function(_GoalSelectSuccess value)? goalSelectSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult Function(_GoalSelectError value)? goalSelectError,
    TResult Function(_GoalSelectSuccess value)? goalSelectSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GoalSelectorState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_GoalSelectLoadingCopyWith<$Res> {
  factory _$$_GoalSelectLoadingCopyWith(_$_GoalSelectLoading value,
          $Res Function(_$_GoalSelectLoading) then) =
      __$$_GoalSelectLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GoalSelectLoadingCopyWithImpl<$Res>
    extends _$GoalSelectorStateCopyWithImpl<$Res, _$_GoalSelectLoading>
    implements _$$_GoalSelectLoadingCopyWith<$Res> {
  __$$_GoalSelectLoadingCopyWithImpl(
      _$_GoalSelectLoading _value, $Res Function(_$_GoalSelectLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GoalSelectLoading implements _GoalSelectLoading {
  const _$_GoalSelectLoading();

  @override
  String toString() {
    return 'GoalSelectorState.goalSelectLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GoalSelectLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() goalSelectLoading,
    required TResult Function(String error) goalSelectError,
    required TResult Function() goalSelectSuccess,
  }) {
    return goalSelectLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? goalSelectLoading,
    TResult? Function(String error)? goalSelectError,
    TResult? Function()? goalSelectSuccess,
  }) {
    return goalSelectLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? goalSelectLoading,
    TResult Function(String error)? goalSelectError,
    TResult Function()? goalSelectSuccess,
    required TResult orElse(),
  }) {
    if (goalSelectLoading != null) {
      return goalSelectLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GoalSelectLoading value) goalSelectLoading,
    required TResult Function(_GoalSelectError value) goalSelectError,
    required TResult Function(_GoalSelectSuccess value) goalSelectSuccess,
  }) {
    return goalSelectLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult? Function(_GoalSelectError value)? goalSelectError,
    TResult? Function(_GoalSelectSuccess value)? goalSelectSuccess,
  }) {
    return goalSelectLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult Function(_GoalSelectError value)? goalSelectError,
    TResult Function(_GoalSelectSuccess value)? goalSelectSuccess,
    required TResult orElse(),
  }) {
    if (goalSelectLoading != null) {
      return goalSelectLoading(this);
    }
    return orElse();
  }
}

abstract class _GoalSelectLoading implements GoalSelectorState {
  const factory _GoalSelectLoading() = _$_GoalSelectLoading;
}

/// @nodoc
abstract class _$$_GoalSelectErrorCopyWith<$Res> {
  factory _$$_GoalSelectErrorCopyWith(
          _$_GoalSelectError value, $Res Function(_$_GoalSelectError) then) =
      __$$_GoalSelectErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$_GoalSelectErrorCopyWithImpl<$Res>
    extends _$GoalSelectorStateCopyWithImpl<$Res, _$_GoalSelectError>
    implements _$$_GoalSelectErrorCopyWith<$Res> {
  __$$_GoalSelectErrorCopyWithImpl(
      _$_GoalSelectError _value, $Res Function(_$_GoalSelectError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_GoalSelectError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GoalSelectError implements _GoalSelectError {
  const _$_GoalSelectError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'GoalSelectorState.goalSelectError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoalSelectError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoalSelectErrorCopyWith<_$_GoalSelectError> get copyWith =>
      __$$_GoalSelectErrorCopyWithImpl<_$_GoalSelectError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() goalSelectLoading,
    required TResult Function(String error) goalSelectError,
    required TResult Function() goalSelectSuccess,
  }) {
    return goalSelectError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? goalSelectLoading,
    TResult? Function(String error)? goalSelectError,
    TResult? Function()? goalSelectSuccess,
  }) {
    return goalSelectError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? goalSelectLoading,
    TResult Function(String error)? goalSelectError,
    TResult Function()? goalSelectSuccess,
    required TResult orElse(),
  }) {
    if (goalSelectError != null) {
      return goalSelectError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GoalSelectLoading value) goalSelectLoading,
    required TResult Function(_GoalSelectError value) goalSelectError,
    required TResult Function(_GoalSelectSuccess value) goalSelectSuccess,
  }) {
    return goalSelectError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult? Function(_GoalSelectError value)? goalSelectError,
    TResult? Function(_GoalSelectSuccess value)? goalSelectSuccess,
  }) {
    return goalSelectError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult Function(_GoalSelectError value)? goalSelectError,
    TResult Function(_GoalSelectSuccess value)? goalSelectSuccess,
    required TResult orElse(),
  }) {
    if (goalSelectError != null) {
      return goalSelectError(this);
    }
    return orElse();
  }
}

abstract class _GoalSelectError implements GoalSelectorState {
  const factory _GoalSelectError({required final String error}) =
      _$_GoalSelectError;

  String get error;
  @JsonKey(ignore: true)
  _$$_GoalSelectErrorCopyWith<_$_GoalSelectError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GoalSelectSuccessCopyWith<$Res> {
  factory _$$_GoalSelectSuccessCopyWith(_$_GoalSelectSuccess value,
          $Res Function(_$_GoalSelectSuccess) then) =
      __$$_GoalSelectSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GoalSelectSuccessCopyWithImpl<$Res>
    extends _$GoalSelectorStateCopyWithImpl<$Res, _$_GoalSelectSuccess>
    implements _$$_GoalSelectSuccessCopyWith<$Res> {
  __$$_GoalSelectSuccessCopyWithImpl(
      _$_GoalSelectSuccess _value, $Res Function(_$_GoalSelectSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GoalSelectSuccess implements _GoalSelectSuccess {
  const _$_GoalSelectSuccess();

  @override
  String toString() {
    return 'GoalSelectorState.goalSelectSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GoalSelectSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() goalSelectLoading,
    required TResult Function(String error) goalSelectError,
    required TResult Function() goalSelectSuccess,
  }) {
    return goalSelectSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? goalSelectLoading,
    TResult? Function(String error)? goalSelectError,
    TResult? Function()? goalSelectSuccess,
  }) {
    return goalSelectSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? goalSelectLoading,
    TResult Function(String error)? goalSelectError,
    TResult Function()? goalSelectSuccess,
    required TResult orElse(),
  }) {
    if (goalSelectSuccess != null) {
      return goalSelectSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GoalSelectLoading value) goalSelectLoading,
    required TResult Function(_GoalSelectError value) goalSelectError,
    required TResult Function(_GoalSelectSuccess value) goalSelectSuccess,
  }) {
    return goalSelectSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult? Function(_GoalSelectError value)? goalSelectError,
    TResult? Function(_GoalSelectSuccess value)? goalSelectSuccess,
  }) {
    return goalSelectSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult Function(_GoalSelectError value)? goalSelectError,
    TResult Function(_GoalSelectSuccess value)? goalSelectSuccess,
    required TResult orElse(),
  }) {
    if (goalSelectSuccess != null) {
      return goalSelectSuccess(this);
    }
    return orElse();
  }
}

abstract class _GoalSelectSuccess implements GoalSelectorState {
  const factory _GoalSelectSuccess() = _$_GoalSelectSuccess;
}
