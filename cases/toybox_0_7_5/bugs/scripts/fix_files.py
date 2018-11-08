# This program is meant to fix the problem of toybox preprocessed files having duplicated code
# This is a momentary bug fix until we find the actual problem that's causing the files to be
#  messed up in the first place.

import os

prelist = list()

for root, dirs, files in os.walk('.'):
    for file in files:
        if file.endswith('.i'):
            prelist.append(os.path.join(root,file))

print('Found %d preprocessed files.' % len(prelist))
print('Fixing now.')

for pre in prelist:
    with open(pre) as f:
        content = list(f.read())
    # If there's a beginning period, remove it
    if content[0] == '.':
        del(content[0])

    # See if the string is duplicated
    content = "".join(content)

    first, second = content[:len(content)//2], content[len(content)//2:]
    with open(pre, 'w') as f:
        if first == second:
            print("%s is a duplicated file, fixing it now." % pre)
            f.write(first)
        else:
            print("%s is not duplicated, not changing it." % pre)
            f.write(content)
    
            
