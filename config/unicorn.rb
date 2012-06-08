# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.
# >= num of cpus/cores
worker_processes 4

# Help ensure your application will always spawn in the symlinked
# "current" directory that Capistrano sets up.
working_directory "/home/deployer/applications/biopartsdb/current"

# listen on both a Unix domain socket and a TCP port,
# we use a shorter backlog for quicker failover when busy
listen "/tmp/biopartsdb.sock", :backlog => 64

# nuke workers after 30 seconds instead of 60 seconds (the default)
timeout 30

# feel free to point this anywhere accessible on the filesystem
shared_path = "/home/deployer/applications/biopartsdb/shared"
pid "#{shared_path}/pids/unicorn.pid"
