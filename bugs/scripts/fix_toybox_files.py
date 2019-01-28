import os

for root, dirs, files in os.walk('.'):
    for f in files:
        if f.endswith('.i'):
            with open(os.path.join(root,f)) as infile:
                content = infile.read()
            # Remove leading period
            content = content[1:]
            # Remove second half
            content = content[:int(len(content)/2)]

            with open(os.path.join(root,f), 'w') as outfile:
                outfile.write(content)
