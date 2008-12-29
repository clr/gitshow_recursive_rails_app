require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/commits/get" do
  before(:each) do
    render 'commits/get'
  end
  
  it "should tell you where to find the file" do
    response.should have_tag( 'div.sidebar li' )
    response.should have_tag( 'div.file div.code li' )
  end
end
