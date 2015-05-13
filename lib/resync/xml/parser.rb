require 'rexml/document'

module Resync
  module XML

    module Parser

      # @return [Urlset, Sitemapindex]
      def self.parse(xml)
        root = Resync::XML.element(xml)
        parse_class = get_parse_class(root)
        parse_class.load_from_xml(root)
      end

      # ------------------------------
      # Private methods

      def self.get_parse_class(root)
        root_name = root.name
        case root_name.downcase
        when 'urlset'
          Urlset
        when 'sitemapindex'
          Sitemapindex
        else
          fail "Unexpected root tag <#{root_name}>"
        end
      end

      private_class_method :get_parse_class

    end
  end
end
