import os
import sys
import glob

files = glob.glob("*.out")
equivsets = []

while len(files) > 0:
  cur = files.pop()
  equivset = set()
  equivset.add(cur)
  old_files = files
  files = []
  while len(old_files) > 0:
    other = old_files.pop()
    retval1 = os.system("diff %s %s >/dev/null 2>&1" % (cur, other))
    retval2 = os.system("grep \"unknown mnemonic \`b.e\' -- \`b.e 1f\'\" %s >/dev/null && grep \"unknown mnemonic \`b.e\' -- \`b.e 1f\'\" %s >/dev/null" % (cur, other))
    retval3 = os.system("grep \"selected processor does not support \`smc #0\' in ARM mode\" %s >/dev/null && grep \"selected processor does not support \`smc #0\' in ARM mode\" %s >/dev/null" % (cur, other))
    retval4 = os.system("grep \"src/kern/arm/ipi-arm.cpp:47:39: error: base operand of\" %s >/dev/null && grep \"src/kern/arm/ipi-arm.cpp:47:39: error: base operand of\" %s >/dev/null" % (cur, other))
    retval5 = os.system("grep \"timer_tick-broadcast.cpp:59:14: error:\" %s >/dev/null && grep \"timer_tick-broadcast.cpp:59:14: error:\" %s >/dev/null" % (cur, other))
    retval6 = os.system("grep \"kernel_thread-arm-32.cpp:41:3: error:\" %s >/dev/null && grep \"kernel_thread-arm-32.cpp:41:3: error:\" %s >/dev/null" % (cur, other))
    same = retval1 == 0 or retval2 == 0 or retval3 == 0 or retval4 == 0 or retval5 == 0 or retval6 == 0
    if same:
      equivset.add(other)
    else:
      files.append(other)
  equivsets.append(equivset)

for equivset in equivsets:
  print next(iter(equivset))
# print len(equivsets)
