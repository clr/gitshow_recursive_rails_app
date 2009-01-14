ActionController::Routing::Routes.draw do |map|
  map.gitshow 'gitshow/:id', :controller => 'commits', :action => 'get'
  map.root :controller => 'commits', :action => 'get'
end
