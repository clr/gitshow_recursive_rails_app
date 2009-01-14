require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Gitshow do

  it "should point here" do
    Gitshow.instance.location.should == RAILS_ROOT
  end

  it "should contain commits by now" do
    Gitshow.instance.commits.should_not be_empty
  end

  it "should pass methods on to Grit object through method_missing" do
    commit = Gitshow.instance.commits.first
    Gitshow.instance.commit( commit.id ).should eql( commit )
  end

end
