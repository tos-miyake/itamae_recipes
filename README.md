## 開発用mac

```
sudo chown -R $(whoami):admin /usr/local
sudo gem install bundler
bundle install
bundle exec itamae local -y nodes/mac.yml roles/mac.rb
```
