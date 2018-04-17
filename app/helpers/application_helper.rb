module ApplicationHelper
  require "redcarpet"
  require "coderay"
  require 'nokogiri'
  require 'open-uri'

  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      language = language.split(':')[0]

      case language.to_s
      when 'rb'
        lang = 'ruby'
      when 'py'
        lang = 'python'
      when 'yml'
        lang = 'yaml'
      when 'css'
        lang = 'css'
      when 'html'
        lang = 'html'
      when ''
        lang = 'md'
      else
        lang = language
      end

      CodeRay.scan(code, lang).div
    end
  end

  def markdown(text)
    html_render = HTMLwithCoderay.new(filter_html: true, hard_wrap: true)
    options = {
      autolink: true,
      space_after_headers: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      tables: true,
      hard_wrap: true,
      xhtml: true,
      lax_html_blocks: true,
      strikethrough: true
    }
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text).to_s.html_safe
  end

  def movie(youtube_code)
    iframe = content_tag(
      :iframe,
      '',
      width: 560,
      height: 315,
      src: "https://www.youtube.com/embed/#{youtube_code}?rel=0",
      frameborder: 0,
      allowfullscreen: true
    )
    content_tag(:div, iframe, class: 'youtube-container')
  end

  def convert_slideshare_url(slideshare_url)
    doc = Nokogiri::HTML(open(slideshare_url))
    meta = doc.css('meta[name="twitter:player"]').first
    if meta
       return meta.attr(:value).sub('https', 'http')
    end
  end

  def slide(slideshare_url)
    iframe = content_tag(
      :iframe,
      '',
      width: 560,
      height: 479,
      src: convert_slideshare_url(slideshare_url),
      frameborder: 0,
      allowfullscreen: true
    )
    content_tag(:div, iframe, class: 'slideshare-container')
  end
end