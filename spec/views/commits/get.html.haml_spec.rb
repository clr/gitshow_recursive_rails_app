require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

# Not going to spec the view.  We just want to make sure it renders.
describe "/commits/get" do
  include CommitsHelper
  before(:each) do
    @current_commit = mock_model( Grit::Commit )
    @current_commit.stub!( :message ).and_return( 'blah...' )
    assigns[ :commits ] = []
    assigns[ :current_commit ] = @current_commit
    assigns[ :diffs ] = []
  end
  
  it "should have the two main panels on every page" do
    render 'commits/get'
#    response.should have_tag( 'div.sidebar li' )
#    response.should have_tag( 'div.file div.code li' )
  end
end

