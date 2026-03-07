import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBarItem {
  final IconData icon;
  final String label;

  const GlassBarItem({required this.icon, required this.label});
}

class GlassBottomNavStyle {
  final Color pillTint;
  final double pillBlurSigma;
  final double pillFilmStart;
  final double pillFilmEnd;
  final double pillBorderOpacity;
  final bool showSpecularDot;
  final double pillFrostOpacity;

  final Color accent;
  final double height;
  final double radius;
  final EdgeInsets barPadding;
  final double widthFactor;
  final double edgePadding;

  final double selectedWidthFactor;
  final double selectedSideInsetPx;
  final double selectedHeightFactor;
  final double selectedInsetPx;
  final bool selectedCornerAuto;
  final double selectedBlurSigma;
  final double selectedStartOpacity;
  final double selectedEndOpacity;
  final double selectedBorderOpacity;
  final double selectedFrostOpacity;
  final double selectedRadialOpacity;
  final double selectedRadialRadiusFactor;
  final Alignment selectedRadialCenter;

  final double searchButtonSize;
  final double searchButtonBlur;
  final double searchButtonBorderWidth;
  final double searchGap;
  final IconData searchIcon;

  const GlassBottomNavStyle({
    this.pillTint = const Color(0xFFFFFFFF),
    this.pillBlurSigma = 46,
    this.pillFilmStart = 0.26,
    this.pillFilmEnd = 0.12,
    this.pillBorderOpacity = 0.18,
    this.showSpecularDot = false,
    this.pillFrostOpacity = 0.06,
    this.accent = const Color(0xFFFF2D55),
    this.height = 68,
    this.radius = 26,
    this.barPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.widthFactor = 0.86,
    this.edgePadding = 16,
    this.selectedWidthFactor = 1,
    this.selectedSideInsetPx = 1.5,
    this.selectedHeightFactor = 1,
    this.selectedInsetPx = 1,
    this.selectedCornerAuto = true,
    this.selectedBlurSigma = 44,
    this.selectedStartOpacity = 0.30,
    this.selectedEndOpacity = 0.16,
    this.selectedBorderOpacity = 0.26,
    this.selectedFrostOpacity = 0.10,
    this.selectedRadialOpacity = 0.14,
    this.selectedRadialRadiusFactor = 0.90,
    this.selectedRadialCenter = const Alignment(-0.020, -0.20),
    this.searchButtonSize = 54,
    this.searchButtonBlur = 48,
    this.searchButtonBorderWidth = 1.4,
    this.searchGap = 12,
    this.searchIcon = Icons.search_rounded,
  });

