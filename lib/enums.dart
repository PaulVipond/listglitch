/// Represents the position of a [MessageBase] relative to others
/// Determines the flow of the message;
/// [incoming] == a message from another user
/// [outgoing] == a message from the app user
enum MessageFlow { outgoing, incoming }

/// The type of selection passed in [SelectionEvent]
enum SelectionType { select, unSelect }

/// The type of the [MessageBase], see [MessageBase.messageType]
enum MessageType { text, image, audio, video, admin, form, action }

enum MessageStatusType { created, sent, received, read }

/// An event called by [MessageInputTypingHandler] when the user starts or stop typing
enum TypingEvent { start, stop }
