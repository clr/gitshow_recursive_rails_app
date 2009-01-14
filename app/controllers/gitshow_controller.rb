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
    if ( @current_commit == @first_commit )
      @first_commit    = nil
    else
      @previous_commit = @commits[ @commits.index( @current_commit ) - 1 ]
    end
    if ( @current_commit == @last_commit )
      @last_commit     = nil
    else 
      @next_commit     = @commits[ @commits.index( @current_commit ) + 1 ]
    end
    @diffs           = @current_commit.diffs
  end

end
