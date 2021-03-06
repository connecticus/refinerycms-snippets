module Extensions
  module Page

    def self.included(base)

      base.class_eval do

        scope :for_snippet, ->(snippet) {
          raise RuntimeError.new("Couldn't find Pages for a nil Snippet") if snippet.blank?
          joins(:parts => :snippets).where(:snippets_page_parts => {:snippet_id => snippet.id})
        }

        def snippets
          Refinery::Snippets::Snippet.for_page(self)
        end

      end

    end

  end
end
