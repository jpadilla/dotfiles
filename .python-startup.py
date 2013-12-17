import os
import readline
import rlcompleter
import atexit

history_file = os.path.join(os.environ['HOME'], '.python_history')

try:
    readline.read_history_file(history_file)
except IOError:
    pass

# Turn on Autocomplete
readline.parse_and_bind("tab: complete")

# Limit the number of entries saved
readline.set_history_length(1000)

# Create history file on exit if it doesn't already exist
atexit.register(readline.write_history_file, history_file)

# Remove all variables
del os, readline, rlcompleter, atexit, history_file
