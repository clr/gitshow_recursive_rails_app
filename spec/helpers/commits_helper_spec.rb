require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CommitsHelper do
  
  # Useless, but I like this test.
  it "should be included in the object returned by #helper" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(CommitsHelper)
  end

end
