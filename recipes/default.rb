#
# Cookbook Name:: todotxt
# Recipe:: default
#
# Copyright 2013, Ares
#
# All rights reserved
#

VERSION = '2.9'

cookbook_file "/usr/local/src/todo.txt_cli-#{VERSION}.tar.gz" do
  source "todo.txt_cli-#{VERSION}.tar.gz"
  mode "0644"
end

script "install todo.txt cli" do
  user node[:user]
  group "staff"
  cwd "/usr/local/src"
  code <<-EOS
  tar xvvf todo.txt_cli-#{VERSION}.tar.gz
  chmod ugo+x todo.txt_cli-#{VERSION}/todo.sh
  EOS
  creates "/usr/local/src/todo.txt_cli-#{VERSION}"
  interpreter "/bin/bash"
end

link "/home/#{node[:user]}/.bin/todo.sh" do
  to "/usr/local/src/todo.txt_cli-#{VERSION}/todo.sh"
end

directory "/home/#{node[:user]}/.todo" do
  mode "0755"
  user node[:user]
  group node[:user]
end

template "/home/#{node[:user]}/.todo/config" do
  source "config.erb"
  user node[:user]
  group node[:user]
  mode "0644"
end

remote_directory "/home/#{node[:user]}/.todo.actions.d" do
  user node[:user]
  group node[:user]
  mode "0755"
  source "plugins"
  files_mode "0755"
  files_owner node[:user]
  files_group node[:user]
end

zsh_plugin('todotxt')
