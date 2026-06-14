import os
import re

schema_dir = 'lib/data/isar/schemas'

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Remove Isar import
    content = content.replace("import 'package:isar/isar.dart';", "import 'package:json_annotation/json_annotation.dart';")
    
    # Replace @collection
    content = content.replace("@collection", "@JsonSerializable()")

    # Remove @Index(...)
    content = re.sub(r'@Index\([^)]*\)\s*', '', content)
    content = re.sub(r'@Index\(\)\s*', '', content)

    # Remove @Enumerated(...)
    content = re.sub(r'@Enumerated\([^)]*\)\s*', '', content)

    # Replace Id id = Isar.autoIncrement; with int? id;
    content = content.replace("Id id = Isar.autoIncrement;", "int? id;")
    
    # Replace Id id = 0; with int id = 0;
    content = content.replace("Id id = 0;", "int id = 0;")

    # Find class name
    match = re.search(r'class (\w+)', content)
    if match:
        class_name = match.group(1)
        
        # We need to add the default constructor if it doesn't exist, and fromJson/toJson
        # Find the end of the class
        last_brace = content.rfind('}')
        
        injection = f"\n  {class_name}();\n\n  factory {class_name}.fromJson(Map<String, dynamic> json) => _${class_name}FromJson(json);\n  Map<String, dynamic> toJson() => _${class_name}ToJson(this);\n"
        
        content = content[:last_brace] + injection + content[last_brace:]
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"Processed {filepath}")

for f in os.listdir(schema_dir):
    if f.endswith('_schema.dart'):
        process_file(os.path.join(schema_dir, f))
