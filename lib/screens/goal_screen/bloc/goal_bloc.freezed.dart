// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoalEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() goalsRequested,
    required TResult Function(Goal goal) goalSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? goalsRequested,
    TResult? Function(Goal goal)? goalSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? goalsRequested,
    TResult Function(Goal goal)? goalSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoalsRequested value) goalsRequested,
    required TResult Function(GoalSelected value) goalSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoalsRequested value)? goalsRequested,
    TResult? Function(GoalSelected value)? goalSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoalsRequested value)? goalsRequested,
    TResult Function(GoalSelected value)? goalSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalEventCopyWith<$Res> {
  factory $GoalEventCopyWith(GoalEvent value, $Res Function(GoalEvent) then) =
      _$GoalEventCopyWithImpl<$Res, GoalEvent>;
}

/// @nodoc
class _$GoalEventCopyWithImpl<$Res, $Val extends GoalEvent>
    implements $GoalEventCopyWith<$Res> {
  _$GoalEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GoalsRequestedCopyWith<$Res> {
  factory _$$GoalsRequestedCopyWith(
          _$GoalsRequested value, $Res Function(_$GoalsRequested) then) =
      __$$GoalsRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoalsRequestedCopyWithImpl<$Res>
    extends _$GoalEventCopyWithImpl<$Res, _$GoalsRequested>
    implements _$$GoalsRequestedCopyWith<$Res> {
  __$$GoalsRequestedCopyWithImpl(
      _$GoalsRequested _value, $Res Function(_$GoalsRequested) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoalsRequested implements GoalsRequested {
  const _$GoalsRequested();

  @override
  String toString() {
    return 'GoalEvent.goalsRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoalsRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() goalsRequested,
    required TResult Function(Goal goal) goalSelected,
  }) {
    return goalsRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? goalsRequested,
    TResult? Function(Goal goal)? goalSelected,
  }) {
    return goalsRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? goalsRequested,
    TResult Function(Goal goal)? goalSelected,
    required TResult orElse(),
  }) {
    if (goalsRequested != null) {
      return goalsRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoalsRequested value) goalsRequested,
    required TResult Function(GoalSelected value) goalSelected,
  }) {
    return goalsRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoalsRequested value)? goalsRequested,
    TResult? Function(GoalSelected value)? goalSelected,
  }) {
    return goalsRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoalsRequested value)? goalsRequested,
    TResult Function(GoalSelected value)? goalSelected,
    required TResult orElse(),
  }) {
    if (goalsRequested != null) {
      return goalsRequested(this);
    }
    return orElse();
  }
}

abstract class GoalsRequested implements GoalEvent {
  const factory GoalsRequested() = _$GoalsRequested;
}

/// @nodoc
abstract class _$$GoalSelectedCopyWith<$Res> {
  factory _$$GoalSelectedCopyWith(
          _$GoalSelected value, $Res Function(_$GoalSelected) then) =
      __$$GoalSelectedCopyWithImpl<$Res>;
  @useResult
  $Res call({Goal goal});
}

/// @nodoc
class __$$GoalSelectedCopyWithImpl<$Res>
    extends _$GoalEventCopyWithImpl<$Res, _$GoalSelected>
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
    return 'GoalEvent.goalSelected(goal: $goal)';
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
    required TResult Function() goalsRequested,
    required TResult Function(Goal goal) goalSelected,
  }) {
    return goalSelected(goal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? goalsRequested,
    TResult? Function(Goal goal)? goalSelected,
  }) {
    return goalSelected?.call(goal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? goalsRequested,
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
    required TResult Function(GoalsRequested value) goalsRequested,
    required TResult Function(GoalSelected value) goalSelected,
  }) {
    return goalSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoalsRequested value)? goalsRequested,
    TResult? Function(GoalSelected value)? goalSelected,
  }) {
    return goalSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoalsRequested value)? goalsRequested,
    TResult Function(GoalSelected value)? goalSelected,
    required TResult orElse(),
  }) {
    if (goalSelected != null) {
      return goalSelected(this);
    }
    return orElse();
  }
}

abstract class GoalSelected implements GoalEvent {
  const factory GoalSelected({required final Goal goal}) = _$GoalSelected;

  Goal get goal;
  @JsonKey(ignore: true)
  _$$GoalSelectedCopyWith<_$GoalSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GoalState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() empty,
    required TResult Function(List<Goal> goals) success,
    required TResult Function() goalSelectLoading,
    required TResult Function(String error) goalSelectError,
    required TResult Function() goalSelectSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? empty,
    TResult? Function(List<Goal> goals)? success,
    TResult? Function()? goalSelectLoading,
    TResult? Function(String error)? goalSelectError,
    TResult? Function()? goalSelectSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? empty,
    TResult Function(List<Goal> goals)? success,
    TResult Function()? goalSelectLoading,
    TResult Function(String error)? goalSelectError,
    TResult Function()? goalSelectSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Success value) success,
    required TResult Function(_GoalSelectLoading value) goalSelectLoading,
    required TResult Function(_GoalSelectError value) goalSelectError,
    required TResult Function(_GoalSelectSuccess value) goalSelectSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Success value)? success,
    TResult? Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult? Function(_GoalSelectError value)? goalSelectError,
    TResult? Function(_GoalSelectSuccess value)? goalSelectSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Success value)? success,
    TResult Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult Function(_GoalSelectError value)? goalSelectError,
    TResult Function(_GoalSelectSuccess value)? goalSelectSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalStateCopyWith<$Res> {
  factory $GoalStateCopyWith(GoalState value, $Res Function(GoalState) then) =
      _$GoalStateCopyWithImpl<$Res, GoalState>;
}

