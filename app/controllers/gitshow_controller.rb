class GitshowController < ApplicationController

  def get
    @commits = Gitshow.instance.commits.reverse
    @first_commit = @commits.first
    @last_commit = @commits.last
    if ( params[:id] && !params[:id].empty? )
      @current_commit = Gitshow.instance.commit( params[:id] )
    else
      @current_commit = @first_commit
    end
    @previous_commit = @commits[ @commits.index( @current_commit ) - 1 ]
    @next_commit     = @commits[ @commits.index( @current_commit ) + 1 ]
    @diffs           = @current_commit.diffs
#raise @first_commit.inspect
  end

end