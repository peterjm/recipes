require 'test_helper'

class MarkdownHelperTest < ActionView::TestCase
  test "converts consecutive lines to linebreaks" do
    raw = <<-RAW.strip_heredoc
      eggs
      milk
      butter
    RAW
    html = <<-HTML.strip_heredoc
      <p>eggs<br>
      milk<br>
      butter</p>
    HTML
    assert_equal html, render_markdown(raw)
  end
end
