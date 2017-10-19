Installing Ruby

The source code for some of the servers used in the book's examples are written in the Ruby programming language. It's a good choice for this book because it runs on Windows, Linux, and OSX systems, and is relatively easy to set up. This short guide will help you get your machine working with the examples in this book.

Windows
=======

Windows users should grab the Ruby Installer for Windows and the Devkit from http://rubyinstaller.info. Follow the directions there to install the Devkit after installing the Ruby installer.

Once everything is installed, open a Command Prompt and type

   gem update --system
   gem install eventmachine
   gem install em-websocket
   gem install sinatra

Mac
===
If you're on a Mac running Leopard or Snow Leopard, you've already got most of what you need. However, you'll need the Xcode Tools package installed so you can install some additional libraries. XCode Tools is available via Apple's Development network (http://developer.apple.com/technologies/xcode.html). You'll need a free developer account to download the file. 


Once you've installed XCode Tools, open a Terminal window and type

    sudo gem update --system
    sudo gem install eventmachine
    sudo gem install em-websocket
    sudo gem install sinatra

Linux (Ubuntu)

Install Ruby via Apt

sudo apt-get install libopenssl-ruby libreadline-ruby1.8 build-essential \
ruby ruby1.8-dev irb rake rdoc libxml-ruby \
libiconv-ruby libxslt-ruby libxslt1-dev libxml2-dev

Next, install RubyGems to manage Ruby libraries:

  mkdir src
  cd src
  wget http://rubyforge.org/frs/download.php/60718/rubygems-1.3.5.tgz
  tar xzvf rubygems-1.3.5.tgz
  cd rubygems-1.3.5
  sudo ruby setup.rb
  sudo ln -s /usr/bin/gem1.8 /usr/bin/gem

Finally, install the libraries you'll need:

    sudo gem update --system
    sudo gem install eventmachine
    sudo gem install em-websocket
    sudo gem install sinatra
    
