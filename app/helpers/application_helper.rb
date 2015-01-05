require 'github/markup'

module ApplicationHelper
  def parse_markdown(str)
    GitHub::Markup.render('.md', str)
  end
end