  GlassBottomNavStyle copyWith({
    Color? pillTint,
    double? pillBlurSigma,
    double? pillFilmStart,
    double? pillFilmEnd,
    double? pillBorderOpacity,
    bool? showSpecularDot,
    double? pillFrostOpacity,
    Color? accent,
    double? height,
    double? radius,
    EdgeInsets? barPadding,
    double? widthFactor,
    double? edgePadding,
    double? selectedWidthFactor,
    double? selectedSideInsetPx,
    double? selectedHeightFactor,
    double? selectedInsetPx,
    bool? selectedCornerAuto,
    double? selectedBlurSigma,
    double? selectedStartOpacity,
    double? selectedEndOpacity,
    double? selectedBorderOpacity,
    double? selectedFrostOpacity,
    double? selectedRadialOpacity,
    double? selectedRadialRadiusFactor,
    Alignment? selectedRadialCenter,
    double? searchButtonSize,
    double? searchButtonBlur,
    double? searchButtonBorderWidth,
    double? searchGap,
    IconData? searchIcon,
  }) {
    return GlassBottomNavStyle(
      pillTint: pillTint ?? this.pillTint,
      pillBlurSigma: pillBlurSigma ?? this.pillBlurSigma,
      pillFilmStart: pillFilmStart ?? this.pillFilmStart,
      pillFilmEnd: pillFilmEnd ?? this.pillFilmEnd,
      pillBorderOpacity: pillBorderOpacity ?? this.pillBorderOpacity,
      showSpecularDot: showSpecularDot ?? this.showSpecularDot,
      pillFrostOpacity: pillFrostOpacity ?? this.pillFrostOpacity,
      accent: accent ?? this.accent,
      height: height ?? this.height,
      radius: radius ?? this.radius,
      barPadding: barPadding ?? this.barPadding,
      widthFactor: widthFactor ?? this.widthFactor,
      edgePadding: edgePadding ?? this.edgePadding,
      selectedWidthFactor: selectedWidthFactor ?? this.selectedWidthFactor,
      selectedSideInsetPx: selectedSideInsetPx ?? this.selectedSideInsetPx,
      selectedHeightFactor: selectedHeightFactor ?? this.selectedHeightFactor,
      selectedInsetPx: selectedInsetPx ?? this.selectedInsetPx,
      selectedCornerAuto: selectedCornerAuto ?? this.selectedCornerAuto,
      selectedBlurSigma: selectedBlurSigma ?? this.selectedBlurSigma,
      selectedStartOpacity: selectedStartOpacity ?? this.selectedStartOpacity,
      selectedEndOpacity: selectedEndOpacity ?? this.selectedEndOpacity,
      selectedBorderOpacity:
          selectedBorderOpacity ?? this.selectedBorderOpacity,
      selectedFrostOpacity: selectedFrostOpacity ?? this.selectedFrostOpacity,
      selectedRadialOpacity:
          selectedRadialOpacity ?? this.selectedRadialOpacity,
      selectedRadialRadiusFactor:
          selectedRadialRadiusFactor ?? this.selectedRadialRadiusFactor,
      selectedRadialCenter: selectedRadialCenter ?? this.selectedRadialCenter,
      searchButtonSize: searchButtonSize ?? this.searchButtonSize,
      searchButtonBlur: searchButtonBlur ?? this.searchButtonBlur,
      searchButtonBorderWidth:
          searchButtonBorderWidth ?? this.searchButtonBorderWidth,
      searchGap: searchGap ?? this.searchGap,
      searchIcon: searchIcon ?? this.searchIcon,
    );
  }
}

class GlassBottomBar extends StatefulWidget {
  final List<GlassBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final VoidCallback? onSearchTap;
  final GlassBottomNavStyle style;
  final double? width;
  final double? height;

  const GlassBottomBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.onSearchTap,
    this.style = const GlassBottomNavStyle(),
    this.width,
    this.height,
  }) : assert(
         items.length >= 2 && items.length <= 4,
         'GlassBottomBar supports 2 to 4 items.',
       ),
       assert(
         currentIndex >= 0 && currentIndex < items.length,
         'currentIndex must be in range of items.',
       ),
       assert(width == null || width > 0, 'width must be greater than 0.'),
       assert(height == null || height > 0, 'height must be greater than 0.');

  @override
  State<GlassBottomBar> createState() => _GlassBottomBarState();
}

