// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
import 'dart:ui';

import 'package:moor/moor.dart';
import 'package:uuid/uuid.dart';

import 'enums.dart';

class ContentMessages extends Table {
  TextColumn get id => text().nullable().clientDefault(() => Uuid().v4())();
  TextColumn get contentGroupId => text()();
  IntColumn get threadId => integer().nullable()();
  IntColumn get appThreadId => integer().nullable()();
  IntColumn get groupMessageIndex => integer().nullable()();
  TextColumn get creatorId => text().nullable()();
  TextColumn get creator => text().nullable()();
  TextColumn get previousMessageCreatorId => text().nullable()();
  DateTimeColumn get previousMessageDisplayDate => dateTime().nullable()();
  IntColumn get targetContentMessageId => integer().nullable()();
  IntColumn get messageFlow => intEnum<MessageFlow>()();
  IntColumn get messageType => intEnum<MessageType>()();
  IntColumn get messageSubType => integer().nullable()();
  IntColumn get messageStatus => intEnum<MessageStatusType>()();
  IntColumn get forwardCount => integer().nullable().clientDefault(() => 0)();
  TextColumn get messageText => text().nullable()();
  TextColumn get embellishments => text().nullable()();
  BoolColumn get isPinned => boolean()();
  IntColumn get pinIndex => integer().nullable()();
  TextColumn get contentUrl => text().nullable()();
  BoolColumn get requiresSync => boolean().nullable().clientDefault(() => true)();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now().toUtc()).nullable()();
  DateTimeColumn get sentAt => dateTime().nullable()();
  DateTimeColumn get receivedAt => dateTime().nullable()();
  DateTimeColumn get readAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class $ContentMessagesTable extends ContentMessages
    with TableInfo<$ContentMessagesTable, ContentMessage> {
  final GeneratedDatabase _db;
  final String _alias;
  $ContentMessagesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      true,
    )..clientDefault = () => Uuid().v4();
  }

  final VerificationMeta _contentGroupIdMeta =
      const VerificationMeta('contentGroupId');
  GeneratedTextColumn _contentGroupId;
  @override
  GeneratedTextColumn get contentGroupId =>
      _contentGroupId ??= _constructContentGroupId();
  GeneratedTextColumn _constructContentGroupId() {
    return GeneratedTextColumn(
      'content_group_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _threadIdMeta = const VerificationMeta('threadId');
  GeneratedIntColumn _threadId;
  @override
  GeneratedIntColumn get threadId => _threadId ??= _constructThreadId();
  GeneratedIntColumn _constructThreadId() {
    return GeneratedIntColumn(
      'thread_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _appThreadIdMeta =
      const VerificationMeta('appThreadId');
  GeneratedIntColumn _appThreadId;
  @override
  GeneratedIntColumn get appThreadId =>
      _appThreadId ??= _constructAppThreadId();
  GeneratedIntColumn _constructAppThreadId() {
    return GeneratedIntColumn(
      'app_thread_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _groupMessageIndexMeta =
      const VerificationMeta('groupMessageIndex');
  GeneratedIntColumn _groupMessageIndex;
  @override
  GeneratedIntColumn get groupMessageIndex =>
      _groupMessageIndex ??= _constructGroupMessageIndex();
  GeneratedIntColumn _constructGroupMessageIndex() {
    return GeneratedIntColumn(
      'group_message_index',
      $tableName,
      true,
    );
  }

  final VerificationMeta _creatorIdMeta = const VerificationMeta('creatorId');
  GeneratedTextColumn _creatorId;
  @override
  GeneratedTextColumn get creatorId => _creatorId ??= _constructCreatorId();
  GeneratedTextColumn _constructCreatorId() {
    return GeneratedTextColumn(
      'creator_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _creatorMeta = const VerificationMeta('creator');
  GeneratedTextColumn _creator;
  @override
  GeneratedTextColumn get creator => _creator ??= _constructCreator();
  GeneratedTextColumn _constructCreator() {
    return GeneratedTextColumn(
      'creator',
      $tableName,
      true,
    );
  }

  final VerificationMeta _previousMessageCreatorIdMeta =
      const VerificationMeta('previousMessageCreatorId');
  GeneratedTextColumn _previousMessageCreatorId;
  @override
  GeneratedTextColumn get previousMessageCreatorId =>
      _previousMessageCreatorId ??= _constructPreviousMessageCreatorId();
  GeneratedTextColumn _constructPreviousMessageCreatorId() {
    return GeneratedTextColumn(
      'previous_message_creator_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _previousMessageDisplayDateMeta =
      const VerificationMeta('previousMessageDisplayDate');
  GeneratedDateTimeColumn _previousMessageDisplayDate;
  @override
  GeneratedDateTimeColumn get previousMessageDisplayDate =>
      _previousMessageDisplayDate ??= _constructPreviousMessageDisplayDate();
  GeneratedDateTimeColumn _constructPreviousMessageDisplayDate() {
    return GeneratedDateTimeColumn(
      'previous_message_display_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _targetContentMessageIdMeta =
      const VerificationMeta('targetContentMessageId');
  GeneratedIntColumn _targetContentMessageId;
  @override
  GeneratedIntColumn get targetContentMessageId =>
      _targetContentMessageId ??= _constructTargetContentMessageId();
  GeneratedIntColumn _constructTargetContentMessageId() {
    return GeneratedIntColumn(
      'target_content_message_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _messageFlowMeta =
      const VerificationMeta('messageFlow');
  GeneratedIntColumn _messageFlow;
  @override
  GeneratedIntColumn get messageFlow =>
      _messageFlow ??= _constructMessageFlow();
  GeneratedIntColumn _constructMessageFlow() {
    return GeneratedIntColumn(
      'message_flow',
      $tableName,
      false,
    );
  }

  final VerificationMeta _messageTypeMeta =
      const VerificationMeta('messageType');
  GeneratedIntColumn _messageType;
  @override
  GeneratedIntColumn get messageType =>
      _messageType ??= _constructMessageType();
  GeneratedIntColumn _constructMessageType() {
    return GeneratedIntColumn(
      'message_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _messageSubTypeMeta =
      const VerificationMeta('messageSubType');
  GeneratedIntColumn _messageSubType;
  @override
  GeneratedIntColumn get messageSubType =>
      _messageSubType ??= _constructMessageSubType();
  GeneratedIntColumn _constructMessageSubType() {
    return GeneratedIntColumn(
      'message_sub_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _messageStatusMeta =
      const VerificationMeta('messageStatus');
  GeneratedIntColumn _messageStatus;
  @override
  GeneratedIntColumn get messageStatus =>
      _messageStatus ??= _constructMessageStatus();
  GeneratedIntColumn _constructMessageStatus() {
    return GeneratedIntColumn(
      'message_status',
      $tableName,
      false,
    );
  }

  final VerificationMeta _forwardCountMeta =
      const VerificationMeta('forwardCount');
  GeneratedIntColumn _forwardCount;
  @override
  GeneratedIntColumn get forwardCount =>
      _forwardCount ??= _constructForwardCount();
  GeneratedIntColumn _constructForwardCount() {
    return GeneratedIntColumn(
      'forward_count',
      $tableName,
      true,
    )..clientDefault = () => 0;
  }

  final VerificationMeta _messageTextMeta =
      const VerificationMeta('messageText');
  GeneratedTextColumn _messageText;
  @override
  GeneratedTextColumn get messageText =>
      _messageText ??= _constructMessageText();
  GeneratedTextColumn _constructMessageText() {
    return GeneratedTextColumn(
      'message_text',
      $tableName,
      true,
    );
  }

  final VerificationMeta _embellishmentsMeta =
      const VerificationMeta('embellishments');
  GeneratedTextColumn _embellishments;
  @override
  GeneratedTextColumn get embellishments =>
      _embellishments ??= _constructEmbellishments();
  GeneratedTextColumn _constructEmbellishments() {
    return GeneratedTextColumn(
      'embellishments',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isPinnedMeta = const VerificationMeta('isPinned');
  GeneratedBoolColumn _isPinned;
  @override
  GeneratedBoolColumn get isPinned => _isPinned ??= _constructIsPinned();
  GeneratedBoolColumn _constructIsPinned() {
    return GeneratedBoolColumn(
      'is_pinned',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pinIndexMeta = const VerificationMeta('pinIndex');
  GeneratedIntColumn _pinIndex;
  @override
  GeneratedIntColumn get pinIndex => _pinIndex ??= _constructPinIndex();
  GeneratedIntColumn _constructPinIndex() {
    return GeneratedIntColumn(
      'pin_index',
      $tableName,
      true,
    );
  }

  final VerificationMeta _contentUrlMeta = const VerificationMeta('contentUrl');
  GeneratedTextColumn _contentUrl;
  @override
  GeneratedTextColumn get contentUrl => _contentUrl ??= _constructContentUrl();
  GeneratedTextColumn _constructContentUrl() {
    return GeneratedTextColumn(
      'content_url',
      $tableName,
      true,
    );
  }

  final VerificationMeta _requiresSyncMeta =
      const VerificationMeta('requiresSync');
  GeneratedBoolColumn _requiresSync;
  @override
  GeneratedBoolColumn get requiresSync =>
      _requiresSync ??= _constructRequiresSync();
  GeneratedBoolColumn _constructRequiresSync() {
    return GeneratedBoolColumn(
      'requires_sync',
      $tableName,
      true,
    )..clientDefault = () => true;
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  final VerificationMeta _sentAtMeta = const VerificationMeta('sentAt');
  GeneratedDateTimeColumn _sentAt;
  @override
  GeneratedDateTimeColumn get sentAt => _sentAt ??= _constructSentAt();
  GeneratedDateTimeColumn _constructSentAt() {
    return GeneratedDateTimeColumn(
      'sent_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _receivedAtMeta = const VerificationMeta('receivedAt');
  GeneratedDateTimeColumn _receivedAt;
  @override
  GeneratedDateTimeColumn get receivedAt =>
      _receivedAt ??= _constructReceivedAt();
  GeneratedDateTimeColumn _constructReceivedAt() {
    return GeneratedDateTimeColumn(
      'received_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _readAtMeta = const VerificationMeta('readAt');
  GeneratedDateTimeColumn _readAt;
  @override
  GeneratedDateTimeColumn get readAt => _readAt ??= _constructReadAt();
  GeneratedDateTimeColumn _constructReadAt() {
    return GeneratedDateTimeColumn(
      'read_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedDateTimeColumn _updatedAt;
  @override
  GeneratedDateTimeColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        contentGroupId,
        threadId,
        appThreadId,
        groupMessageIndex,
        creatorId,
        creator,
        previousMessageCreatorId,
        previousMessageDisplayDate,
        targetContentMessageId,
        messageFlow,
        messageType,
        messageSubType,
        messageStatus,
        forwardCount,
        messageText,
        embellishments,
        isPinned,
        pinIndex,
        contentUrl,
        requiresSync,
        createdAt,
        sentAt,
        receivedAt,
        readAt,
        updatedAt
      ];
  @override
  $ContentMessagesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'content_messages';
  @override
  final String actualTableName = 'content_messages';
  @override
  VerificationContext validateIntegrity(Insertable<ContentMessage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('content_group_id')) {
      context.handle(
          _contentGroupIdMeta,
          contentGroupId.isAcceptableOrUnknown(
              data['content_group_id'], _contentGroupIdMeta));
    } else if (isInserting) {
      context.missing(_contentGroupIdMeta);
    }
    if (data.containsKey('thread_id')) {
      context.handle(_threadIdMeta,
          threadId.isAcceptableOrUnknown(data['thread_id'], _threadIdMeta));
    }
    if (data.containsKey('app_thread_id')) {
      context.handle(
          _appThreadIdMeta,
          appThreadId.isAcceptableOrUnknown(
              data['app_thread_id'], _appThreadIdMeta));
    }
    if (data.containsKey('group_message_index')) {
      context.handle(
          _groupMessageIndexMeta,
          groupMessageIndex.isAcceptableOrUnknown(
              data['group_message_index'], _groupMessageIndexMeta));
    }
    if (data.containsKey('creator_id')) {
      context.handle(_creatorIdMeta,
          creatorId.isAcceptableOrUnknown(data['creator_id'], _creatorIdMeta));
    }
    if (data.containsKey('creator')) {
      context.handle(_creatorMeta,
          creator.isAcceptableOrUnknown(data['creator'], _creatorMeta));
    }
    if (data.containsKey('previous_message_creator_id')) {
      context.handle(
          _previousMessageCreatorIdMeta,
          previousMessageCreatorId.isAcceptableOrUnknown(
              data['previous_message_creator_id'],
              _previousMessageCreatorIdMeta));
    }
    if (data.containsKey('previous_message_display_date')) {
      context.handle(
          _previousMessageDisplayDateMeta,
          previousMessageDisplayDate.isAcceptableOrUnknown(
              data['previous_message_display_date'],
              _previousMessageDisplayDateMeta));
    }
    if (data.containsKey('target_content_message_id')) {
      context.handle(
          _targetContentMessageIdMeta,
          targetContentMessageId.isAcceptableOrUnknown(
              data['target_content_message_id'], _targetContentMessageIdMeta));
    }
    context.handle(_messageFlowMeta, const VerificationResult.success());
    context.handle(_messageTypeMeta, const VerificationResult.success());
    if (data.containsKey('message_sub_type')) {
      context.handle(
          _messageSubTypeMeta,
          messageSubType.isAcceptableOrUnknown(
              data['message_sub_type'], _messageSubTypeMeta));
    }
    context.handle(_messageStatusMeta, const VerificationResult.success());
    if (data.containsKey('forward_count')) {
      context.handle(
          _forwardCountMeta,
          forwardCount.isAcceptableOrUnknown(
              data['forward_count'], _forwardCountMeta));
    }
    if (data.containsKey('message_text')) {
      context.handle(
          _messageTextMeta,
          messageText.isAcceptableOrUnknown(
              data['message_text'], _messageTextMeta));
    }
    if (data.containsKey('embellishments')) {
      context.handle(
          _embellishmentsMeta,
          embellishments.isAcceptableOrUnknown(
              data['embellishments'], _embellishmentsMeta));
    }
    if (data.containsKey('is_pinned')) {
      context.handle(_isPinnedMeta,
          isPinned.isAcceptableOrUnknown(data['is_pinned'], _isPinnedMeta));
    } else if (isInserting) {
      context.missing(_isPinnedMeta);
    }
    if (data.containsKey('pin_index')) {
      context.handle(_pinIndexMeta,
          pinIndex.isAcceptableOrUnknown(data['pin_index'], _pinIndexMeta));
    }
    if (data.containsKey('content_url')) {
      context.handle(
          _contentUrlMeta,
          contentUrl.isAcceptableOrUnknown(
              data['content_url'], _contentUrlMeta));
    }
    if (data.containsKey('requires_sync')) {
      context.handle(
          _requiresSyncMeta,
          requiresSync.isAcceptableOrUnknown(
              data['requires_sync'], _requiresSyncMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    }
    if (data.containsKey('sent_at')) {
      context.handle(_sentAtMeta,
          sentAt.isAcceptableOrUnknown(data['sent_at'], _sentAtMeta));
    }
    if (data.containsKey('received_at')) {
      context.handle(
          _receivedAtMeta,
          receivedAt.isAcceptableOrUnknown(
              data['received_at'], _receivedAtMeta));
    }
    if (data.containsKey('read_at')) {
      context.handle(_readAtMeta,
          readAt.isAcceptableOrUnknown(data['read_at'], _readAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ContentMessage map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ContentMessage.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ContentMessagesTable createAlias(String alias) {
    return $ContentMessagesTable(_db, alias);
  }

  static TypeConverter<MessageFlow, int> $converter0 =
      const EnumIndexConverter<MessageFlow>(MessageFlow.values);
  static TypeConverter<MessageType, int> $converter1 =
      const EnumIndexConverter<MessageType>(MessageType.values);
  static TypeConverter<MessageStatusType, int> $converter2 =
      const EnumIndexConverter<MessageStatusType>(MessageStatusType.values);
}

class ContentMessage extends DataClass implements Insertable<ContentMessage> {
  String id;
  String contentGroupId;
  int threadId;
  int appThreadId;
  int groupMessageIndex;
  String creatorId;
  String creator;
  String previousMessageCreatorId;
  DateTime previousMessageDisplayDate;
  int targetContentMessageId;
  MessageFlow messageFlow;
  MessageType messageType;
  int messageSubType;
  MessageStatusType messageStatus;
  int forwardCount;
  String messageText;
  String embellishments;
  bool isPinned;
  int pinIndex;
  String contentUrl;
  bool requiresSync;
  DateTime createdAt;
  DateTime sentAt;
  DateTime receivedAt;
  DateTime readAt;
  DateTime updatedAt;
  ContentMessage(
      {this.id,
      @required this.contentGroupId,
      this.threadId,
      this.appThreadId,
      this.groupMessageIndex,
      this.creatorId,
      this.creator,
      this.previousMessageCreatorId,
      this.previousMessageDisplayDate,
      this.targetContentMessageId,
      @required this.messageFlow,
      @required this.messageType,
      this.messageSubType,
      @required this.messageStatus,
      this.forwardCount,
      this.messageText,
      this.embellishments,
      @required this.isPinned,
      this.pinIndex,
      this.contentUrl,
      this.requiresSync,
      this.createdAt,
      this.sentAt,
      this.receivedAt,
      this.readAt,
      this.updatedAt});
  factory ContentMessage.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return ContentMessage(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      contentGroupId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}content_group_id']),
      threadId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}thread_id']),
      appThreadId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}app_thread_id']),
      groupMessageIndex: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}group_message_index']),
      creatorId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}creator_id']),
      creator:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}creator']),
      previousMessageCreatorId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}previous_message_creator_id']),
      previousMessageDisplayDate: dateTimeType.mapFromDatabaseResponse(
          data['${effectivePrefix}previous_message_display_date']),
      targetContentMessageId: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}target_content_message_id']),
      messageFlow: $ContentMessagesTable.$converter0.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}message_flow'])),
      messageType: $ContentMessagesTable.$converter1.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}message_type'])),
      messageSubType: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}message_sub_type']),
      messageStatus: $ContentMessagesTable.$converter2.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}message_status'])),
      forwardCount: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}forward_count']),
      messageText: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}message_text']),
      embellishments: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}embellishments']),
      isPinned:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_pinned']),
      pinIndex:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}pin_index']),
      contentUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}content_url']),
      requiresSync: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}requires_sync']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      sentAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}sent_at']),
      receivedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}received_at']),
      readAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}read_at']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || contentGroupId != null) {
      map['content_group_id'] = Variable<String>(contentGroupId);
    }
    if (!nullToAbsent || threadId != null) {
      map['thread_id'] = Variable<int>(threadId);
    }
    if (!nullToAbsent || appThreadId != null) {
      map['app_thread_id'] = Variable<int>(appThreadId);
    }
    if (!nullToAbsent || groupMessageIndex != null) {
      map['group_message_index'] = Variable<int>(groupMessageIndex);
    }
    if (!nullToAbsent || creatorId != null) {
      map['creator_id'] = Variable<String>(creatorId);
    }
    if (!nullToAbsent || creator != null) {
      map['creator'] = Variable<String>(creator);
    }
    if (!nullToAbsent || previousMessageCreatorId != null) {
      map['previous_message_creator_id'] =
          Variable<String>(previousMessageCreatorId);
    }
    if (!nullToAbsent || previousMessageDisplayDate != null) {
      map['previous_message_display_date'] =
          Variable<DateTime>(previousMessageDisplayDate);
    }
    if (!nullToAbsent || targetContentMessageId != null) {
      map['target_content_message_id'] = Variable<int>(targetContentMessageId);
    }
    if (!nullToAbsent || messageFlow != null) {
      final converter = $ContentMessagesTable.$converter0;
      map['message_flow'] = Variable<int>(converter.mapToSql(messageFlow));
    }
    if (!nullToAbsent || messageType != null) {
      final converter = $ContentMessagesTable.$converter1;
      map['message_type'] = Variable<int>(converter.mapToSql(messageType));
    }
    if (!nullToAbsent || messageSubType != null) {
      map['message_sub_type'] = Variable<int>(messageSubType);
    }
    if (!nullToAbsent || messageStatus != null) {
      final converter = $ContentMessagesTable.$converter2;
      map['message_status'] = Variable<int>(converter.mapToSql(messageStatus));
    }
    if (!nullToAbsent || forwardCount != null) {
      map['forward_count'] = Variable<int>(forwardCount);
    }
    if (!nullToAbsent || messageText != null) {
      map['message_text'] = Variable<String>(messageText);
    }
    if (!nullToAbsent || embellishments != null) {
      map['embellishments'] = Variable<String>(embellishments);
    }
    if (!nullToAbsent || isPinned != null) {
      map['is_pinned'] = Variable<bool>(isPinned);
    }
    if (!nullToAbsent || pinIndex != null) {
      map['pin_index'] = Variable<int>(pinIndex);
    }
    if (!nullToAbsent || contentUrl != null) {
      map['content_url'] = Variable<String>(contentUrl);
    }
    if (!nullToAbsent || requiresSync != null) {
      map['requires_sync'] = Variable<bool>(requiresSync);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || sentAt != null) {
      map['sent_at'] = Variable<DateTime>(sentAt);
    }
    if (!nullToAbsent || receivedAt != null) {
      map['received_at'] = Variable<DateTime>(receivedAt);
    }
    if (!nullToAbsent || readAt != null) {
      map['read_at'] = Variable<DateTime>(readAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  ContentMessagesCompanion toCompanion(bool nullToAbsent) {
    return ContentMessagesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      contentGroupId: contentGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(contentGroupId),
      threadId: threadId == null && nullToAbsent
          ? const Value.absent()
          : Value(threadId),
      appThreadId: appThreadId == null && nullToAbsent
          ? const Value.absent()
          : Value(appThreadId),
      groupMessageIndex: groupMessageIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(groupMessageIndex),
      creatorId: creatorId == null && nullToAbsent
          ? const Value.absent()
          : Value(creatorId),
      creator: creator == null && nullToAbsent
          ? const Value.absent()
          : Value(creator),
      previousMessageCreatorId: previousMessageCreatorId == null && nullToAbsent
          ? const Value.absent()
          : Value(previousMessageCreatorId),
      previousMessageDisplayDate:
          previousMessageDisplayDate == null && nullToAbsent
              ? const Value.absent()
              : Value(previousMessageDisplayDate),
      targetContentMessageId: targetContentMessageId == null && nullToAbsent
          ? const Value.absent()
          : Value(targetContentMessageId),
      messageFlow: messageFlow == null && nullToAbsent
          ? const Value.absent()
          : Value(messageFlow),
      messageType: messageType == null && nullToAbsent
          ? const Value.absent()
          : Value(messageType),
      messageSubType: messageSubType == null && nullToAbsent
          ? const Value.absent()
          : Value(messageSubType),
      messageStatus: messageStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(messageStatus),
      forwardCount: forwardCount == null && nullToAbsent
          ? const Value.absent()
          : Value(forwardCount),
      messageText: messageText == null && nullToAbsent
          ? const Value.absent()
          : Value(messageText),
      embellishments: embellishments == null && nullToAbsent
          ? const Value.absent()
          : Value(embellishments),
      isPinned: isPinned == null && nullToAbsent
          ? const Value.absent()
          : Value(isPinned),
      pinIndex: pinIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(pinIndex),
      contentUrl: contentUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(contentUrl),
      requiresSync: requiresSync == null && nullToAbsent
          ? const Value.absent()
          : Value(requiresSync),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      sentAt:
          sentAt == null && nullToAbsent ? const Value.absent() : Value(sentAt),
      receivedAt: receivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(receivedAt),
      readAt:
          readAt == null && nullToAbsent ? const Value.absent() : Value(readAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory ContentMessage.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ContentMessage(
      id: serializer.fromJson<String>(json['id']),
      contentGroupId: serializer.fromJson<String>(json['contentGroupId']),
      threadId: serializer.fromJson<int>(json['threadId']),
      appThreadId: serializer.fromJson<int>(json['appThreadId']),
      groupMessageIndex: serializer.fromJson<int>(json['groupMessageIndex']),
      creatorId: serializer.fromJson<String>(json['creatorId']),
      creator: serializer.fromJson<String>(json['creator']),
      previousMessageCreatorId:
          serializer.fromJson<String>(json['previousMessageCreatorId']),
      previousMessageDisplayDate:
          serializer.fromJson<DateTime>(json['previousMessageDisplayDate']),
      targetContentMessageId:
          serializer.fromJson<int>(json['targetContentMessageId']),
      messageFlow: serializer.fromJson<MessageFlow>(json['messageFlow']),
      messageType: serializer.fromJson<MessageType>(json['messageType']),
      messageSubType: serializer.fromJson<int>(json['messageSubType']),
      messageStatus:
          serializer.fromJson<MessageStatusType>(json['messageStatus']),
      forwardCount: serializer.fromJson<int>(json['forwardCount']),
      messageText: serializer.fromJson<String>(json['messageText']),
      embellishments: serializer.fromJson<String>(json['embellishments']),
      isPinned: serializer.fromJson<bool>(json['isPinned']),
      pinIndex: serializer.fromJson<int>(json['pinIndex']),
      contentUrl: serializer.fromJson<String>(json['contentUrl']),
      requiresSync: serializer.fromJson<bool>(json['requiresSync']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      sentAt: serializer.fromJson<DateTime>(json['sentAt']),
      receivedAt: serializer.fromJson<DateTime>(json['receivedAt']),
      readAt: serializer.fromJson<DateTime>(json['readAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'contentGroupId': serializer.toJson<String>(contentGroupId),
      'threadId': serializer.toJson<int>(threadId),
      'appThreadId': serializer.toJson<int>(appThreadId),
      'groupMessageIndex': serializer.toJson<int>(groupMessageIndex),
      'creatorId': serializer.toJson<String>(creatorId),
      'creator': serializer.toJson<String>(creator),
      'previousMessageCreatorId':
          serializer.toJson<String>(previousMessageCreatorId),
      'previousMessageDisplayDate':
          serializer.toJson<DateTime>(previousMessageDisplayDate),
      'targetContentMessageId': serializer.toJson<int>(targetContentMessageId),
      'messageFlow': serializer.toJson<MessageFlow>(messageFlow),
      'messageType': serializer.toJson<MessageType>(messageType),
      'messageSubType': serializer.toJson<int>(messageSubType),
      'messageStatus': serializer.toJson<MessageStatusType>(messageStatus),
      'forwardCount': serializer.toJson<int>(forwardCount),
      'messageText': serializer.toJson<String>(messageText),
      'embellishments': serializer.toJson<String>(embellishments),
      'isPinned': serializer.toJson<bool>(isPinned),
      'pinIndex': serializer.toJson<int>(pinIndex),
      'contentUrl': serializer.toJson<String>(contentUrl),
      'requiresSync': serializer.toJson<bool>(requiresSync),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'sentAt': serializer.toJson<DateTime>(sentAt),
      'receivedAt': serializer.toJson<DateTime>(receivedAt),
      'readAt': serializer.toJson<DateTime>(readAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ContentMessage copyWith(
          {String id,
          String contentGroupId,
          int threadId,
          int appThreadId,
          int groupMessageIndex,
          String creatorId,
          String creator,
          String previousMessageCreatorId,
          DateTime previousMessageDisplayDate,
          int targetContentMessageId,
          MessageFlow messageFlow,
          MessageType messageType,
          int messageSubType,
          MessageStatusType messageStatus,
          int forwardCount,
          String messageText,
          String embellishments,
          bool isPinned,
          int pinIndex,
          String contentUrl,
          bool requiresSync,
          DateTime createdAt,
          DateTime sentAt,
          DateTime receivedAt,
          DateTime readAt,
          DateTime updatedAt}) =>
      ContentMessage(
        id: id ?? this.id,
        contentGroupId: contentGroupId ?? this.contentGroupId,
        threadId: threadId ?? this.threadId,
        appThreadId: appThreadId ?? this.appThreadId,
        groupMessageIndex: groupMessageIndex ?? this.groupMessageIndex,
        creatorId: creatorId ?? this.creatorId,
        creator: creator ?? this.creator,
        previousMessageCreatorId:
            previousMessageCreatorId ?? this.previousMessageCreatorId,
        previousMessageDisplayDate:
            previousMessageDisplayDate ?? this.previousMessageDisplayDate,
        targetContentMessageId:
            targetContentMessageId ?? this.targetContentMessageId,
        messageFlow: messageFlow ?? this.messageFlow,
        messageType: messageType ?? this.messageType,
        messageSubType: messageSubType ?? this.messageSubType,
        messageStatus: messageStatus ?? this.messageStatus,
        forwardCount: forwardCount ?? this.forwardCount,
        messageText: messageText ?? this.messageText,
        embellishments: embellishments ?? this.embellishments,
        isPinned: isPinned ?? this.isPinned,
        pinIndex: pinIndex ?? this.pinIndex,
        contentUrl: contentUrl ?? this.contentUrl,
        requiresSync: requiresSync ?? this.requiresSync,
        createdAt: createdAt ?? this.createdAt,
        sentAt: sentAt ?? this.sentAt,
        receivedAt: receivedAt ?? this.receivedAt,
        readAt: readAt ?? this.readAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('ContentMessage(')
          ..write('id: $id, ')
          ..write('contentGroupId: $contentGroupId, ')
          ..write('threadId: $threadId, ')
          ..write('appThreadId: $appThreadId, ')
          ..write('groupMessageIndex: $groupMessageIndex, ')
          ..write('creatorId: $creatorId, ')
          ..write('creator: $creator, ')
          ..write('previousMessageCreatorId: $previousMessageCreatorId, ')
          ..write('previousMessageDisplayDate: $previousMessageDisplayDate, ')
          ..write('targetContentMessageId: $targetContentMessageId, ')
          ..write('messageFlow: $messageFlow, ')
          ..write('messageType: $messageType, ')
          ..write('messageSubType: $messageSubType, ')
          ..write('messageStatus: $messageStatus, ')
          ..write('forwardCount: $forwardCount, ')
          ..write('messageText: $messageText, ')
          ..write('embellishments: $embellishments, ')
          ..write('isPinned: $isPinned, ')
          ..write('pinIndex: $pinIndex, ')
          ..write('contentUrl: $contentUrl, ')
          ..write('requiresSync: $requiresSync, ')
          ..write('createdAt: $createdAt, ')
          ..write('sentAt: $sentAt, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('readAt: $readAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          contentGroupId.hashCode,
          $mrjc(
              threadId.hashCode,
              $mrjc(
                  appThreadId.hashCode,
                  $mrjc(
                      groupMessageIndex.hashCode,
                      $mrjc(
                          creatorId.hashCode,
                          $mrjc(
                              creator.hashCode,
                              $mrjc(
                                  previousMessageCreatorId.hashCode,
                                  $mrjc(
                                      previousMessageDisplayDate.hashCode,
                                      $mrjc(
                                          targetContentMessageId.hashCode,
                                          $mrjc(
                                              messageFlow.hashCode,
                                              $mrjc(
                                                  messageType.hashCode,
                                                  $mrjc(
                                                      messageSubType.hashCode,
                                                      $mrjc(
                                                          messageStatus
                                                              .hashCode,
                                                          $mrjc(
                                                              forwardCount
                                                                  .hashCode,
                                                              $mrjc(
                                                                  messageText
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      embellishments
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          isPinned
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              pinIndex.hashCode,
                                                                              $mrjc(contentUrl.hashCode, $mrjc(requiresSync.hashCode, $mrjc(createdAt.hashCode, $mrjc(sentAt.hashCode, $mrjc(receivedAt.hashCode, $mrjc(readAt.hashCode, updatedAt.hashCode))))))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ContentMessage &&
          other.id == this.id &&
          other.contentGroupId == this.contentGroupId &&
          other.threadId == this.threadId &&
          other.appThreadId == this.appThreadId &&
          other.groupMessageIndex == this.groupMessageIndex &&
          other.creatorId == this.creatorId &&
          other.creator == this.creator &&
          other.previousMessageCreatorId == this.previousMessageCreatorId &&
          other.previousMessageDisplayDate == this.previousMessageDisplayDate &&
          other.targetContentMessageId == this.targetContentMessageId &&
          other.messageFlow == this.messageFlow &&
          other.messageType == this.messageType &&
          other.messageSubType == this.messageSubType &&
          other.messageStatus == this.messageStatus &&
          other.forwardCount == this.forwardCount &&
          other.messageText == this.messageText &&
          other.embellishments == this.embellishments &&
          other.isPinned == this.isPinned &&
          other.pinIndex == this.pinIndex &&
          other.contentUrl == this.contentUrl &&
          other.requiresSync == this.requiresSync &&
          other.createdAt == this.createdAt &&
          other.sentAt == this.sentAt &&
          other.receivedAt == this.receivedAt &&
          other.readAt == this.readAt &&
          other.updatedAt == this.updatedAt);
}

class ContentMessagesCompanion extends UpdateCompanion<ContentMessage> {
  Value<String> id;
  Value<String> contentGroupId;
  Value<int> threadId;
  Value<int> appThreadId;
  Value<int> groupMessageIndex;
  Value<String> creatorId;
  Value<String> creator;
  Value<String> previousMessageCreatorId;
  Value<DateTime> previousMessageDisplayDate;
  Value<int> targetContentMessageId;
  Value<MessageFlow> messageFlow;
  Value<MessageType> messageType;
  Value<int> messageSubType;
  Value<MessageStatusType> messageStatus;
  Value<int> forwardCount;
  Value<String> messageText;
  Value<String> embellishments;
  Value<bool> isPinned;
  Value<int> pinIndex;
  Value<String> contentUrl;
  Value<bool> requiresSync;
  Value<DateTime> createdAt;
  Value<DateTime> sentAt;
  Value<DateTime> receivedAt;
  Value<DateTime> readAt;
  Value<DateTime> updatedAt;
  ContentMessagesCompanion({
    this.id = const Value.absent(),
    this.contentGroupId = const Value.absent(),
    this.threadId = const Value.absent(),
    this.appThreadId = const Value.absent(),
    this.groupMessageIndex = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.creator = const Value.absent(),
    this.previousMessageCreatorId = const Value.absent(),
    this.previousMessageDisplayDate = const Value.absent(),
    this.targetContentMessageId = const Value.absent(),
    this.messageFlow = const Value.absent(),
    this.messageType = const Value.absent(),
    this.messageSubType = const Value.absent(),
    this.messageStatus = const Value.absent(),
    this.forwardCount = const Value.absent(),
    this.messageText = const Value.absent(),
    this.embellishments = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.pinIndex = const Value.absent(),
    this.contentUrl = const Value.absent(),
    this.requiresSync = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.sentAt = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.readAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ContentMessagesCompanion.insert({
    this.id = const Value.absent(),
    @required String contentGroupId,
    this.threadId = const Value.absent(),
    this.appThreadId = const Value.absent(),
    this.groupMessageIndex = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.creator = const Value.absent(),
    this.previousMessageCreatorId = const Value.absent(),
    this.previousMessageDisplayDate = const Value.absent(),
    this.targetContentMessageId = const Value.absent(),
    @required MessageFlow messageFlow,
    @required MessageType messageType,
    this.messageSubType = const Value.absent(),
    @required MessageStatusType messageStatus,
    this.forwardCount = const Value.absent(),
    this.messageText = const Value.absent(),
    this.embellishments = const Value.absent(),
    @required bool isPinned,
    this.pinIndex = const Value.absent(),
    this.contentUrl = const Value.absent(),
    this.requiresSync = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.sentAt = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.readAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : contentGroupId = Value(contentGroupId),
        messageFlow = Value(messageFlow),
        messageType = Value(messageType),
        messageStatus = Value(messageStatus),
        isPinned = Value(isPinned);
  static Insertable<ContentMessage> custom({
    Expression<String> id,
    Expression<String> contentGroupId,
    Expression<int> threadId,
    Expression<int> appThreadId,
    Expression<int> groupMessageIndex,
    Expression<String> creatorId,
    Expression<String> creator,
    Expression<String> previousMessageCreatorId,
    Expression<DateTime> previousMessageDisplayDate,
    Expression<int> targetContentMessageId,
    Expression<int> messageFlow,
    Expression<int> messageType,
    Expression<int> messageSubType,
    Expression<int> messageStatus,
    Expression<int> forwardCount,
    Expression<String> messageText,
    Expression<String> embellishments,
    Expression<bool> isPinned,
    Expression<int> pinIndex,
    Expression<String> contentUrl,
    Expression<bool> requiresSync,
    Expression<DateTime> createdAt,
    Expression<DateTime> sentAt,
    Expression<DateTime> receivedAt,
    Expression<DateTime> readAt,
    Expression<DateTime> updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (contentGroupId != null) 'content_group_id': contentGroupId,
      if (threadId != null) 'thread_id': threadId,
      if (appThreadId != null) 'app_thread_id': appThreadId,
      if (groupMessageIndex != null) 'group_message_index': groupMessageIndex,
      if (creatorId != null) 'creator_id': creatorId,
      if (creator != null) 'creator': creator,
      if (previousMessageCreatorId != null)
        'previous_message_creator_id': previousMessageCreatorId,
      if (previousMessageDisplayDate != null)
        'previous_message_display_date': previousMessageDisplayDate,
      if (targetContentMessageId != null)
        'target_content_message_id': targetContentMessageId,
      if (messageFlow != null) 'message_flow': messageFlow,
      if (messageType != null) 'message_type': messageType,
      if (messageSubType != null) 'message_sub_type': messageSubType,
      if (messageStatus != null) 'message_status': messageStatus,
      if (forwardCount != null) 'forward_count': forwardCount,
      if (messageText != null) 'message_text': messageText,
      if (embellishments != null) 'embellishments': embellishments,
      if (isPinned != null) 'is_pinned': isPinned,
      if (pinIndex != null) 'pin_index': pinIndex,
      if (contentUrl != null) 'content_url': contentUrl,
      if (requiresSync != null) 'requires_sync': requiresSync,
      if (createdAt != null) 'created_at': createdAt,
      if (sentAt != null) 'sent_at': sentAt,
      if (receivedAt != null) 'received_at': receivedAt,
      if (readAt != null) 'read_at': readAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ContentMessagesCompanion copyWith(
      {Value<String> id,
      Value<String> contentGroupId,
      Value<int> threadId,
      Value<int> appThreadId,
      Value<int> groupMessageIndex,
      Value<String> creatorId,
      Value<String> creator,
      Value<String> previousMessageCreatorId,
      Value<DateTime> previousMessageDisplayDate,
      Value<int> targetContentMessageId,
      Value<MessageFlow> messageFlow,
      Value<MessageType> messageType,
      Value<int> messageSubType,
      Value<MessageStatusType> messageStatus,
      Value<int> forwardCount,
      Value<String> messageText,
      Value<String> embellishments,
      Value<bool> isPinned,
      Value<int> pinIndex,
      Value<String> contentUrl,
      Value<bool> requiresSync,
      Value<DateTime> createdAt,
      Value<DateTime> sentAt,
      Value<DateTime> receivedAt,
      Value<DateTime> readAt,
      Value<DateTime> updatedAt}) {
    return ContentMessagesCompanion(
      id: id ?? this.id,
      contentGroupId: contentGroupId ?? this.contentGroupId,
      threadId: threadId ?? this.threadId,
      appThreadId: appThreadId ?? this.appThreadId,
      groupMessageIndex: groupMessageIndex ?? this.groupMessageIndex,
      creatorId: creatorId ?? this.creatorId,
      creator: creator ?? this.creator,
      previousMessageCreatorId:
          previousMessageCreatorId ?? this.previousMessageCreatorId,
      previousMessageDisplayDate:
          previousMessageDisplayDate ?? this.previousMessageDisplayDate,
      targetContentMessageId:
          targetContentMessageId ?? this.targetContentMessageId,
      messageFlow: messageFlow ?? this.messageFlow,
      messageType: messageType ?? this.messageType,
      messageSubType: messageSubType ?? this.messageSubType,
      messageStatus: messageStatus ?? this.messageStatus,
      forwardCount: forwardCount ?? this.forwardCount,
      messageText: messageText ?? this.messageText,
      embellishments: embellishments ?? this.embellishments,
      isPinned: isPinned ?? this.isPinned,
      pinIndex: pinIndex ?? this.pinIndex,
      contentUrl: contentUrl ?? this.contentUrl,
      requiresSync: requiresSync ?? this.requiresSync,
      createdAt: createdAt ?? this.createdAt,
      sentAt: sentAt ?? this.sentAt,
      receivedAt: receivedAt ?? this.receivedAt,
      readAt: readAt ?? this.readAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (contentGroupId.present) {
      map['content_group_id'] = Variable<String>(contentGroupId.value);
    }
    if (threadId.present) {
      map['thread_id'] = Variable<int>(threadId.value);
    }
    if (appThreadId.present) {
      map['app_thread_id'] = Variable<int>(appThreadId.value);
    }
    if (groupMessageIndex.present) {
      map['group_message_index'] = Variable<int>(groupMessageIndex.value);
    }
    if (creatorId.present) {
      map['creator_id'] = Variable<String>(creatorId.value);
    }
    if (creator.present) {
      map['creator'] = Variable<String>(creator.value);
    }
    if (previousMessageCreatorId.present) {
      map['previous_message_creator_id'] =
          Variable<String>(previousMessageCreatorId.value);
    }
    if (previousMessageDisplayDate.present) {
      map['previous_message_display_date'] =
          Variable<DateTime>(previousMessageDisplayDate.value);
    }
    if (targetContentMessageId.present) {
      map['target_content_message_id'] =
          Variable<int>(targetContentMessageId.value);
    }
    if (messageFlow.present) {
      final converter = $ContentMessagesTable.$converter0;
      map['message_flow'] =
          Variable<int>(converter.mapToSql(messageFlow.value));
    }
    if (messageType.present) {
      final converter = $ContentMessagesTable.$converter1;
      map['message_type'] =
          Variable<int>(converter.mapToSql(messageType.value));
    }
    if (messageSubType.present) {
      map['message_sub_type'] = Variable<int>(messageSubType.value);
    }
    if (messageStatus.present) {
      final converter = $ContentMessagesTable.$converter2;
      map['message_status'] =
          Variable<int>(converter.mapToSql(messageStatus.value));
    }
    if (forwardCount.present) {
      map['forward_count'] = Variable<int>(forwardCount.value);
    }
    if (messageText.present) {
      map['message_text'] = Variable<String>(messageText.value);
    }
    if (embellishments.present) {
      map['embellishments'] = Variable<String>(embellishments.value);
    }
    if (isPinned.present) {
      map['is_pinned'] = Variable<bool>(isPinned.value);
    }
    if (pinIndex.present) {
      map['pin_index'] = Variable<int>(pinIndex.value);
    }
    if (contentUrl.present) {
      map['content_url'] = Variable<String>(contentUrl.value);
    }
    if (requiresSync.present) {
      map['requires_sync'] = Variable<bool>(requiresSync.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (sentAt.present) {
      map['sent_at'] = Variable<DateTime>(sentAt.value);
    }
    if (receivedAt.present) {
      map['received_at'] = Variable<DateTime>(receivedAt.value);
    }
    if (readAt.present) {
      map['read_at'] = Variable<DateTime>(readAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContentMessagesCompanion(')
          ..write('id: $id, ')
          ..write('contentGroupId: $contentGroupId, ')
          ..write('threadId: $threadId, ')
          ..write('appThreadId: $appThreadId, ')
          ..write('groupMessageIndex: $groupMessageIndex, ')
          ..write('creatorId: $creatorId, ')
          ..write('creator: $creator, ')
          ..write('previousMessageCreatorId: $previousMessageCreatorId, ')
          ..write('previousMessageDisplayDate: $previousMessageDisplayDate, ')
          ..write('targetContentMessageId: $targetContentMessageId, ')
          ..write('messageFlow: $messageFlow, ')
          ..write('messageType: $messageType, ')
          ..write('messageSubType: $messageSubType, ')
          ..write('messageStatus: $messageStatus, ')
          ..write('forwardCount: $forwardCount, ')
          ..write('messageText: $messageText, ')
          ..write('embellishments: $embellishments, ')
          ..write('isPinned: $isPinned, ')
          ..write('pinIndex: $pinIndex, ')
          ..write('contentUrl: $contentUrl, ')
          ..write('requiresSync: $requiresSync, ')
          ..write('createdAt: $createdAt, ')
          ..write('sentAt: $sentAt, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('readAt: $readAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class ContentMessageEmbellished {
  final ContentMessage cm;
  final String profileImage; 
  final String creatorFirstName;
  final String creatorLastName;
  final Color avatarBackgroundColour;
  final Color avatarFontColour;

  ContentMessageEmbellished({this.cm, this.profileImage, this.creatorFirstName, this.creatorLastName, this.avatarBackgroundColour, this.avatarFontColour});
}    
