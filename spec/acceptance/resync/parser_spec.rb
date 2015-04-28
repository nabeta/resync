require 'spec_helper'

module Resync
  describe Parser do

    it 'parses example 1' do
      data = File.read('spec/data/examples/example-1.xml')
      urlset = Parser.parse(data)
      expect(urlset).to be_a(Urlset)

      md = urlset.md
      expect(md).not_to be_nil
      expect(md.capability).to eq('resourcelist')

      urls = urlset.url
      expect(urls.size).to eq(2)

      url0 = urls[0]
      expect(url0.loc).to eq(URI('http://example.com/res1'))

      url1 = urls[1]
      expect(url1.loc).to eq(URI('http://example.com/res2'))
    end

  end
end