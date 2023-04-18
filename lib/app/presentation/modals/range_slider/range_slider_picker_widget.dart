part of 'range_slider_dialog_widget.dart';

typedef OnApplyButtonClick<T> = Function(RangeValues? selectedValues);

class RangeSliderPicker extends StatefulWidget {
  final OnApplyButtonClick? onApplyButtonClick;
  final RangeValues? selectedRangeValues;
  final int minValue;
  final int maxValue;
  final int divisions;
  final bool? hideHeader;
  final String? headerText;
  final String? cancelButtonText;
  final String? acceptButtonText;

  const RangeSliderPicker({
    Key? key,
    this.selectedRangeValues,
    this.onApplyButtonClick,
    this.divisions = 1,
    this.maxValue = 40,
    this.minValue = 0,
    this.hideHeader = false,
    this.headerText = 'Select a range',
    this.cancelButtonText = 'CANCEL',
    this.acceptButtonText = 'ACCEPT',
  }) : super(key: key);

  @override
  State<RangeSliderPicker> createState() => _RangeSliderPickerState();
}

class _RangeSliderPickerState extends State<RangeSliderPicker> {
  late RangeValues _selectedRangeValues;
  late RangeValues _originalSelectedRangeValues;

  @override
  void initState() {
    super.initState();
    _selectedRangeValues =
        widget.selectedRangeValues ?? RangeValues(widget.minValue.toDouble(), widget.maxValue.toDouble());
    _originalSelectedRangeValues = _selectedRangeValues;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: _body(),
    );
  }

  Widget _body() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _header(),
        RangeSlider(
          min: widget.minValue.toDouble(),
          max: widget.maxValue.toDouble(),
          values: _selectedRangeValues,
          divisions: widget.maxValue,
          labels: RangeLabels(
            _selectedRangeValues.start.round().toString(),
            _selectedRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _selectedRangeValues = values;
            });
          },
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _valueBox(_selectedRangeValues.start.round().toInt().toString()),
              _valueBox(_selectedRangeValues.end.round().toInt().toString()),
            ],
          ),
        ),
        _dialogActions(),
      ],
    );
  }

  Widget _valueBox(String value) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black54)),
      child: Text(value),
    );
  }

  Widget _header() {
    if (widget.hideHeader != null && widget.hideHeader == true) {
      return Container();
    }
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).cardColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Text(
          widget.headerText != null ? widget.headerText! : '',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 18,
              ),
        ),
      ),
    );
  }

  Widget _dialogActions() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 45,
        margin: const EdgeInsets.only(top: 20, right: 10, bottom: 10, left: 10),
        alignment: Alignment.center,
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              _actionButton(
                  label: widget.cancelButtonText != null ? widget.cancelButtonText! : '',
                  onPressed: () {
                    Navigator.pop(context, _originalSelectedRangeValues);
                  }),
              const SizedBox(width: 15),
              _actionButton(
                  label: widget.acceptButtonText != null ? widget.acceptButtonText! : '',
                  onPressed: () {
                    if (widget.onApplyButtonClick != null) {
                      widget.onApplyButtonClick!(_selectedRangeValues);
                    } else {
                      Navigator.pop(context, _selectedRangeValues);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionButton({required String label, VoidCallback? onPressed, TextStyle? textStyle}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: textStyle,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
