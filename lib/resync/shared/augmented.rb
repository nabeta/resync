require_relative '../link'
require_relative '../metadata'

module Resync

  # Base class for elements augmented with ResourceSync-specific child elements.
  #
  # @!attribute [rw] links
  #   @return [Array<Link>] Related links. (Optional; defaults to an empty array.)
  # @!attribute [rw] metadata
  #   @return [Metadata] Metadata about this object. (Optional)
  class Augmented
    include XML::Mapped

    # ------------------------------------------------------------
    # Class methods

    # ResourceSync-specific tags needing to be prefixed with +rs+ on output
    RS_TAGS = Set['ln', 'md']
    private_constant :RS_TAGS

    # Adds the +rs+ namespace prefix
    def self.prefix_rewriter(obj, xml, default_obj_to_xml)
      default_obj_to_xml.call(obj, xml)
      xml.each_element do |e|
        e.name = "rs:#{e.name}" if RS_TAGS.include?(e.name)
      end
    end
    private_class_method :prefix_rewriter

    # ------------------------------------------------------------
    # Attributes

    array_node :links, 'ln', class: Link, default_value: [], writer: method(:prefix_rewriter)
    object_node :metadata, 'md', class: Metadata, default_value: nil, writer: method(:prefix_rewriter)

    use_mapping :sitemapindex
    array_node :links, 'ln', class: Link, default_value: [], writer: method(:prefix_rewriter)
    object_node :metadata, 'md', class: Metadata, default_value: nil, writer: method(:prefix_rewriter)

    # ------------------------------------------------------------
    # Initializer

    # Creates a new +Augmented+ with the specified links and metadata.
    #
    # @param links [Array<Link>] Related links (+<rs:ln>+). (Optional; defaults to an empty array.)
    # @param metadata [Metadata] Metadata about this list. (Optional)
    def initialize(links: [], metadata: nil)
      self.links = links
      self.metadata = metadata
    end

    # ------------------------------------------------------------
    # Custom setters

    # Sets the +links+ list. +nil+ is treated as an empty list.
    def links=(value)
      @links = value || []
    end

  end
end