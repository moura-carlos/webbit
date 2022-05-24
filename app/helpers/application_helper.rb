module ApplicationHelper
  def render_svg(name, styles: 'fill-current text-gray-500', title: nil)
    filename = "#{name}.svg"
    title ||= name.underscore.humanize
    inline_svg(filename, aria: true, nocomment: true, title: title, class: styles)
  end

  def inject_feed_ad(index)
    if((index + 1) % 3 == 0)
      render "feed_ad"
    end
  end
end
