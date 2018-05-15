module BlogsHelper
  def gravatar_helper user
      image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 50
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
end

  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

    option = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true,
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayified, option)
    markdown_to_html.render(text).html_safe
  end
end
