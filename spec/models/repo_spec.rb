require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Repo do

  it "should point here" do
    Repo.instance.location.should == RAILS_ROOT
  end

  it "should contain commits by now" do
    Repo.instance.commits.should_not be_empty
  end

  it "should pass methods on to Grit object through method_missing" do
    commit = Repo.instance.commits.first
    Repo.instance.commit( commit.id ).should eql( commit )
  end

end