class _GlassBottomBarState extends State<GlassBottomBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 340),
  );

  late int _oldIndex = widget.currentIndex;
  late int _fromIndex = widget.currentIndex;
  late int _toIndex = widget.currentIndex;

  @override
  void didUpdateWidget(covariant GlassBottomBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_oldIndex != widget.currentIndex) {
      _fromIndex = oldWidget.currentIndex;
      _toIndex = widget.currentIndex;
      _controller.forward(from: 0);
      _oldIndex = widget.currentIndex;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.style;
    final hasSearch = widget.onSearchTap != null;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.hasBoundedWidth
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;

        final trailingTotal = hasSearch
            ? style.searchButtonSize + style.searchGap
            : 0.0;
        final availableForContent = math.max(
          0,
          availableWidth - (2 * style.edgePadding),
        );
        final maxBarWidth = math.max(0, availableForContent - trailingTotal);
        final targetBarWidth =
            availableWidth * style.widthFactor -
            (2 * style.edgePadding) -
            trailingTotal;

        const minBarWidth = 160.0;
        final effectiveMin = math.min(minBarWidth, maxBarWidth);
        final autoBarWidth = targetBarWidth
            .clamp(effectiveMin, maxBarWidth)
            .toDouble();
        final barWidth = widget.width != null
            ? widget.width!.clamp(0.0, maxBarWidth).toDouble()
            : autoBarWidth;

        final scale = (availableWidth / 390).clamp(0.9, 1.15).toDouble();
        final autoHeight = (56 * scale).clamp(50.0, 72.0).toDouble();
        final barHeight = widget.height ?? autoHeight;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: style.edgePadding),
            _FrostedPill(
              key: const ValueKey('glass_bottom_bar_pill'),
              width: barWidth,
              height: barHeight,
              radius: style.radius,
              padding: style.barPadding,
              blurSigma: style.pillBlurSigma,
              filmStart: style.pillFilmStart,
              filmEnd: style.pillFilmEnd,
              rimOpacity: style.pillBorderOpacity,
              tint: style.pillTint,
              frostOpacity: style.pillFrostOpacity,
              showSpecularDot: style.showSpecularDot,
              child: _BarContent(
                items: widget.items,
                currentIndex: widget.currentIndex,
                onTap: widget.onTap,
                accent: style.accent,
                controller: _controller,
                selectedWidthFactor: style.selectedWidthFactor,
                selectedSideInsetPx: style.selectedSideInsetPx,
                selectedHeightFactor: style.selectedHeightFactor,
                selectedInsetPx: style.selectedInsetPx,
                selectedCornerAuto: style.selectedCornerAuto,
                selectedBlurSigma: style.selectedBlurSigma,
                selectedStartOpacity: style.selectedStartOpacity,
                selectedEndOpacity: style.selectedEndOpacity,
                selectedBorderOpacity: style.selectedBorderOpacity,
                selectedFrostOpacity: style.selectedFrostOpacity,
                selectedRadialOpacity: style.selectedRadialOpacity,
                selectedRadialRadiusFactor: style.selectedRadialRadiusFactor,
                selectedRadialCenter: style.selectedRadialCenter,
                fromIndex: _fromIndex,
                toIndex: _toIndex,
              ),
            ),
            if (hasSearch) SizedBox(width: style.searchGap),
            if (hasSearch)
              SizedBox(
                width: style.searchButtonSize,
                height: barHeight,
                child: Center(
                  child: _GlassCircleButton(
                    key: const ValueKey('glass_bottom_bar_search_button'),
                    icon: style.searchIcon,
                    onTap: widget.onSearchTap!,
                    size: style.searchButtonSize,
                    blur: style.searchButtonBlur,
                    borderWidth: style.searchButtonBorderWidth,
                  ),
                ),
              ),
            SizedBox(width: style.edgePadding),
          ],
        );
      },
    );
  }
}

class _BarContent extends StatelessWidget {
  final List<GlassBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color accent;
  final AnimationController controller;
  final double selectedWidthFactor;
  final double selectedSideInsetPx;
  final double selectedHeightFactor;
  final double selectedInsetPx;
  final bool selectedCornerAuto;
  final double selectedBlurSigma;
  final double selectedStartOpacity;
  final double selectedEndOpacity;
  final double selectedBorderOpacity;
  final double selectedFrostOpacity;
  final double selectedRadialOpacity;
  final double selectedRadialRadiusFactor;
  final Alignment selectedRadialCenter;
  final int fromIndex;
  final int toIndex;

