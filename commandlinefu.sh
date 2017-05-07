# Top Commands commandlinefu.com

# currently mounted filesystem in nice layout
mount | column -t

# Quick access to ascii table
man ascii

# Useful stop watch
time read # (ctrl-d to stop)

# Make 'less' behave like 'tail -f'
less +F somelogfile

# Close shell keeping all subprocess running
disown -a && exit

# Set alarm for when an IP address comes online
ping -i 60 -a IP_address
