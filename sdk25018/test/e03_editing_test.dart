@TestOn('vm')
library bwu_datagrid_examples.test.e03_editing_test;

import 'dart:async' show Future, Stream;

import 'package:test/test.dart';
import 'package:webdriver/io.dart' as wd;
import 'package:webdriver/io.dart' as core;

const pubServePort = 21234;
const pubServeIp = '127.0.0.1';

Future<String> get webServer async =>
    'http://${await pubServeIp}:${pubServePort}';

String pageUrl;
class WebBrowser {
  static const android = const WebBrowser(core.Browser.android);
  static const chrome = const WebBrowser(core.Browser.chrome);
  static const edge = const WebBrowser('MicrosoftEdge');
  static const firefox = const WebBrowser(core.Browser.firefox);
  static const ie = const WebBrowser(core.Browser.ie);
  static const ipad = const WebBrowser(core.Browser.ipad);
  static const iphone = const WebBrowser(core.Browser.iphone);
  static const opera = const WebBrowser(core.Browser.opera);
  static const safari = const WebBrowser(core.Browser.safari);

  static const values = const [
    android,
    chrome,
    edge,
    firefox,
    ie,
    ipad,
    iphone,
    opera,
    safari
  ];

  final String value;
  const WebBrowser(this.value);
}

typedef dynamic BrowserTest(WebBrowser browser);

class WebElement {
  String text;
}
class ExtendedWebDriver {
  quit(){}
  findElements(By by){}
}

dynamic main() async {
  pageUrl = '${await webServer}/e03_editing.html';
//  tests(WebBrowser.chrome);
}

class By implements wd.By {
  @override
  Map<String, String> toJson() {
    return {};
  }

  const By.cssSelector(String x);
  const By.shadow(String x);
}
const By buttonsSelector = const By.cssSelector('body > div > div > button');

Future<WebElement> findSaveButton(wd.WebDriver driver) =>
    findButton(driver, 'Save');
Future<WebElement> findCancelButton(wd.WebDriver driver) =>
    findButton(driver, 'Cancel');

/// Find the buttons in the multiline text editor.
Future<WebElement> findButton(wd.WebDriver driver, String text) async {
  return driver
      .findElements(buttonsSelector)
      .asyncMap((WebElement e) async => {'button': e, 'text': await e.text})
      .where((Map m) => m['text'] == text)
      .map((Map m) => m['button'])
      .first as WebElement;
}
