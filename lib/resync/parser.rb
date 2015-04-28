require 'nokogiri'

module Resync
  class Parser

    # ------------------------------
    # Public methods

    def self.parse(xml)

      doc = case xml
             when Nokogiri::XML::Document
               xml
             when String
               Nokogiri::XML(xml)
             else
               fail "Unexpected argument type; expected XML document, was #{xml.class}"
             end

      parse_class = get_parse_class(doc)
      parse_class.parse(doc, single: true)
    end

    # ------------------------------
    # Private methods

    private

    def self.get_parse_class(doc)
      root_name = doc.root.name
      case root_name.downcase
      when 'urlset'
        Urlset
      when 'sitemapindex'
        Sitemapindex
      else
        fail "Unexpected root tag <#{root_name}>"
      end
    end
  end
end