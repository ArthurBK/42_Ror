#!/bin/bash
echo "gem: --no-document" > /home/vagrant/.gemrc
sudo apt-get -y update
sudo apt-get install -y git-all curl libreadline-dev zlib1g-dev vim gnupg build-essential postgresql libpq-dev nodejs
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby
source /home/vagrant/.rvm/scripts/rvm
gem install rails -v 4.2.7
gem install rails puma
sudo gem install bundler
sudo -u postgres psql -c "CREATE USER vagrant LOGIN CREATEDB;"
# sudo -u postgres psql -c "CREATE DATABASE foubarre_development;"
# sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/hosts
mkdir /home/vagrant/site
cd /home/vagrant/site
source /home/vagrant/.rvm/scripts/rvm
rails new foubarre -d postgresql
cd foubarre
bundle install
rails g scaffold component great_data
echo "Component.create(great_data: 'foo_bar_name')" >> db/seeds.rb
sed '/turbolink/d' /home/vagrant/site/foubarre/app/views/layouts/application.html.erb
sed -i -e "s/username: foubarre/username: vagrant/g" config/database.yml
perl -pi -e 's/config.assets.compile = false/config.assets.compile = true/g' /home/vagrant/site/foubarre/config/environments/production.rb
rm app/assets/javascripts/*.coffee
RAILS_ENV=production rake db:create
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake db:seed
sed -i "2iroot to: 'components#index'" config/routes.rb
echo "<h1><%=Rails.env%></h1>">app/views/components/index.html.erb
SECRET_KEY_BASE=$(RAILS_ENV=production rake secret) puma -e production -b 'tcp://0.0.0.0:3000' config.ru
