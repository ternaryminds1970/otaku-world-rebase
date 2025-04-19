// GENERATED FILE
// DO NOT MODIFY
// ignore_for_file: type=lint
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$SaveReview {
  factory Variables$Mutation$SaveReview({
    int? saveReviewId,
    required int mediaId,
    required String body,
    required String summary,
    required int score,
    bool? private,
  }) =>
      Variables$Mutation$SaveReview._({
        if (saveReviewId != null) r'saveReviewId': saveReviewId,
        r'mediaId': mediaId,
        r'body': body,
        r'summary': summary,
        r'score': score,
        if (private != null) r'private': private,
      });

  Variables$Mutation$SaveReview._(this._$data);

  factory Variables$Mutation$SaveReview.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('saveReviewId')) {
      final l$saveReviewId = data['saveReviewId'];
      result$data['saveReviewId'] = (l$saveReviewId as int?);
    }
    final l$mediaId = data['mediaId'];
    result$data['mediaId'] = (l$mediaId as int);
    final l$body = data['body'];
    result$data['body'] = (l$body as String);
    final l$summary = data['summary'];
    result$data['summary'] = (l$summary as String);
    final l$score = data['score'];
    result$data['score'] = (l$score as int);
    if (data.containsKey('private')) {
      final l$private = data['private'];
      result$data['private'] = (l$private as bool?);
    }
    return Variables$Mutation$SaveReview._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get saveReviewId => (_$data['saveReviewId'] as int?);

  int get mediaId => (_$data['mediaId'] as int);

  String get body => (_$data['body'] as String);

  String get summary => (_$data['summary'] as String);

  int get score => (_$data['score'] as int);

  bool? get private => (_$data['private'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('saveReviewId')) {
      final l$saveReviewId = saveReviewId;
      result$data['saveReviewId'] = l$saveReviewId;
    }
    final l$mediaId = mediaId;
    result$data['mediaId'] = l$mediaId;
    final l$body = body;
    result$data['body'] = l$body;
    final l$summary = summary;
    result$data['summary'] = l$summary;
    final l$score = score;
    result$data['score'] = l$score;
    if (_$data.containsKey('private')) {
      final l$private = private;
      result$data['private'] = l$private;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$SaveReview<Variables$Mutation$SaveReview>
      get copyWith => CopyWith$Variables$Mutation$SaveReview(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$SaveReview ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$saveReviewId = saveReviewId;
    final lOther$saveReviewId = other.saveReviewId;
    if (_$data.containsKey('saveReviewId') !=
        other._$data.containsKey('saveReviewId')) {
      return false;
    }
    if (l$saveReviewId != lOther$saveReviewId) {
      return false;
    }
    final l$mediaId = mediaId;
    final lOther$mediaId = other.mediaId;
    if (l$mediaId != lOther$mediaId) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$summary = summary;
    final lOther$summary = other.summary;
    if (l$summary != lOther$summary) {
      return false;
    }
    final l$score = score;
    final lOther$score = other.score;
    if (l$score != lOther$score) {
      return false;
    }
    final l$private = private;
    final lOther$private = other.private;
    if (_$data.containsKey('private') != other._$data.containsKey('private')) {
      return false;
    }
    if (l$private != lOther$private) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$saveReviewId = saveReviewId;
    final l$mediaId = mediaId;
    final l$body = body;
    final l$summary = summary;
    final l$score = score;
    final l$private = private;
    return Object.hashAll([
      _$data.containsKey('saveReviewId') ? l$saveReviewId : const {},
      l$mediaId,
      l$body,
      l$summary,
      l$score,
      _$data.containsKey('private') ? l$private : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SaveReview<TRes> {
  factory CopyWith$Variables$Mutation$SaveReview(
    Variables$Mutation$SaveReview instance,
    TRes Function(Variables$Mutation$SaveReview) then,
  ) = _CopyWithImpl$Variables$Mutation$SaveReview;

  factory CopyWith$Variables$Mutation$SaveReview.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SaveReview;

  TRes call({
    int? saveReviewId,
    int? mediaId,
    String? body,
    String? summary,
    int? score,
    bool? private,
  });
}

class _CopyWithImpl$Variables$Mutation$SaveReview<TRes>
    implements CopyWith$Variables$Mutation$SaveReview<TRes> {
  _CopyWithImpl$Variables$Mutation$SaveReview(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SaveReview _instance;

  final TRes Function(Variables$Mutation$SaveReview) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? saveReviewId = _undefined,
    Object? mediaId = _undefined,
    Object? body = _undefined,
    Object? summary = _undefined,
    Object? score = _undefined,
    Object? private = _undefined,
  }) =>
      _then(Variables$Mutation$SaveReview._({
        ..._instance._$data,
        if (saveReviewId != _undefined) 'saveReviewId': (saveReviewId as int?),
        if (mediaId != _undefined && mediaId != null)
          'mediaId': (mediaId as int),
        if (body != _undefined && body != null) 'body': (body as String),
        if (summary != _undefined && summary != null)
          'summary': (summary as String),
        if (score != _undefined && score != null) 'score': (score as int),
        if (private != _undefined) 'private': (private as bool?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SaveReview<TRes>
    implements CopyWith$Variables$Mutation$SaveReview<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SaveReview(this._res);

  TRes _res;

  call({
    int? saveReviewId,
    int? mediaId,
    String? body,
    String? summary,
    int? score,
    bool? private,
  }) =>
      _res;
}

class Mutation$SaveReview {
  Mutation$SaveReview({
    this.SaveReview,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SaveReview.fromJson(Map<String, dynamic> json) {
    final l$SaveReview = json['SaveReview'];
    final l$$__typename = json['__typename'];
    return Mutation$SaveReview(
      SaveReview: l$SaveReview == null
          ? null
          : Mutation$SaveReview$SaveReview.fromJson(
              (l$SaveReview as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SaveReview$SaveReview? SaveReview;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$SaveReview = SaveReview;
    _resultData['SaveReview'] = l$SaveReview?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$SaveReview = SaveReview;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$SaveReview,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SaveReview || runtimeType != other.runtimeType) {
      return false;
    }
    final l$SaveReview = SaveReview;
    final lOther$SaveReview = other.SaveReview;
    if (l$SaveReview != lOther$SaveReview) {
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

extension UtilityExtension$Mutation$SaveReview on Mutation$SaveReview {
  CopyWith$Mutation$SaveReview<Mutation$SaveReview> get copyWith =>
      CopyWith$Mutation$SaveReview(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SaveReview<TRes> {
  factory CopyWith$Mutation$SaveReview(
    Mutation$SaveReview instance,
    TRes Function(Mutation$SaveReview) then,
  ) = _CopyWithImpl$Mutation$SaveReview;

  factory CopyWith$Mutation$SaveReview.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SaveReview;

  TRes call({
    Mutation$SaveReview$SaveReview? SaveReview,
    String? $__typename,
  });
  CopyWith$Mutation$SaveReview$SaveReview<TRes> get SaveReview;
}

class _CopyWithImpl$Mutation$SaveReview<TRes>
    implements CopyWith$Mutation$SaveReview<TRes> {
  _CopyWithImpl$Mutation$SaveReview(
    this._instance,
    this._then,
  );

  final Mutation$SaveReview _instance;

  final TRes Function(Mutation$SaveReview) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? SaveReview = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SaveReview(
        SaveReview: SaveReview == _undefined
            ? _instance.SaveReview
            : (SaveReview as Mutation$SaveReview$SaveReview?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SaveReview$SaveReview<TRes> get SaveReview {
    final local$SaveReview = _instance.SaveReview;
    return local$SaveReview == null
        ? CopyWith$Mutation$SaveReview$SaveReview.stub(_then(_instance))
        : CopyWith$Mutation$SaveReview$SaveReview(
            local$SaveReview, (e) => call(SaveReview: e));
  }
}

class _CopyWithStubImpl$Mutation$SaveReview<TRes>
    implements CopyWith$Mutation$SaveReview<TRes> {
  _CopyWithStubImpl$Mutation$SaveReview(this._res);

  TRes _res;

  call({
    Mutation$SaveReview$SaveReview? SaveReview,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SaveReview$SaveReview<TRes> get SaveReview =>
      CopyWith$Mutation$SaveReview$SaveReview.stub(_res);
}

const documentNodeMutationSaveReview = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SaveReview'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'saveReviewId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'mediaId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'body')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'summary')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'score')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'private')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'SaveReview'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'saveReviewId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'mediaId'),
            value: VariableNode(name: NameNode(value: 'mediaId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'body'),
            value: VariableNode(name: NameNode(value: 'body')),
          ),
          ArgumentNode(
            name: NameNode(value: 'summary'),
            value: VariableNode(name: NameNode(value: 'summary')),
          ),
          ArgumentNode(
            name: NameNode(value: 'score'),
            value: VariableNode(name: NameNode(value: 'score')),
          ),
          ArgumentNode(
            name: NameNode(value: 'private'),
            value: VariableNode(name: NameNode(value: 'private')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'mediaId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'body'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'summary'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'score'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'private'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'updatedAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'rating'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'ratingAmount'),
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
Mutation$SaveReview _parserFn$Mutation$SaveReview(Map<String, dynamic> data) =>
    Mutation$SaveReview.fromJson(data);
typedef OnMutationCompleted$Mutation$SaveReview = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$SaveReview?,
);

class Options$Mutation$SaveReview
    extends graphql.MutationOptions<Mutation$SaveReview> {
  Options$Mutation$SaveReview({
    String? operationName,
    required Variables$Mutation$SaveReview variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SaveReview? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SaveReview? onCompleted,
    graphql.OnMutationUpdate<Mutation$SaveReview>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
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
                    data == null ? null : _parserFn$Mutation$SaveReview(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSaveReview,
          parserFn: _parserFn$Mutation$SaveReview,
        );

  final OnMutationCompleted$Mutation$SaveReview? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SaveReview
    extends graphql.WatchQueryOptions<Mutation$SaveReview> {
  WatchOptions$Mutation$SaveReview({
    String? operationName,
    required Variables$Mutation$SaveReview variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SaveReview? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationSaveReview,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SaveReview,
        );
}

extension ClientExtension$Mutation$SaveReview on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SaveReview>> mutate$SaveReview(
          Options$Mutation$SaveReview options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$SaveReview> watchMutation$SaveReview(
          WatchOptions$Mutation$SaveReview options) =>
      this.watchMutation(options);
}

class Mutation$SaveReview$HookResult {
  Mutation$SaveReview$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SaveReview runMutation;

  final graphql.QueryResult<Mutation$SaveReview> result;
}

Mutation$SaveReview$HookResult useMutation$SaveReview(
    [WidgetOptions$Mutation$SaveReview? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SaveReview());
  return Mutation$SaveReview$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SaveReview> useWatchMutation$SaveReview(
        WatchOptions$Mutation$SaveReview options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SaveReview
    extends graphql.MutationOptions<Mutation$SaveReview> {
  WidgetOptions$Mutation$SaveReview({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SaveReview? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SaveReview? onCompleted,
    graphql.OnMutationUpdate<Mutation$SaveReview>? update,
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
                    data == null ? null : _parserFn$Mutation$SaveReview(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSaveReview,
          parserFn: _parserFn$Mutation$SaveReview,
        );

  final OnMutationCompleted$Mutation$SaveReview? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SaveReview
    = graphql.MultiSourceResult<Mutation$SaveReview> Function(
  Variables$Mutation$SaveReview, {
  Object? optimisticResult,
  Mutation$SaveReview? typedOptimisticResult,
});
typedef Builder$Mutation$SaveReview = widgets.Widget Function(
  RunMutation$Mutation$SaveReview,
  graphql.QueryResult<Mutation$SaveReview>?,
);

class Mutation$SaveReview$Widget
    extends graphql_flutter.Mutation<Mutation$SaveReview> {
  Mutation$SaveReview$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SaveReview? options,
    required Builder$Mutation$SaveReview builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SaveReview(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class   Mutation$SaveReview$SaveReview {
  Mutation$SaveReview$SaveReview({
    required this.id,
    required this.mediaId,
    this.body,
    this.summary,
    this.score,
    this.private,
    required this.createdAt,
    required this.updatedAt,
    this.rating,
    this.ratingAmount,
    this.$__typename = 'Review',
  });

  factory Mutation$SaveReview$SaveReview.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$mediaId = json['mediaId'];
    final l$body = json['body'];
    final l$summary = json['summary'];
    final l$score = json['score'];
    final l$private = json['private'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$rating = json['rating'];
    final l$ratingAmount = json['ratingAmount'];
    final l$$__typename = json['__typename'];
    return Mutation$SaveReview$SaveReview(
      id: (l$id as int),
      mediaId: (l$mediaId as int),
      body: (l$body as String?),
      summary: (l$summary as String?),
      score: (l$score as int?),
      private: (l$private as bool?),
      createdAt: (l$createdAt as int),
      updatedAt: (l$updatedAt as int),
      rating: (l$rating as int?),
      ratingAmount: (l$ratingAmount as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final int mediaId;

  final String? body;

  final String? summary;

  final int? score;

  final bool? private;

  final int createdAt;

  final int updatedAt;

  final int? rating;

  final int? ratingAmount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$mediaId = mediaId;
    _resultData['mediaId'] = l$mediaId;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$summary = summary;
    _resultData['summary'] = l$summary;
    final l$score = score;
    _resultData['score'] = l$score;
    final l$private = private;
    _resultData['private'] = l$private;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    final l$rating = rating;
    _resultData['rating'] = l$rating;
    final l$ratingAmount = ratingAmount;
    _resultData['ratingAmount'] = l$ratingAmount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$mediaId = mediaId;
    final l$body = body;
    final l$summary = summary;
    final l$score = score;
    final l$private = private;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$rating = rating;
    final l$ratingAmount = ratingAmount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$mediaId,
      l$body,
      l$summary,
      l$score,
      l$private,
      l$createdAt,
      l$updatedAt,
      l$rating,
      l$ratingAmount,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SaveReview$SaveReview ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$mediaId = mediaId;
    final lOther$mediaId = other.mediaId;
    if (l$mediaId != lOther$mediaId) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$summary = summary;
    final lOther$summary = other.summary;
    if (l$summary != lOther$summary) {
      return false;
    }
    final l$score = score;
    final lOther$score = other.score;
    if (l$score != lOther$score) {
      return false;
    }
    final l$private = private;
    final lOther$private = other.private;
    if (l$private != lOther$private) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$rating = rating;
    final lOther$rating = other.rating;
    if (l$rating != lOther$rating) {
      return false;
    }
    final l$ratingAmount = ratingAmount;
    final lOther$ratingAmount = other.ratingAmount;
    if (l$ratingAmount != lOther$ratingAmount) {
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

extension UtilityExtension$Mutation$SaveReview$SaveReview
    on Mutation$SaveReview$SaveReview {
  CopyWith$Mutation$SaveReview$SaveReview<Mutation$SaveReview$SaveReview>
      get copyWith => CopyWith$Mutation$SaveReview$SaveReview(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SaveReview$SaveReview<TRes> {
  factory CopyWith$Mutation$SaveReview$SaveReview(
    Mutation$SaveReview$SaveReview instance,
    TRes Function(Mutation$SaveReview$SaveReview) then,
  ) = _CopyWithImpl$Mutation$SaveReview$SaveReview;

  factory CopyWith$Mutation$SaveReview$SaveReview.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SaveReview$SaveReview;

  TRes call({
    int? id,
    int? mediaId,
    String? body,
    String? summary,
    int? score,
    bool? private,
    int? createdAt,
    int? updatedAt,
    int? rating,
    int? ratingAmount,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SaveReview$SaveReview<TRes>
    implements CopyWith$Mutation$SaveReview$SaveReview<TRes> {
  _CopyWithImpl$Mutation$SaveReview$SaveReview(
    this._instance,
    this._then,
  );

  final Mutation$SaveReview$SaveReview _instance;

  final TRes Function(Mutation$SaveReview$SaveReview) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? mediaId = _undefined,
    Object? body = _undefined,
    Object? summary = _undefined,
    Object? score = _undefined,
    Object? private = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? rating = _undefined,
    Object? ratingAmount = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SaveReview$SaveReview(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        mediaId: mediaId == _undefined || mediaId == null
            ? _instance.mediaId
            : (mediaId as int),
        body: body == _undefined ? _instance.body : (body as String?),
        summary:
            summary == _undefined ? _instance.summary : (summary as String?),
        score: score == _undefined ? _instance.score : (score as int?),
        private: private == _undefined ? _instance.private : (private as bool?),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as int),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as int),
        rating: rating == _undefined ? _instance.rating : (rating as int?),
        ratingAmount: ratingAmount == _undefined
            ? _instance.ratingAmount
            : (ratingAmount as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SaveReview$SaveReview<TRes>
    implements CopyWith$Mutation$SaveReview$SaveReview<TRes> {
  _CopyWithStubImpl$Mutation$SaveReview$SaveReview(this._res);

  TRes _res;

  call({
    int? id,
    int? mediaId,
    String? body,
    String? summary,
    int? score,
    bool? private,
    int? createdAt,
    int? updatedAt,
    int? rating,
    int? ratingAmount,
    String? $__typename,
  }) =>
      _res;
}
