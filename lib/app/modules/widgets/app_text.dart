import 'package:flutter/material.dart';

/// ============================================================
/// Common
/// ============================================================
typedef TextStyleBuilder = TextStyle Function(TextTheme);

/// ============================================================
/// TextProps
/// ============================================================
@immutable
class TextProps {
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final TextAlign? textAlign;
  final TextScaler? textScaler;

  const TextProps({this.overflow, this.maxLines, this.softWrap, this.textAlign, this.textScaler});

  TextProps copyWith({
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
    TextAlign? textAlign,
    TextScaler? textScaler,
  }) {
    return TextProps(
      overflow: overflow ?? this.overflow,
      maxLines: maxLines ?? this.maxLines,
      softWrap: softWrap ?? this.softWrap,
      textAlign: textAlign ?? this.textAlign,
      textScaler: textScaler ?? this.textScaler,
    );
  }
}

/// ============================================================
/// ThemedText (Source of truth)
/// ============================================================
class ThemedText extends StatelessWidget {
  const ThemedText({super.key, required this.data, required this.styleBuilder, this.props = const TextProps()});

  final String data;
  final TextStyleBuilder styleBuilder;
  final TextProps props;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Text(
      data,
      style: styleBuilder(theme),
      overflow: props.overflow,
      maxLines: props.maxLines,
      softWrap: props.softWrap,
      textAlign: props.textAlign,
      textScaler: props.textScaler,
    );
  }

  // ------------------------------------------------------------
  // internal
  // ------------------------------------------------------------
  ThemedText _style(TextStyle s) =>
      ThemedText(data: data, styleBuilder: (tt) => styleBuilder(tt).merge(s), props: props);

  ThemedText _props(TextProps p) => ThemedText(
    data: data,
    styleBuilder: styleBuilder,
    props: props.copyWith(
      overflow: p.overflow,
      maxLines: p.maxLines,
      softWrap: p.softWrap,
      textAlign: p.textAlign,
      textScaler: p.textScaler,
    ),
  );

  // ------------------------------------------------------------
  // Style
  // ------------------------------------------------------------
  ThemedText color(Color v) => _style(TextStyle(color: v));
  ThemedText backgroundColor(Color v) => _style(TextStyle(backgroundColor: v));
  ThemedText size(double v) => _style(TextStyle(fontSize: v));
  ThemedText height(double v) => _style(TextStyle(height: v));
  ThemedText fontFamily(String v) => _style(TextStyle(fontFamily: v));
  ThemedText letterSpacing(double v) => _style(TextStyle(letterSpacing: v));
  ThemedText wordSpacing(double v) => _style(TextStyle(wordSpacing: v));
  ThemedText locale(Locale v) => _style(TextStyle(locale: v));
  ThemedText foreground(Paint v) => _style(TextStyle(foreground: v));
  ThemedText shadows(List<Shadow> v) => _style(TextStyle(shadows: v));
  ThemedText fontFeatures(List<FontFeature> v) => _style(TextStyle(fontFeatures: v));

  // weight
  ThemedText get thin => _style(const TextStyle(fontWeight: FontWeight.w100));
  ThemedText get extraLight => _style(const TextStyle(fontWeight: FontWeight.w200));
  ThemedText get light => _style(const TextStyle(fontWeight: FontWeight.w300));
  ThemedText get regular => _style(const TextStyle(fontWeight: FontWeight.normal));
  ThemedText get medium => _style(const TextStyle(fontWeight: FontWeight.w500));
  ThemedText get semiBold => _style(const TextStyle(fontWeight: FontWeight.w600));
  ThemedText get bold => _style(const TextStyle(fontWeight: FontWeight.w700));
  ThemedText get extraBold => _style(const TextStyle(fontWeight: FontWeight.w800));
  ThemedText get black => _style(const TextStyle(fontWeight: FontWeight.w900));

  // decoration
  ThemedText get underline => _style(const TextStyle(decoration: TextDecoration.underline));
  ThemedText get lineThrough => _style(const TextStyle(decoration: TextDecoration.lineThrough));
  ThemedText get overline => _style(const TextStyle(decoration: TextDecoration.overline));

  ThemedText get italic => _style(const TextStyle(fontStyle: FontStyle.italic));

  // layout
  ThemedText softWrap(bool v) => _props(TextProps(softWrap: v));
  ThemedText maxLines(int v) => _props(TextProps(maxLines: v));

  ThemedText get overflowEllipsis => _props(const TextProps(overflow: TextOverflow.ellipsis));

  ThemedText align(TextAlign v) => _props(TextProps(textAlign: v));

  ThemedText scale(double v) => _props(TextProps(textScaler: TextScaler.linear(v)));

  // ------------------------------------------------------------
  // Rich support
  // ------------------------------------------------------------
  InlineSpan toSpan(TextTheme theme) => TextSpan(text: data, style: styleBuilder(theme));
}

