module MarkdownHelper

  def render_markdown(text)
    markdown_renderer.render(text).html_safe
  end

  def markdown_renderer
    @@markdown_renderer ||= Redcarpet::Markdown.new(html_renderer)
  end

  def html_renderer
    @@html_renderer ||= Redcarpet::Render::HTML.new(hard_wrap: true)
  end

end
