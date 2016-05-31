import 'dart:html';
import 'dart:async';

class ContextMenu extends HtmlElement {
  ContextMenu.created() : super.created() {
    print('ContextMenu created!');
  }

  @override
  void attached() {
    var root = this.createShadowRoot();
    root.append(new DivElement()..appendText('menu - click me'));
  }

  static const String contextMenuSelect = 'context-menu-select';

  static const EventStreamProvider<CustomEvent> _contextMenuSelect =
      const EventStreamProvider<CustomEvent>(contextMenuSelect);

    Stream<CustomEvent> get onContextMenuSelect =>
      ContextMenu._contextMenuSelect.forTarget(this);
}

void main() {
  document.registerElement('context-menu', ContextMenu);
  ContextMenu menu = new Element.tag('context-menu');
  document.body.append(menu);
  menu.onContextMenuSelect.listen((CustomEvent e) {
    print(e);
  });
  menu.onClick.listen((MouseEvent e) {
    menu.dispatchEvent(new CustomEvent(ContextMenu.contextMenuSelect));
  });
}
