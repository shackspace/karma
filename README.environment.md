karma runtime environment
=======================

Install development headers of openssl and libreadline as well as curl

	sudo apt-get install libssl-dev libreadline-dev curl

Install [rvm](http://rvm.io/)

	curl -L get.rvm.io | bash -s stable

Source rvm into your sell environment.  Also add this to the .*rc script of your shell.

	source ~/.rvm/scripts/rvm

Check additional requirements by rvm and follow instructions

	rvm requirements

Install Ruby 1.9.3

	rvm install 1.9.3

Install openssl for Ruby

	rvm pkg install openssl

Create [per-project](https://rvm.io/rvm/best-practices/) 'karma' gemset

	rvm gemset create karma
	rvm gemset use karma

Install gems

	gem install bundler haml net-ldap rack rack-protection \
	rake redis rubygems-bundler rvm sinatra sinatra-respond_to tilt

You might have to edit the .rvmrc found in the root folder of the project, specifically the exact environment_id you're using
