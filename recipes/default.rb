template "/etc/httpd/conf-enabled/galaxy.conf" do
  source "galaxy.conf.erb"
  mode 0644
  owner "root"
  group "root"
end

#file '/etc/httpd/mods-enabled/proxy.conf' do
#  _file = Chef::Util::FileEdit.new(path)
#  _file.search_file_replace_line('Allow from none', "Allow from all\n  ")
#  content _file.send(:editor).lines.join
#end

service "httpd" do
  supports :restart => true
  action :enable
  subscribes :restart, "template[/etc/httpd/conf-enabled/galaxy.conf]", :immediately
  subscribes :restart, "file[/etc/httpd/mods-enabled/proxy.conf]", :immediately
end
