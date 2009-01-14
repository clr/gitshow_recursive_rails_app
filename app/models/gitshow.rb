class Gitshow
  include Singleton
  
  def location
    RAILS_ROOT
  end
  
  def commits
    @commits ||= Grit::Repo.new( self.location ).commits( 'master', 9999 )
  end
  
  def method_missing( *args )
    Grit::Repo.new( self.location ).send( *args )
  end
  
end

