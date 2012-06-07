module ProtocolsHelper
  def markdown(content)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML,
            :autolink => true, :space_after_headers => true).render(content) unless content.nil?
  end
  
end
