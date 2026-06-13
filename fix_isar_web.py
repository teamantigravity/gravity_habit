import os
import re

schema_dir = 'lib/data/isar/schemas'
if not os.path.exists(schema_dir):
    print(f"Directory {schema_dir} not found")
    exit(0)

# Replace any ID > 2^53 with a modulo. Max safe integer is 9007199254740991
MAX_SAFE_INTEGER = 9007199254740991

def replace_id(match):
    full_str = match.group(0)
    id_str = match.group(1)
    try:
        val = int(id_str)
        if val > MAX_SAFE_INTEGER or val < -MAX_SAFE_INTEGER:
            # Modulo to fit within safe integer
            new_val = val % MAX_SAFE_INTEGER
            # If it was negative, keep it negative (modulo in Python retains sign of divisor, so we use abs and math.copysign if needed, but simple is just taking abs and applying sign)
            if val < 0:
                new_val = - (abs(val) % MAX_SAFE_INTEGER)
            return full_str.replace(id_str, str(new_val))
    except ValueError:
        pass
    return full_str

for root, _, files in os.walk(schema_dir):
    for file in files:
        if file.endswith('.g.dart'):
            filepath = os.path.join(root, file)
            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()
            
            # Find patterns like "id: 655844772568347876,"
            new_content = re.sub(r'id:\s*(-?\d+),', replace_id, content)
            
            if new_content != content:
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(new_content)
                print(f"Updated {file}")

print("Done fixing Isar web IDs.")
