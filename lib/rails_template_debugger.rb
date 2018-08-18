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
        "<!-- START #{path} -->",
        "<meta name='debug-template-start' path='#{path}' />",
        super,
        "<!-- END #{path} -->"
      ].join("\n").html_safe
    end

    private

    def html_template?
      identifier =~ /\.html(?:\.\w+)?$/ && !(identifier =~ /\/layouts\//)
    end
  end
end


