@HtmlImport('context_menu.html')
library context_menu;

import 'dart:async';
import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

@PolymerRegister('context-menu')
class ContextMenu extends PolymerElement {
  ContextMenu.created() : super.created();

  static const String contextMenuSelect = 'context-menu-select';

//  static const EventStreamProvider<CustomEvent> _contextMenuSelect =
//      const EventStreamProvider<CustomEvent>(contextMenuSelect);

  static const EventStreamProvider _contextMenuSelect =
      const EventStreamProvider(contextMenuSelect);


    Stream<CustomEvent> get onContextMenuSelect =>
      ContextMenu._contextMenuSelect.forTarget(this);

  @override
  attached() {
    onContextMenuSelect.listen((CustomEvent e) {
      print(e);
    });
    onClick.listen((MouseEvent e) {
      //fire(ContextMenu.contextMenuSelect);
      dispatchEvent(new CustomEvent(ContextMenu.contextMenuSelect));
    });
  }
}
