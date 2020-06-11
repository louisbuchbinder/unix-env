#!/usr/bin/python3
import hashlib, os, subprocess, time
timestamp = str(int(time.time()))
dedupe = hashlib.md5(os.getcwd().encode()).hexdigest()[0:8]
tagfile = '.git/tags'
tagfile_prefix = tagfile + '_' + dedupe
tagfile_temp = tagfile_prefix + '_' + timestamp

subprocess.run(['ctags', '-f', tagfile_temp, '.'], stderr=subprocess.DEVNULL)
subprocess.run(['mv', tagfile_temp, tagfile])

