require "rails_template_debugger/version"

module RailsTemplateDebugger
  def self.debug_templates
    ActionView::Template.send(:prepend, ActionViewTemplateRenderWithComment)
  end

  module ActionViewTemplateRenderWithComment
    def render(view, locals, buffer = nil, &block)
      return super unless html_template?

      path = identifier.remove(Rails.root.to_s + "/")
      # path_short = path.match(/app\/views\/(.*)/)&.captures&.first

      [
        "<!-- TEMPLATE START #{path} -->",
        "<meta name='rails_template_debugger' path='#{path}' />",
        super,
        "<!-- TEMPLATE END #{path} -->"
      ].join("\n").html_safe
    end

    private

    def html_template?
      identifier =~ /\.html(?:\.\w+)?$/ && !(identifier =~ /\/layouts\//)
    end
  end
end


