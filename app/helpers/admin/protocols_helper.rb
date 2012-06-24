module Admin::ProtocolsHelper
  def markdown(content)
    #options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    #Redcarpet.new(content, *options).html_safe
    #Redcarpet::Markdown.new(Redcarpet::Render::HTML,
    #        :autolink => true, :space_after_headers => true).render(content)
  end
end