/// @nodoc
class _$GoalStateCopyWithImpl<$Res, $Val extends GoalState>
    implements $GoalStateCopyWith<$Res> {
  _$GoalStateCopyWithImpl(this._value, this._then);

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
    extends _$GoalStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'GoalState.initial()';
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
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() empty,
    required TResult Function(List<Goal> goals) success,
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
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? empty,
    TResult? Function(List<Goal> goals)? success,
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
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? empty,
    TResult Function(List<Goal> goals)? success,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Success value) success,
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Success value)? success,
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
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Success value)? success,
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

abstract class _Initial implements GoalState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$GoalStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'GoalState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() empty,
    required TResult Function(List<Goal> goals) success,
    required TResult Function() goalSelectLoading,
    required TResult Function(String error) goalSelectError,
    required TResult Function() goalSelectSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? empty,
    TResult? Function(List<Goal> goals)? success,
    TResult? Function()? goalSelectLoading,
    TResult? Function(String error)? goalSelectError,
    TResult? Function()? goalSelectSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? empty,
    TResult Function(List<Goal> goals)? success,
    TResult Function()? goalSelectLoading,
    TResult Function(String error)? goalSelectError,
    TResult Function()? goalSelectSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Success value) success,
    required TResult Function(_GoalSelectLoading value) goalSelectLoading,
    required TResult Function(_GoalSelectError value) goalSelectError,
    required TResult Function(_GoalSelectSuccess value) goalSelectSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Success value)? success,
    TResult? Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult? Function(_GoalSelectError value)? goalSelectError,
    TResult? Function(_GoalSelectSuccess value)? goalSelectSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Success value)? success,
    TResult Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult Function(_GoalSelectError value)? goalSelectError,
    TResult Function(_GoalSelectSuccess value)? goalSelectSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GoalState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$GoalStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_Error(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'GoalState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() empty,
    required TResult Function(List<Goal> goals) success,
    required TResult Function() goalSelectLoading,
    required TResult Function(String error) goalSelectError,
    required TResult Function() goalSelectSuccess,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? empty,
    TResult? Function(List<Goal> goals)? success,
    TResult? Function()? goalSelectLoading,
    TResult? Function(String error)? goalSelectError,
    TResult? Function()? goalSelectSuccess,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? empty,
    TResult Function(List<Goal> goals)? success,
    TResult Function()? goalSelectLoading,
    TResult Function(String error)? goalSelectError,
    TResult Function()? goalSelectSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Success value) success,
    required TResult Function(_GoalSelectLoading value) goalSelectLoading,
    required TResult Function(_GoalSelectError value) goalSelectError,
    required TResult Function(_GoalSelectSuccess value) goalSelectSuccess,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Success value)? success,
    TResult? Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult? Function(_GoalSelectError value)? goalSelectError,
    TResult? Function(_GoalSelectSuccess value)? goalSelectSuccess,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Success value)? success,
    TResult Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult Function(_GoalSelectError value)? goalSelectError,
    TResult Function(_GoalSelectSuccess value)? goalSelectSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements GoalState {
  const factory _Error({required final String error}) = _$_Error;

  String get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EmptyCopyWith<$Res> {
  factory _$$_EmptyCopyWith(_$_Empty value, $Res Function(_$_Empty) then) =
      __$$_EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EmptyCopyWithImpl<$Res>
    extends _$GoalStateCopyWithImpl<$Res, _$_Empty>
    implements _$$_EmptyCopyWith<$Res> {
  __$$_EmptyCopyWithImpl(_$_Empty _value, $Res Function(_$_Empty) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Empty implements _Empty {
  const _$_Empty();

  @override
  String toString() {
    return 'GoalState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() empty,
    required TResult Function(List<Goal> goals) success,
    required TResult Function() goalSelectLoading,
    required TResult Function(String error) goalSelectError,
    required TResult Function() goalSelectSuccess,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? empty,
    TResult? Function(List<Goal> goals)? success,
    TResult? Function()? goalSelectLoading,
    TResult? Function(String error)? goalSelectError,
    TResult? Function()? goalSelectSuccess,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? empty,
    TResult Function(List<Goal> goals)? success,
    TResult Function()? goalSelectLoading,
    TResult Function(String error)? goalSelectError,
    TResult Function()? goalSelectSuccess,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Success value) success,
    required TResult Function(_GoalSelectLoading value) goalSelectLoading,
    required TResult Function(_GoalSelectError value) goalSelectError,
    required TResult Function(_GoalSelectSuccess value) goalSelectSuccess,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Success value)? success,
    TResult? Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult? Function(_GoalSelectError value)? goalSelectError,
    TResult? Function(_GoalSelectSuccess value)? goalSelectSuccess,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Success value)? success,
    TResult Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult Function(_GoalSelectError value)? goalSelectError,
    TResult Function(_GoalSelectSuccess value)? goalSelectSuccess,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements GoalState {
  const factory _Empty() = _$_Empty;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Goal> goals});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$GoalStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goals = null,
  }) {
    return _then(_$_Success(
      goals: null == goals
          ? _value._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<Goal>,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success({required final List<Goal> goals}) : _goals = goals;

  final List<Goal> _goals;
  @override
  List<Goal> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  @override
  String toString() {
    return 'GoalState.success(goals: $goals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality().equals(other._goals, _goals));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_goals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() empty,
    required TResult Function(List<Goal> goals) success,
    required TResult Function() goalSelectLoading,
    required TResult Function(String error) goalSelectError,
    required TResult Function() goalSelectSuccess,
  }) {
    return success(goals);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? empty,
    TResult? Function(List<Goal> goals)? success,
    TResult? Function()? goalSelectLoading,
    TResult? Function(String error)? goalSelectError,
    TResult? Function()? goalSelectSuccess,
  }) {
    return success?.call(goals);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? empty,
    TResult Function(List<Goal> goals)? success,
    TResult Function()? goalSelectLoading,
    TResult Function(String error)? goalSelectError,
    TResult Function()? goalSelectSuccess,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(goals);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Success value) success,
    required TResult Function(_GoalSelectLoading value) goalSelectLoading,
    required TResult Function(_GoalSelectError value) goalSelectError,
    required TResult Function(_GoalSelectSuccess value) goalSelectSuccess,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Success value)? success,
    TResult? Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult? Function(_GoalSelectError value)? goalSelectError,
    TResult? Function(_GoalSelectSuccess value)? goalSelectSuccess,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Success value)? success,
    TResult Function(_GoalSelectLoading value)? goalSelectLoading,
    TResult Function(_GoalSelectError value)? goalSelectError,
    TResult Function(_GoalSelectSuccess value)? goalSelectSuccess,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements GoalState {
  const factory _Success({required final List<Goal> goals}) = _$_Success;

  List<Goal> get goals;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GoalSelectLoadingCopyWith<$Res> {
  factory _$$_GoalSelectLoadingCopyWith(_$_GoalSelectLoading value,
          $Res Function(_$_GoalSelectLoading) then) =
      __$$_GoalSelectLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GoalSelectLoadingCopyWithImpl<$Res>
    extends _$GoalStateCopyWithImpl<$Res, _$_GoalSelectLoading>
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
    return 'GoalState.goalSelectLoading()';
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
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() empty,
    required TResult Function(List<Goal> goals) success,
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
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? empty,
    TResult? Function(List<Goal> goals)? success,
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
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? empty,
    TResult Function(List<Goal> goals)? success,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Success value) success,
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Success value)? success,
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
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Success value)? success,
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