/// ============================================================
/// String → ThemedText (SAME API FOR TEXT & RICH)
/// ============================================================
extension TextEntry on String {
  ThemedText style(TextStyle s) => ThemedText(data: this, styleBuilder: (_) => s);

  ThemedText get text => ThemedText(data: this, styleBuilder: (_) => const TextStyle());

  ThemedText get displayLarge => ThemedText(data: this, styleBuilder: (t) => t.displayLarge!);
  ThemedText get displayMedium => ThemedText(data: this, styleBuilder: (t) => t.displayMedium!);
  ThemedText get displaySmall => ThemedText(data: this, styleBuilder: (t) => t.displaySmall!);

  ThemedText get headlineLarge => ThemedText(data: this, styleBuilder: (t) => t.headlineLarge!);
  ThemedText get headlineMedium => ThemedText(data: this, styleBuilder: (t) => t.headlineMedium!);
  ThemedText get headlineSmall => ThemedText(data: this, styleBuilder: (t) => t.headlineSmall!);

  ThemedText get titleLarge => ThemedText(data: this, styleBuilder: (t) => t.titleLarge!);
  ThemedText get titleMedium => ThemedText(data: this, styleBuilder: (t) => t.titleMedium!);
  ThemedText get titleSmall => ThemedText(data: this, styleBuilder: (t) => t.titleSmall!);

  ThemedText get bodyLarge => ThemedText(data: this, styleBuilder: (t) => t.bodyLarge!);
  ThemedText get bodyMedium => ThemedText(data: this, styleBuilder: (t) => t.bodyMedium!);
  ThemedText get bodySmall => ThemedText(data: this, styleBuilder: (t) => t.bodySmall!);

  ThemedText get labelLarge => ThemedText(data: this, styleBuilder: (t) => t.labelLarge!);
  ThemedText get labelMedium => ThemedText(data: this, styleBuilder: (t) => t.labelMedium!);
  ThemedText get labelSmall => ThemedText(data: this, styleBuilder: (t) => t.labelSmall!);
}

/// ============================================================
/// Rich Renderer
/// ============================================================
class Rich extends StatelessWidget {
  final List<ThemedText> children;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const Rich(this.children, {super.key, this.textAlign, this.maxLines, this.overflow});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    final span = TextSpan(children: children.map((e) => e.toSpan(theme)).toList());

    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.clip,
      text: span,
    );
  }
}

/// ============================================================
/// List<ThemedText> → .rich()
/// ============================================================
extension RichList on List<ThemedText> {
  Rich rich({TextAlign? align, int? maxLine, TextOverflow? overflow}) {
    return Rich(this, textAlign: align, maxLines: maxLine, overflow: overflow);
  }
}

/// ============================================================
/// Text.rich() Wrapper (SAME SYNTAX)
/// ============================================================
extension TextRichWrapper on Text {
  static Widget rich(List<ThemedText> children, {TextAlign? textAlign, int? maxLines, TextOverflow? overflow}) {
    return Rich(children, textAlign: textAlign, maxLines: maxLines, overflow: overflow);
  }
}
