# listglitch

A demo app for ScrollablePositionedList.builder glitchiness

## Getting Started

Look at lib/chat_container.dart in build(). The relevant code snippet is:

  // Smoooooooth :-)
  //return getListView(snapshot);
  // Gliiiiiiiiiiitchy :-(
  return getScrollablePositionedListView(snapshot);

This is set up to demo ScrollablePositionedListView glitchiness. Uncomment return getListView(snapshot) to show how smooth it should be. (Once the AnimatedList has taken its sweet time to scroll to the end of the list.) You'll have to hot restart to swap between them.

In initState() you can play with the timer to control the rate at which the message count is updated and how many increments are emitted at once. (Simulates message flow coming in.)

You can also change the number of initial messages in the list:

  int currentItemCount = 0;
