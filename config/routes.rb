ActionController::Routing::Routes.draw do |map|
  map.gitshow 'gitshow/:id', :controller => 'gitshow', :action => 'get'
  map.root :controller => 'gitshow', :action => 'get'
end
