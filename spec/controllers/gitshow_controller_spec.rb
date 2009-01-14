require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GitshowController do

  describe "GET 'get'" do

    it "should be successful" do
      get 'get'
      response.should do
        be_success
        render_template( 'get' )
      end
    end

    it "assigns all commits to @commits" do
      commits = Gitshow.instance.commits
      get 'get'
      assigns( :commits ).should eql( commits )
    end

    it "if no param[:id] is set, then it should assign the first commit to @current_commit" do
      commit = Gitshow.instance.commits.reverse.first
      get 'get'
      assigns( :current_commit ).should eql( commit )
    end
  
    it "given an id, should assign that commit to @current_commit" do
      commit = Gitshow.instance.commits[ Gitshow.instance.commits.length - 2 ]
      Gitshow.instance.should_receive( :commit ).with( commit.id ).and_return( commit )
      get 'get', :id => commit.id
      assigns( :current_commit ).should eql( commit )
    end
    
    it "should have assigned the changes in that commit to @diffs" do
      commit = Gitshow.instance.commits.first
      diffs = commit.diffs
      get 'get'
      assigns( :diffs ).should eql( diffs )
    end

  end
end

