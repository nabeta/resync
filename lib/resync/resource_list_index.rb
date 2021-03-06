require_relative 'shared/base_resource_list'
require_relative 'shared/sitemap_index'

module Resync
  # A resource list index. See section 10.2,
  # "{http://www.openarchives.org/rs/1.0/resourcesync#ResourceListIndex Resource List Index}",
  # in the ResourceSync specification.
  class ResourceListIndex < BaseResourceList
    include ::XML::Mapping
    include SitemapIndex

    # The capability provided by this type.
    CAPABILITY = 'resourcelist'
  end
end
