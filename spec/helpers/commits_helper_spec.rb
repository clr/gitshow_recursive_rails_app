require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CommitsHelper do
  
  def example_diff
<<-EOD
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

  def desired_example_diff_html
<<-EOD
<div class="code">
<ul>
<li><div class="line"><pre>Lines of text follow</pre></div></li>
<li><div class="line"><pre></pre></div></li>
<li><div class="line"><pre>This is line 1.</pre></div></li>
<li><div class="line old"><pre>This is line B.</pre></div></li>
<li><div class="line old"><pre>This is line C.</pre></div></li>
<li><div class="line new"><pre>This is line 2.</pre></div></li>
<li><div class="line new"><pre>This is line 3.</pre></div></li>
<li><div class="line"><pre>This is line 4.</pre></div></li>
</ul>
</div>
EOD
  end

# Useless, but I like this test.
  it "should be included in the object returned by #helper" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(CommitsHelper)
  end
  
  it "should take a diff and make a formatted code snippet" do
    diff_to_html( example_diff ).should eql( desired_example_diff_html )
  end

end
