#!/usr/bin/python3
import hashlib, os, subprocess, time
timestamp = str(int(time.time()))
dedupe = hashlib.md5(os.getcwd().encode()).hexdigest()[0:8]
tagfile = '.git/tags'
tagfile_prefix = tagfile + '_' + dedupe
tagfile_temp = tagfile_prefix + '_' + timestamp

ps = subprocess.Popen(
  [
    'ps',
    '-ax',
    '-o',
    'pid,command'
  ],
  stdout=subprocess.PIPE
)

running = []
count = -1
while True:
  line = ps.stdout.readline()
  count += 1
  if count == 0: continue
  if not line: break
  pid, *command = line.decode().strip().split(' ')
  if tagfile_prefix in ' '.join(command): running.append([pid, command])

for [pid, command] in running:
  tmpfile = command[2]
  subprocess.run(["kill", pid])
  os.remove(tmpfile)

ctags = subprocess.run(['ctags', '-f', tagfile_temp, '.'], stderr=subprocess.DEVNULL)
if ctags.returncode == 0:
  subprocess.run(['mv', tagfile_temp, tagfile])

