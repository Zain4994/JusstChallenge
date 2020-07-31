import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {

  final Widget Function(BuildContext context, T model, Widget child) widgetBuilder;
  final T model;
  final Widget child;
  final Function(T, BuildContext) onModelReady;
  final Function(T) onModelDestroy;

  BaseWidget(
      {@required this.model,
      @required this.widgetBuilder,
      this.child,
      this.onModelReady,
      this.onModelDestroy})
      : super();

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  // We want to store the instance of the model in the state
  // that way it stays constant through rebuilds
  T model;

  _BaseWidgetState();

  onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }


  @override
  void initState() {
    // assign the model once when state is initialised
    model = widget.model;
    if (widget.onModelReady != null) {
      onWidgetDidBuild(() {
        widget.onModelReady(model, context);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.widgetBuilder,
        child: widget.child ?? Container(),
      ),
    );
  }

  @override
  void dispose() {
    if (widget.onModelDestroy != null) {
      widget.onModelDestroy(model);
    }
    super.dispose();
  }
}
