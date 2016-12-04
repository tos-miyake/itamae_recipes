execute "install ruby #{node.ruby.version}" do
  command "rbenv install #{node.ruby.version};rbenv global #{node.ruby.version}"
  not_if "rbenv versions | grep '\* #{node.ruby.version}'"
end

execute "set PATH" do
  command <<COMMAND
echo 'export PATH="$HOME/.rbenv/shims:$PATH"' >> ~/.bash_profile;
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi'>>~/.bash_profile;
source ~/.bash_profile
COMMAND
  not_if "ruby -v | grep #{node.ruby.version}"
end
