import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:metro_app/core/constants/drop_down_items.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.hint,
    required this.onChange,
  });

  final IconButton icon;
  final String label;
  final String hint;
  final void Function(String?)? onChange;

   
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 8),
              Expanded(
                child: DropdownSearch<String>(
                  popupProps: PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        hintText: "Search station...",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                    menuProps: MenuProps(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: (filter, loadProps) => items,
                  dropdownBuilder: (context, selectedItem) {
                    return Text(
                      selectedItem ?? hint,
                      style: TextStyle(
                        color: selectedItem != null
                            ? Colors.black
                            : Colors.grey,
                      ),
                    );
                  },
                  onChanged: onChange,
                  filterFn: (item, filter) {
                    return item.toLowerCase().contains(filter.toLowerCase());
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
