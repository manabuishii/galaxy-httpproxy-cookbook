apacheservice="httpd"
apacheetcpath="httpd"
case node[:platform]
when "ubuntu"
  apacheservice="apache2"
  apacheetcpath="apache2"
end

template "/etc/#{apacheetcpath}/sites-available/galaxy.conf" do
  source node[:galaxy_http_proxy][:galaxy_conf]
  mode 0644
  owner "root"
  group "root"
end
apache_site 'galaxy' do
  enable true
  notifies :restart, resources(:service => apacheservice)

end
#service apacheservice do
#  supports :restart => true
#  action :enable
#  subscribes :restart, "template[/etc/httpd/conf-enabled/galaxy.conf]", :immediately
#end

#file '/etc/httpd/mods-enabled/proxy.conf' do
#  _file = Chef::Util::FileEdit.new(path)
#  _file.search_file_replace_line('Allow from none', "Allow from all\n  ")
#  content _file.send(:editor).lines.join
#end
