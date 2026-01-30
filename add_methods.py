import sys

# Read the MainActivity.java file
with open(r'e:\proj01Mapbox\app\src\main\java\com\example\proj01mapbox\MainActivity.java', 'r', encoding='utf-8') as f:
    content = f.read()

# Read the methods to add
with open(r'e:\proj01Mapbox\transport_methods_temp.txt', 'r', encoding='utf-8') as f:
    methods = f.read()

# Find the last closing brace and insert before it
last_brace_pos = content.rfind('}')
if last_brace_pos != -1:
    new_content = content[:last_brace_pos] + methods
    
    # Write back
    with open(r'e:\proj01Mapbox\app\src\main\java\com\example\proj01mapbox\MainActivity.java', 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print("Methods added successfully!")
else:
    print("Error: Could not find closing brace")
    sys.exit(1)
