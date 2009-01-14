class Gitshow
  include Singleton
  
  def location
    RAILS_ROOT
  end
  
  def method_missing( *args )
    Grit::Repo.new( self.location ).send( *args )
  end
  
end

