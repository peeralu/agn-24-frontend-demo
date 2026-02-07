import 'dart:io';

import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AdminFormUploadField extends StatefulWidget {
  final String name;
  final String label;
  final bool required;
  final File? initialValue;
  final FileType? fileType;
  final void Function(File? file)? onFilePicked;

  const AdminFormUploadField({
    super.key,
    required this.name,
    required this.label,
    this.required = false,
    this.initialValue,
    this.onFilePicked,
    this.fileType,
  });

  @override
  State<AdminFormUploadField> createState() => _AdminFormUploadFieldState();
}

class _AdminFormUploadFieldState extends State<AdminFormUploadField> {
  File? _selectedFile;
  String? _name;

  Future<void> _pickFile(FormFieldState<File?> field) async {
    final result = await FilePicker.platform.pickFiles(type: widget.fileType ?? FileType.image, allowMultiple: false);

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      setState(() {
        _selectedFile = file;
        _name = result.files.single.name;
      });
      field.didChange(file);
      widget.onFilePicked?.call(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<File?>(
      name: widget.name,
      initialValue: widget.initialValue,
      validator: widget.required ? (file) => file == null ? "กรุณาเลือกไฟล์" : null : null,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (_selectedFile == null)
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                      constraints: BoxConstraints(minWidth: 300),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton.icon(
                        onPressed: () => _pickFile(field),
                        icon: const Icon(Icons.upload_file_outlined),
                        label: const Text("เลือกไฟล์", style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ),
                if (_selectedFile != null)
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.insert_drive_file_outlined),
                          const SizedBox(width: 8),
                          Expanded(child: Text(_name ?? '', overflow: TextOverflow.ellipsis)),
                          IconButton(
                            onPressed: () {
                              setState(() => _selectedFile = null);
                              field.didChange(null);
                            },
                            icon: const Icon(Icons.close, color: Colors.redAccent),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            if (_selectedFile != null && (widget.fileType == FileType.image || widget.fileType == null))
              Row(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    margin: const EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(_selectedFile!.path, fit: BoxFit.cover),
                  ),
                ],
              ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(field.errorText!, style: const TextStyle(color: Colors.red, fontSize: 12)),
              ),
          ],
        );
      },
    );
  }
}
