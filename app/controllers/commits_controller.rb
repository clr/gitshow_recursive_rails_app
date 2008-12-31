class CommitsController < ApplicationController

  def get
    @commits = Repo.instance.commits
    if ( params[:id] && !params[:id].empty? )
      @current_commit = Repo.instance.commit( params[:id] )
    else
      @current_commit = Repo.instance.commits.first
    end
    @blobs = @current_commit.tree.contents.select{ |node| node.is_a?( Grit::Blob ) }
  end

end
