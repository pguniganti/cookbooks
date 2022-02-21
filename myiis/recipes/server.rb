#
# Cookbook:: myiis
# Recipe:: server
#
# Copyright:: 2022, The Authors, All Rights Reserved.
powershell_script 'install  IIS' do
  code 'Add-windowsFeature Web-server'
  action :run
end

file 'WebServer Default Page' do
  path 'c:\inetpub\wwwroot\default.htm'
  content <<ENDIISPAGE
  <h1> Hello,World!</h1>
  <h2> Platform: #{node['Platform']}</h2>
  <h2>Hostname:  #{node['hostname']}</h2>
  <h2>Memory:    #{node['memory']['total']}</h2>
  <h2>CPU:       #{node['cpu']['0']['mhz']}</h2>
ENDIISPAGE
  action   :Create
end

service 'w3srv' do
  action [:start, :enable]
end
