// GENERATED FILE
// DO NOT MODIFY
// ignore_for_file: type=lint
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$DeleteReview {
  factory Variables$Mutation$DeleteReview({int? deleteReviewId}) =>
      Variables$Mutation$DeleteReview._({
        if (deleteReviewId != null) r'deleteReviewId': deleteReviewId,
      });

  Variables$Mutation$DeleteReview._(this._$data);

  factory Variables$Mutation$DeleteReview.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('deleteReviewId')) {
      final l$deleteReviewId = data['deleteReviewId'];
      result$data['deleteReviewId'] = (l$deleteReviewId as int?);
    }
    return Variables$Mutation$DeleteReview._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get deleteReviewId => (_$data['deleteReviewId'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('deleteReviewId')) {
      final l$deleteReviewId = deleteReviewId;
      result$data['deleteReviewId'] = l$deleteReviewId;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteReview<Variables$Mutation$DeleteReview>
      get copyWith => CopyWith$Variables$Mutation$DeleteReview(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteReview ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteReviewId = deleteReviewId;
    final lOther$deleteReviewId = other.deleteReviewId;
    if (_$data.containsKey('deleteReviewId') !=
        other._$data.containsKey('deleteReviewId')) {
      return false;
    }
    if (l$deleteReviewId != lOther$deleteReviewId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$deleteReviewId = deleteReviewId;
    return Object.hashAll(
        [_$data.containsKey('deleteReviewId') ? l$deleteReviewId : const {}]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteReview<TRes> {
  factory CopyWith$Variables$Mutation$DeleteReview(
    Variables$Mutation$DeleteReview instance,
    TRes Function(Variables$Mutation$DeleteReview) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteReview;

  factory CopyWith$Variables$Mutation$DeleteReview.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteReview;

  TRes call({int? deleteReviewId});
}

class _CopyWithImpl$Variables$Mutation$DeleteReview<TRes>
    implements CopyWith$Variables$Mutation$DeleteReview<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteReview(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteReview _instance;

  final TRes Function(Variables$Mutation$DeleteReview) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? deleteReviewId = _undefined}) =>
      _then(Variables$Mutation$DeleteReview._({
        ..._instance._$data,
        if (deleteReviewId != _undefined)
          'deleteReviewId': (deleteReviewId as int?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteReview<TRes>
    implements CopyWith$Variables$Mutation$DeleteReview<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteReview(this._res);

  TRes _res;

  call({int? deleteReviewId}) => _res;
}

class Mutation$DeleteReview {
  Mutation$DeleteReview({
    this.DeleteReview,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteReview.fromJson(Map<String, dynamic> json) {
    final l$DeleteReview = json['DeleteReview'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteReview(
      DeleteReview: l$DeleteReview == null
          ? null
          : Mutation$DeleteReview$DeleteReview.fromJson(
              (l$DeleteReview as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteReview$DeleteReview? DeleteReview;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$DeleteReview = DeleteReview;
    _resultData['DeleteReview'] = l$DeleteReview?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$DeleteReview = DeleteReview;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$DeleteReview,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteReview || runtimeType != other.runtimeType) {
      return false;
    }
    final l$DeleteReview = DeleteReview;
    final lOther$DeleteReview = other.DeleteReview;
    if (l$DeleteReview != lOther$DeleteReview) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$DeleteReview on Mutation$DeleteReview {
  CopyWith$Mutation$DeleteReview<Mutation$DeleteReview> get copyWith =>
      CopyWith$Mutation$DeleteReview(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteReview<TRes> {
  factory CopyWith$Mutation$DeleteReview(
    Mutation$DeleteReview instance,
    TRes Function(Mutation$DeleteReview) then,
  ) = _CopyWithImpl$Mutation$DeleteReview;

  factory CopyWith$Mutation$DeleteReview.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteReview;

  TRes call({
    Mutation$DeleteReview$DeleteReview? DeleteReview,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteReview$DeleteReview<TRes> get DeleteReview;
}

class _CopyWithImpl$Mutation$DeleteReview<TRes>
    implements CopyWith$Mutation$DeleteReview<TRes> {
  _CopyWithImpl$Mutation$DeleteReview(
    this._instance,
    this._then,
  );

  final Mutation$DeleteReview _instance;

  final TRes Function(Mutation$DeleteReview) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? DeleteReview = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteReview(
        DeleteReview: DeleteReview == _undefined
            ? _instance.DeleteReview
            : (DeleteReview as Mutation$DeleteReview$DeleteReview?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$DeleteReview$DeleteReview<TRes> get DeleteReview {
    final local$DeleteReview = _instance.DeleteReview;
    return local$DeleteReview == null
        ? CopyWith$Mutation$DeleteReview$DeleteReview.stub(_then(_instance))
        : CopyWith$Mutation$DeleteReview$DeleteReview(
            local$DeleteReview, (e) => call(DeleteReview: e));
  }
}

class _CopyWithStubImpl$Mutation$DeleteReview<TRes>
    implements CopyWith$Mutation$DeleteReview<TRes> {
  _CopyWithStubImpl$Mutation$DeleteReview(this._res);

  TRes _res;

  call({
    Mutation$DeleteReview$DeleteReview? DeleteReview,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$DeleteReview$DeleteReview<TRes> get DeleteReview =>
      CopyWith$Mutation$DeleteReview$DeleteReview.stub(_res);
}

const documentNodeMutationDeleteReview = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteReview'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'deleteReviewId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'DeleteReview'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'deleteReviewId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'deleted'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$DeleteReview _parserFn$Mutation$DeleteReview(
        Map<String, dynamic> data) =>
    Mutation$DeleteReview.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteReview = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$DeleteReview?,
);

class Options$Mutation$DeleteReview
    extends graphql.MutationOptions<Mutation$DeleteReview> {
  Options$Mutation$DeleteReview({
    String? operationName,
    Variables$Mutation$DeleteReview? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteReview? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteReview? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteReview>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$DeleteReview(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteReview,
          parserFn: _parserFn$Mutation$DeleteReview,
        );

  final OnMutationCompleted$Mutation$DeleteReview? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteReview
    extends graphql.WatchQueryOptions<Mutation$DeleteReview> {
  WatchOptions$Mutation$DeleteReview({
    String? operationName,
    Variables$Mutation$DeleteReview? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteReview? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationDeleteReview,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteReview,
        );
}

extension ClientExtension$Mutation$DeleteReview on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteReview>> mutate$DeleteReview(
          [Options$Mutation$DeleteReview? options]) async =>
      await this.mutate(options ?? Options$Mutation$DeleteReview());
  graphql.ObservableQuery<Mutation$DeleteReview> watchMutation$DeleteReview(
          [WatchOptions$Mutation$DeleteReview? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$DeleteReview());
}

class Mutation$DeleteReview$HookResult {
  Mutation$DeleteReview$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$DeleteReview runMutation;

  final graphql.QueryResult<Mutation$DeleteReview> result;
}

Mutation$DeleteReview$HookResult useMutation$DeleteReview(
    [WidgetOptions$Mutation$DeleteReview? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$DeleteReview());
  return Mutation$DeleteReview$HookResult(
    ({variables, optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables?.toJson() ?? const {},
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteReview> useWatchMutation$DeleteReview(
        [WatchOptions$Mutation$DeleteReview? options]) =>
    graphql_flutter
        .useWatchMutation(options ?? WatchOptions$Mutation$DeleteReview());

class WidgetOptions$Mutation$DeleteReview
    extends graphql.MutationOptions<Mutation$DeleteReview> {
  WidgetOptions$Mutation$DeleteReview({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteReview? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteReview? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteReview>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$DeleteReview(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteReview,
          parserFn: _parserFn$Mutation$DeleteReview,
        );

  final OnMutationCompleted$Mutation$DeleteReview? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$DeleteReview
    = graphql.MultiSourceResult<Mutation$DeleteReview> Function({
  Variables$Mutation$DeleteReview? variables,
  Object? optimisticResult,
  Mutation$DeleteReview? typedOptimisticResult,
});
typedef Builder$Mutation$DeleteReview = widgets.Widget Function(
  RunMutation$Mutation$DeleteReview,
  graphql.QueryResult<Mutation$DeleteReview>?,
);

class Mutation$DeleteReview$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteReview> {
  Mutation$DeleteReview$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteReview? options,
    required Builder$Mutation$DeleteReview builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$DeleteReview(),
          builder: (
            run,
            result,
          ) =>
              builder(
            ({
              variables,
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables?.toJson() ?? const {},
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$DeleteReview$DeleteReview {
  Mutation$DeleteReview$DeleteReview({
    this.deleted,
    this.$__typename = 'Deleted',
  });

  factory Mutation$DeleteReview$DeleteReview.fromJson(
      Map<String, dynamic> json) {
    final l$deleted = json['deleted'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteReview$DeleteReview(
      deleted: (l$deleted as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? deleted;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleted = deleted;
    _resultData['deleted'] = l$deleted;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleted = deleted;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleted,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteReview$DeleteReview ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleted = deleted;
    final lOther$deleted = other.deleted;
    if (l$deleted != lOther$deleted) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$DeleteReview$DeleteReview
    on Mutation$DeleteReview$DeleteReview {
  CopyWith$Mutation$DeleteReview$DeleteReview<
          Mutation$DeleteReview$DeleteReview>
      get copyWith => CopyWith$Mutation$DeleteReview$DeleteReview(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteReview$DeleteReview<TRes> {
  factory CopyWith$Mutation$DeleteReview$DeleteReview(
    Mutation$DeleteReview$DeleteReview instance,
    TRes Function(Mutation$DeleteReview$DeleteReview) then,
  ) = _CopyWithImpl$Mutation$DeleteReview$DeleteReview;

  factory CopyWith$Mutation$DeleteReview$DeleteReview.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteReview$DeleteReview;

  TRes call({
    bool? deleted,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteReview$DeleteReview<TRes>
    implements CopyWith$Mutation$DeleteReview$DeleteReview<TRes> {
  _CopyWithImpl$Mutation$DeleteReview$DeleteReview(
    this._instance,
    this._then,
  );

  final Mutation$DeleteReview$DeleteReview _instance;

  final TRes Function(Mutation$DeleteReview$DeleteReview) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleted = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteReview$DeleteReview(
        deleted: deleted == _undefined ? _instance.deleted : (deleted as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteReview$DeleteReview<TRes>
    implements CopyWith$Mutation$DeleteReview$DeleteReview<TRes> {
  _CopyWithStubImpl$Mutation$DeleteReview$DeleteReview(this._res);

  TRes _res;

  call({
    bool? deleted,
    String? $__typename,
  }) =>
      _res;
}