  const _BarContent({
    required this.items,
    required this.currentIndex,
    required this.onTap,
    required this.accent,
    required this.controller,
    required this.selectedWidthFactor,
    required this.selectedSideInsetPx,
    required this.selectedHeightFactor,
    required this.selectedInsetPx,
    required this.selectedCornerAuto,
    required this.selectedBlurSigma,
    required this.selectedStartOpacity,
    required this.selectedEndOpacity,
    required this.selectedBorderOpacity,
    required this.selectedFrostOpacity,
    required this.selectedRadialOpacity,
    required this.selectedRadialRadiusFactor,
    required this.selectedRadialCenter,
    required this.fromIndex,
    required this.toIndex,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemW = constraints.maxWidth / items.length;

        const minSelH = 24.0;
        final maxSelH = math.max(
          minSelH,
          constraints.maxHeight - (2 * selectedInsetPx),
        );
        final selH = (constraints.maxHeight * selectedHeightFactor)
            .clamp(minSelH, maxSelH)
            .toDouble();

        final availW = math.max(0, itemW - (2 * selectedSideInsetPx));
        final selW = (availW * selectedWidthFactor)
            .clamp(48.0, availW)
            .toDouble();
        final left =
            currentIndex * itemW + selectedSideInsetPx + ((availW - selW) / 2);
        final top = (constraints.maxHeight - selH) / 2;
        final corner = selectedCornerAuto ? selH / 2 : 20.0;

        return Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 340),
              curve: Curves.easeOutQuart,
              left: left,
              top: top,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  final progress = Curves.easeOutCubic.transform(
                    controller.value,
                  );
                  final direction = toIndex >= fromIndex ? 1.0 : -1.0;

                  return _BrightFrostSelection(
                    width: selW,
                    height: selH,
                    corner: corner,
                    blurSigma: selectedBlurSigma,
                    startOpacity: selectedStartOpacity,
                    endOpacity: selectedEndOpacity,
                    borderOpacity: selectedBorderOpacity,
                    frostOpacity: selectedFrostOpacity,
                    radialOpacity: selectedRadialOpacity,
                    radialRadiusFactor: selectedRadialRadiusFactor,
                    radialCenter: selectedRadialCenter,
                    transitionProgress: progress,
                    direction: direction,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(items.length, (i) {
                final selected = i == currentIndex;

                return InkWell(
                  onTap: () => onTap(i),
                  borderRadius: BorderRadius.circular(20),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: SizedBox(
                    width: itemW,
                    height: constraints.maxHeight,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(end: selected ? 1 : 0),
                      duration: const Duration(milliseconds: 320),
                      curve: Curves.easeOutCubic,
                      builder: (context, t, child) {
                        final iconColor = Color.lerp(
                          const Color(0xE6151B18),
                          accent,
                          t,
                        )!;
                        final labelColor = Color.lerp(
                          const Color(0xC4151B18),
                          accent,
                          t,
                        )!;

                        return Transform.scale(
                          scale: 0.975 + (t * 0.045),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                items[i].icon,
                                size: 20,
                                color: iconColor,
                                shadows: [
                                  Shadow(
                                    color: Colors.white.withValues(
                                      alpha: 0.10 + (0.14 * t),
                                    ),
                                    blurRadius: 9,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Flexible(
                                child: Text(
                                  items[i].label,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.1,
                                    color: labelColor,
                                    shadows: [
                                      Shadow(
                                        color: Colors.white.withValues(
                                          alpha: 0.08 + (0.10 * t),
                                        ),
                                        blurRadius: 7,
                                        offset: const Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}

class _FrostedPill extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final EdgeInsets padding;
  final Widget child;
  final Color tint;
  final double blurSigma;
  final double filmStart;
  final double filmEnd;
  final double rimOpacity;
  final bool showSpecularDot;
  final double frostOpacity;

  const _FrostedPill({
    super.key,
    required this.width,
    required this.height,
    required this.radius,
    required this.padding,
    required this.child,
    required this.tint,
    required this.blurSigma,
    required this.filmStart,
    required this.filmEnd,
    required this.rimOpacity,
    this.showSpecularDot = true,
    this.frostOpacity = 0.06,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height + 8,
      child: Stack(
        children: [
          Positioned.fill(
            top: 10,
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.18),
                    blurRadius: 24,
                    offset: const Offset(0, 12),
                    spreadRadius: -6,
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
              child: Container(
                margin: const EdgeInsets.only(bottom: 4),
                padding: padding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      tint.withValues(alpha: filmStart),
                      tint.withValues(alpha: filmEnd),
                    ],
                  ),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: rimOpacity),
                    width: 0.7,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: frostOpacity),
                          borderRadius: BorderRadius.circular(radius),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: const [0.0, 0.12, 0.88, 1.0],
                            colors: [
                              Colors.white.withValues(alpha: 0.22),
                              Colors.transparent,
                              Colors.transparent,
                              Colors.white.withValues(alpha: 0.12),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: const [0.0, 0.15, 0.78, 1.0],
                            colors: [
                              Colors.white.withValues(alpha: 0.14),
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.025),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Positioned.fill(
                      child: IgnorePointer(
                        child: CustomPaint(
                          painter: _GrainPainter(opacity: 0.025, count: 700),
                        ),
                      ),
                    ),
                    if (showSpecularDot)
                      Positioned(
                        top: 6,
                        left: 8,
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withValues(alpha: 0.95),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withValues(alpha: 0.45),
                                blurRadius: 10,
                                spreadRadius: 1.2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    child,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BrightFrostSelection extends StatelessWidget {
  final double width;
  final double height;
  final double corner;
  final double blurSigma;
  final double startOpacity;
  final double endOpacity;
  final double borderOpacity;
  final double frostOpacity;
  final double radialOpacity;
  final double radialRadiusFactor;
  final Alignment radialCenter;
  final double transitionProgress;
  final double direction;

  const _BrightFrostSelection({
    required this.width,
    required this.height,
    required this.corner,
    this.blurSigma = 46,
    this.startOpacity = 0.30,
    this.endOpacity = 0.16,
    this.borderOpacity = 0.90,
    this.frostOpacity = 0.10,
    this.radialOpacity = 0.14,
    this.radialRadiusFactor = 0.90,
    this.radialCenter = const Alignment(-0.10, -0.10),
    this.transitionProgress = 0,
    this.direction = 1,
  });

  @override
  Widget build(BuildContext context) {
    final r = math.min(width, height) * 0.5 * radialRadiusFactor;
    final sweepPulse = math.sin(transitionProgress * math.pi).clamp(0.0, 1.0);
    final borderAlpha = (borderOpacity + (0.04 * sweepPulse)).clamp(0.0, 1.0);
    final coreOpacity = (radialOpacity + (0.08 * sweepPulse)).clamp(0.0, 1.0);

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(corner),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 7,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(corner),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(corner),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withValues(
                        alpha: startOpacity + (0.05 * sweepPulse),
                      ),
                      Colors.white.withValues(
                        alpha: endOpacity + (0.03 * sweepPulse),
                      ),
                    ],
                  ),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: borderAlpha * 0.85),
                    width: 0.65,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: frostOpacity),
                          borderRadius: BorderRadius.circular(corner),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(corner),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: const [0.0, 0.2, 0.5, 1.0],
                            colors: [
                              Colors.white.withValues(alpha: 0.18),
                              Colors.white.withValues(alpha: 0.08),
                              Colors.transparent,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: IgnorePointer(
                        child: CustomPaint(
                          painter: _MovingSweepPainter(
                            progress: transitionProgress,
                            pulse: sweepPulse,
                            corner: corner,
                            direction: direction,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: CustomPaint(
                        painter: _RadialHighlightPainter(
                          centerAlignment: radialCenter,
                          radius: r,
                          opacity: coreOpacity,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(corner),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.10),
                              Color.fromRGBO(255, 255, 255, 0.03),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Positioned.fill(
                      child: IgnorePointer(
                        child: CustomPaint(
                          painter: _GrainPainter(opacity: 0.022, count: 450),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RadialHighlightPainter extends CustomPainter {
  final Alignment centerAlignment;
  final double radius;
  final double opacity;

  const _RadialHighlightPainter({
    required this.centerAlignment,
    required this.radius,
    required this.opacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      ((centerAlignment.x + 1) / 2) * size.width,
      ((centerAlignment.y + 1) / 2) * size.height,
    );

    final paint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.white.withValues(alpha: opacity),
          Colors.transparent,
        ],
        stops: const [0, 0.6],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant _RadialHighlightPainter oldDelegate) {
    return oldDelegate.centerAlignment != centerAlignment ||
        oldDelegate.radius != radius ||
        oldDelegate.opacity != opacity;
  }
}

class _MovingSweepPainter extends CustomPainter {
  final double progress;
  final double pulse;
  final double corner;
  final double direction;

  const _MovingSweepPainter({
    required this.progress,
    required this.pulse,
    required this.corner,
    required this.direction,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (pulse <= 0) {
      return;
    }

    final sweepWidth = size.width * 0.56;
    final fromX = direction > 0 ? -sweepWidth : size.width + sweepWidth;
    final toX = direction > 0 ? size.width + sweepWidth : -sweepWidth;
    final sweepX = lerpDouble(fromX, toX, progress) ?? (size.width * 0.5);

    final sweepRect = Rect.fromLTWH(
      sweepX - (sweepWidth / 2),
      -size.height * 0.45,
      sweepWidth,
      size.height * 1.90,
    );

    final shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.white.withValues(alpha: 0),
        Colors.white.withValues(alpha: 0.24 * pulse),
        Colors.white.withValues(alpha: 0.05 * pulse),
        Colors.white.withValues(alpha: 0),
      ],
      stops: const [0.0, 0.35, 0.62, 1.0],
      transform: GradientRotation(direction * -0.20),
    ).createShader(sweepRect);

    final paint = Paint()
      ..shader = shader
      ..blendMode = BlendMode.screen;

    canvas
      ..save()
      ..clipRRect(
        RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(corner)),
      )
      ..drawRect(sweepRect, paint)
      ..restore();
  }

  @override
  bool shouldRepaint(covariant _MovingSweepPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.pulse != pulse ||
        oldDelegate.corner != corner ||
        oldDelegate.direction != direction;
  }
}

class _GrainPainter extends CustomPainter {
  final double opacity;
  final int count;

  const _GrainPainter({this.opacity = 0.02, this.count = 600});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(7);
    final paint = Paint()..style = PaintingStyle.fill;

    for (var i = 0; i < count; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final alpha = opacity * (0.6 + (random.nextDouble() * 0.4));
      final isLight = random.nextBool();
      paint.color = (isLight ? Colors.white : Colors.black).withValues(
        alpha: alpha,
      );
      canvas.drawRect(Rect.fromLTWH(x, y, 1, 1), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GrainPainter oldDelegate) {
    return oldDelegate.opacity != opacity || oldDelegate.count != count;
  }
}

class _GlassCircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;
  final double blur;
  final double borderWidth;

  const _GlassCircleButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.size,
    required this.blur,
    required this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          children: [
            Positioned.fill(
              top: 10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.18),
                      blurRadius: 24,
                      offset: const Offset(0, 12),
                      spreadRadius: -6,
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(size),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withValues(alpha: 0.20),
                        Colors.white.withValues(alpha: 0.08),
                      ],
                    ),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.92),
                      width: borderWidth,
                    ),
                  ),
                  child: const Stack(
                    children: [
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.08),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: IgnorePointer(
                          child: CustomPaint(
                            painter: _GrainPainter(opacity: 0.025, count: 400),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(255, 255, 255, 0.18),
                                Color.fromRGBO(255, 255, 255, 0.05),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Icon(
                icon,
                size: 26,
                color: Colors.black.withValues(alpha: 0.90),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
