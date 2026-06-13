import os
import re

input_file = r"C:\Users\varma\OneDrive\Desktop\Projects\test (1).txt"
output_dir = r"C:\Users\varma\OneDrive\Desktop\Projects\gravityhabbit"

def extract_files():
    with open(input_file, 'r', encoding='utf-8', errors='ignore') as f:
        lines = f.readlines()
        
    in_code_block = False
    code_content = []
    
    path_regex = re.compile(r'([\w\.\-/]+\.(?:dart|yaml|arb|json))')
    
    extracted_count = 0
    current_file_guess_outside = None
    
    for i, line in enumerate(lines):
        if not in_code_block:
            match = path_regex.search(line)
            if match and not line.strip().startswith('//'):
                if '`' in line or '#' in line or '*' in line or line.strip().startswith(match.group(1)):
                    current_file_guess_outside = match.group(1)
            
            if line.strip().startswith('```') and not line.strip() == '```':
                in_code_block = True
                code_content = []
        else:
            if line.strip() == '```':
                in_code_block = False
                
                file_name = None
                if len(code_content) > 0 and code_content[0].strip().startswith('//'):
                    first_line = code_content[0]
                    second_line = code_content[1] if len(code_content) > 1 else ""
                    match1 = path_regex.search(first_line)
                    match2 = path_regex.search(second_line) if second_line.strip().startswith('//') else None
                    if match1:
                        file_name = match1.group(1)
                    elif match2:
                        file_name = match2.group(1)
                
                if not file_name:
                    file_name = current_file_guess_outside
                    
                if file_name and ('/' in file_name or file_name.endswith('.yaml')):
                    file_name = file_name.replace('`', '').replace('*', '').strip()
                    full_path = os.path.join(output_dir, file_name)
                    
                    # Heuristic: If it's a very short snippet and an existing larger file exists, it's a partial diff.
                    # EXCEPT if it says "COMPLETE CORRECTED FILE" anywhere in the block
                    is_complete = any("COMPLETE CORRECTED FILE" in cl for cl in code_content[:5])
                    is_partial = False
                    
                    if os.path.exists(full_path) and not is_complete:
                        with open(full_path, 'r', encoding='utf-8') as ex_f:
                            existing_lines = ex_f.readlines()
                        if len(code_content) < len(existing_lines) * 0.5:
                            is_partial = True
                    
                    if not is_partial:
                        os.makedirs(os.path.dirname(full_path), exist_ok=True)
                        with open(full_path, 'w', encoding='utf-8') as out_f:
                            out_f.writelines(code_content)
                        print(f"Extracted: {file_name} ({len(code_content)} lines)")
                        extracted_count += 1
                
                current_file_guess_outside = None
            else:
                code_content.append(line)
                
    print(f"Total files extracted/overwritten: {extracted_count}")

if __name__ == "__main__":
    extract_files()
