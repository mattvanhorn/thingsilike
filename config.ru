require 'bundler' 
Bundler.setup

require 'toto'

# Rack config
use Rack::Static, :urls => ['/resume', '/css', '/js', '/images', '/favicon.ico'], :root => 'public'
use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

#
# Create and configure a toto instance
#
toto = Toto::Server.new do
  #
  # Add your settings here
  # set [:setting], [value]
  # 
  set :author,    "Matt Van Horn"                                     # blog author
  set :title,     "Things I Like"                                     # site title
  set :date, lambda {|now| now.strftime("%B #{now.day.ordinal} %Y") } # date format for articles
  
  # set :root,      "index"                                   # page to load on /
  # set :markdown,  :smart                                    # use markdown + smart-mode
  # set :disqus,    false                                     # disqus id, or false
  # set :summary,   :max => 150, :delim => /~/                # length of article summary and delimiter
  # set :ext,       'txt'                                     # file extension for articles
  # set :cache,      28800                                    # cache duration, in seconds

end

run toto


