import os
import re

input_file = r"C:\Users\varma\OneDrive\Desktop\Projects\test (1).txt"
output_dir = r"C:\Users\varma\OneDrive\Desktop\Projects\gravityhabbit"

def extract_files():
    with open(input_file, 'r', encoding='utf-8', errors='ignore') as f:
        lines = f.readlines()
        
    current_file = None
    in_code_block = False
    code_content = []
    
    # Regex to match file paths in markdown headers like ### `lib/main.dart`
    # Also matches ## `lib/main.dart` or **`lib/main.dart`** or just `lib/main.dart`
    path_regex = re.compile(r'#*\s*\*?`?([\w\.\-/]+\.(?:dart|yaml|arb|json))`?\*?')
    
    extracted_count = 0
    
    for i, line in enumerate(lines):
        if not in_code_block:
            # Check if this line looks like a file header
            match = path_regex.search(line)
            if match and ('/' in match.group(1) or 'yaml' in match.group(1)):
                current_file = match.group(1)
                # print(f"Found file header: {current_file} on line {i+1}")
                
            # Check for start of code block
            if current_file and line.strip().startswith('```') and not line.strip() == '```':
                in_code_block = True
                code_content = []
        else:
            # We are inside a code block
            if line.strip() == '```':
                # End of code block
                in_code_block = False
                if current_file:
                    # Write the file
                    full_path = os.path.join(output_dir, current_file)
                    os.makedirs(os.path.dirname(full_path), exist_ok=True)
                    with open(full_path, 'w', encoding='utf-8') as out_f:
                        out_f.writelines(code_content)
                    print(f"Extracted: {current_file} ({len(code_content)} lines)")
                    extracted_count += 1
                current_file = None
                code_content = []
            else:
                code_content.append(line)
                
    print(f"Total files extracted: {extracted_count}")

if __name__ == "__main__":
    extract_files()
