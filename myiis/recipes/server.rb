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
  content <h1> Hello,World!</h1>
  action   :Create
end

service 'w3srv' do
  action [:start, :enable]
end
