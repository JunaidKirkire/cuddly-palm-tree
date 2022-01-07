1.  Setup --
    a.  First, we need to install Ruby.  Instructions can be found at - https://www.ruby-lang.org/en/documentation/installation/

    b.  To confirm installation, type "ruby -v".  You should get the following output -
        -- "ruby 3.0.3p157 (2021-11-24 revision 3fb7d2cadc) [x86_64-darwin20]"
    
    c.  The version displayed above is the one used for writing this solution.

    d.  Install the bundler gem using the command -
        gem install bundler -v 2.2.33

    e.  In case this fails, use the following command -
        gem install bundler -v 2.2.33 --user-install

    f.  You would have to update the path -
        echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.bash_profile
        source ~/.bash_profile

2.  Install RSpec --
    a.  gem install rspec -v 3.10.0
        The following gems would be installed - 'rspec-core', 'rspec-expectations', 'rspec-mocks', 'rspec-support', 'diff-lcs'

3.  Run the tests --
    To run the functional suite, run `bundle exec rspec spec` from the `certsy` folder.

4.  To run the application --
    a.  run `ruby lib/start_app.rb lib/commands.txt`.
