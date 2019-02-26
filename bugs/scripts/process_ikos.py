import os
import subprocess

for root, dirs, files in os.walk('.'):
    files = list(map(lambda x: os.path.join(root, x), filter(lambda x: x.endswith('.db'), files)))

    for f in files:
        cmd = "ikos-report --format=csv {}".format(f)
        with open("{}.csv".format(f), 'w') as outfile:
            print(f"Processing {f}")
            subprocess.run(cmd, stdout=outfile, shell=True)
