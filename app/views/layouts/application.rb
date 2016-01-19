module Layouts
  class Application < ::Stache::Mustache::View
    def flashes
      content_tag(:p, flash[:alert], :class => "flash notice")
    end
  end
end