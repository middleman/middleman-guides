require "builder"
require "redcarpet"

helpers do
  def is_guide_page?
    request.path_info =~ /guides/
  end
  
  def edit_guide_url
    file_name = request.path_info.split("guides/").last
    "https://github.com/tdreyno/middleman-guides/blob/master/source/guides/#{file_name}.markdown"
  end
end

set :slim, :pretty => true

set :markdown, :layout_engine => :slim
set :markdown_engine, Middleman::CoreExtensions::FrontMatter::RedcarpetTemplate

activate :directory_indexes

require 'rack/codehighlighter'
use Rack::Codehighlighter, 
  :pygments_api,
  :element => "pre>code",
  :pattern => /\A:::([-_+\w]+)\s*\n/,
  :markdown => true

# Build-specific configuration
configure :build do
  compass_config do |config|
    config.line_comments = false
  end
  
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
  
  # Enable cache buster
  activate :cache_buster
end