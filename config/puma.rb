environment 'production'

# Daemonize the server into the background. Highly suggest that
# this be combined with “pidfile” and “stdout_redirect”.
#
# The default is “false”.
#
# daemonize
daemonize true

# Use “path” as the file to store the server info state. This is
# used by “pumactl” to query and control the server.
#
state_path 'tmp/pids/puma.state'

# Redirect STDOUT and STDERR to files specified. The 3rd parameter
# (“append”) specifies whether the output is appended, the default is
# “false”.
#
stdout_redirect 'log/puma.stdout', 'log/puma.stderr', true
#stdout_redirect 'log/stdout', '/u/apps/lolcat/log/stderr', true

# Disable request logging.
#
# The default is “false”.
#
quiet

# Configure “min” to be the minimum number of threads to use to answer
# requests and “max” the maximum.
#
# The default is “0, 16”.
#
threads 0, 16

# Bind the server to “url”. “tcp://”, “unix://” and “ssl://” are the only
# accepted protocols.
#
#The default is “tcp://0.0.0.0:9292”.
#
bind 'tcp://0.0.0.0:8080'
# bind 'unix:///var/run/puma.sock'
