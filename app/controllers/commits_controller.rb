class CommitsController < ApplicationController

  def get
    @commits = Repo.instance.commits
    if ( params[:id] && !params[:id].empty? )
      @current_commit = Repo.instance.commit( params[:id] )
    else
      @current_commit = Repo.instance.commits.first
    end
    @diffs = @current_commit.diffs
    @line = <<-EOD
--- a/app/models/repo.rb
+++ b/app/models/repo.rb
@@ -4,6 +4,6 @@
Lines of text follow

This is line 1.
-This is line B.
-This is line C.
+This is line 2.
+This is line 3.
This is line 4.
EOD
  end

end
