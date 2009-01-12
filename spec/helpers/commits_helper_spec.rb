require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CommitsHelper do
  include CommitsHelper
  
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

# Useless, but I like this test.
  it "should be included in the object returned by #helper" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(CommitsHelper)
  end
  
  it "should take a diff and make a formatted code snippet" do
    diff_to_html( example_diff ).should have_tag( 'table' ) do
      with_tag( 'tr' ) do
        with_tag( 'td', '4' )
        with_tag( 'td', '4' )
        with_tag( 'td' ) do
          with_tag( 'pre', 'Lines of text follow' )
        end
      end
      with_tag( 'tr' ) do
        with_tag( 'td', '5' )
        with_tag( 'td', '5' )
        with_tag( 'td' ) do
          with_tag( 'pre', '' )
        end
      end
      with_tag( 'tr' ) do
        with_tag( 'td', '6' )
        with_tag( 'td', '6' )
        with_tag( 'td' ) do
          with_tag( 'pre', 'This is line 1.' )
        end
      end
      with_tag( 'tr' ) do
        with_tag( 'td', '7' )
        with_tag( 'td', '&nbsp;' )
        with_tag( 'td' ) do
          with_tag( 'pre', 'This is line B.' )
        end
      end
      with_tag( 'tr' ) do
        with_tag( 'td', '8' )
        with_tag( 'td', '&nbsp;' )
        with_tag( 'td' ) do
          with_tag( 'pre', 'This is line C.' )
        end
      end
      with_tag( 'tr' ) do
        with_tag( 'td', '&nbsp;' )
        with_tag( 'td', '7' )
        with_tag( 'td' ) do
          with_tag( 'pre', 'This is line 2.' )
        end
      end
      with_tag( 'tr' ) do
        with_tag( 'td', '&nbsp;' )
        with_tag( 'td', '8' )
        with_tag( 'td' ) do
          with_tag( 'pre', 'This is line 3.' )
        end
      end
      with_tag( 'tr' ) do
        with_tag( 'td', '9' )
        with_tag( 'td', '9' )
        with_tag( 'td' ) do
          with_tag( 'pre', 'This is line 4.' )
        end
      end
    end
  end

end
