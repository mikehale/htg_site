#!/usr/bin/env ruby

# Description: this script finds logs under /var/log/archive and creates 
# a symbolic link to the latest log under /var/log preserving subdirectores.

utc = Time.now.utc
year = utc.year
month = utc.strftime('%m')
day = utc.strftime('%d')

# Find current log files
current_log_files = Dir["/var/log/archive/**/#{year}/#{month}/*#{day}*"]
current_log_files.each {|source|
  target = source.gsub(/archive\//,'').
                  gsub(/#{year}\/#{month}\//,'').
                  gsub(/\/#{year}-#{month}-#{day}/,'')
                  
  command = "ln -nfs #{source} #{target}"
  puts command
  `#{command}`
}