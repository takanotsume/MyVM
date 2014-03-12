
#----
# Set up preseeding mysql data
#---

directory '/var/cache/local/preseeding' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
end

template '/var/cache/local/preseeding/mysql-server.seed' do
  source 'mysql-server.seed.erb'
  variables({
    :root_password => ''
  })
  group 'root'
  mode '0600'
  notifies :run, 'execute[preseed mysql-server]', :immediately
end

execute 'preseed mysql-server' do
  command '/usr/bin/debconf-set-selections /var/cache/local/preseeding/mysql-server.seed'
  action :nothing
end

#----
# Install MariaDB
#---

execute "Add mariadb apt repository" do
  command "apt-get install -y software-properties-common debconf-utils"
  command "apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db"
  command "add-apt-repository 'deb http://mariadb.mirror.nucleus.be//repo/10.0/ubuntu trusty main'"
end

execute "Install mariadb 10.0" do
  command "apt-get update"
end

execute "Install mariadb 10.0" do
  command "apt-get install -y mariadb-server-10.0"
end