abstract class _GoalSelectLoading implements GoalState {
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
    extends _$GoalStateCopyWithImpl<$Res, _$_GoalSelectError>
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
    return 'GoalState.goalSelectError(error: $error)';
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
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() empty,
    required TResult Function(List<Goal> goals) success,
    required TResult Function() goalSelectLoading,
    required TResult Function(String error) goalSelectError,
    required TResult Function() goalSelectSuccess,
  }) {
    return goalSelectError(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? empty,
    TResult? Function(List<Goal> goals)? success,
    TResult? Function()? goalSelectLoading,
    TResult? Function(String error)? goalSelectError,
    TResult? Function()? goalSelectSuccess,
  }) {
    return goalSelectError?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? empty,
    TResult Function(List<Goal> goals)? success,
    TResult Function()? goalSelectLoading,
    TResult Function(String error)? goalSelectError,
    TResult Function()? goalSelectSuccess,
    required TResult orElse(),
  }) {
    if (goalSelectError != null) {
      return goalSelectError(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Success value) success,
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Success value)? success,
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
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Success value)? success,
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

abstract class _GoalSelectError implements GoalState {
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
    extends _$GoalStateCopyWithImpl<$Res, _$_GoalSelectSuccess>
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
    return 'GoalState.goalSelectSuccess()';
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
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() empty,
    required TResult Function(List<Goal> goals) success,
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
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function()? empty,
    TResult? Function(List<Goal> goals)? success,
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
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? empty,
    TResult Function(List<Goal> goals)? success,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Success value) success,
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Success value)? success,
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
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Success value)? success,
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

abstract class _GoalSelectSuccess implements GoalState {
  const factory _GoalSelectSuccess() = _$_GoalSelectSuccess;
}
