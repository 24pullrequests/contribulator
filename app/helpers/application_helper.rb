module ApplicationHelper
  def parse_markdown(str)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @markdown.render(str)
  end
end
