require 'html/pipeline'

module HTML
  class Pipeline
    class ImageLinkFilter < Filter
      IGNORE_PARENTS = %w[pre code a style script].to_set

      def call
        doc.xpath('.//text()').each do |node|
          next if has_ancestor?(node, IGNORE_PARENTS)

          content = node.to_html
          html = apply_filter(content)
          next if html == content

          node.replace(html)
        end
        doc
      end

      def apply_filter(content)
        protocols = https_only? ? %w[https] : %w[https http]
        content.gsub(/#{Regexp.union(protocols)}:\/\/.+\.#{Regexp.union(image_extensions)}(\?\S+)?/i) do |match|
          %(<a href="#{match}"><img src="#{match}" alt=""></a>)
        end
      end

      private

      def https_only?
        @context.key?(:https_only) ? @context[:https_only] : true
      end

      def image_extensions
        @context[:image_extensions] || %w[jpg jpeg bmp gif png]
      end
    end
  end
end
