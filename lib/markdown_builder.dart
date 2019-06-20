import 'dart:async';
import 'package:build/build.dart';
import 'package:markdown/markdown.dart';

/// Dart build plugin for transforming Markdown documents to HTML.
Builder markdownBuilder(_) => const MarkdownBuilder();

/// Dart build plugin for transforming Markdown documents to HTML.
class MarkdownBuilder implements Builder {
  const MarkdownBuilder();

  @override
  Map<String, List<String>> get buildExtensions {
    return {
      '.md': ['.html'],
      '.md': ['.html']
    };
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    var inputId = buildStep.inputId;
    var outputId = inputId.changeExtension('.html');
    var contents = await buildStep.readAsString(inputId);
    var html = markdownToHtml(contents, extensionSet: ExtensionSet.gitHubWeb);
    await buildStep.writeAsString(outputId, html);
  }
}
