module Resync
  RSpec.shared_examples LinkCollection do

    # TODO: Find a better way to express this
    def new_instance(**args)
      required_args = (defined? required_arguments) ? required_arguments : {}
      args = required_args.merge(args)
      described_class.new(**args)
    end

    describe 'links' do
      it 'accepts a list of links' do
        links = [Link.new(rel: 'describedby', href: 'http://example.org/'), Link.new(rel: 'duplicates', href: 'http://example.com/')]
        list = new_instance(links: links)
        expect(list.links).to eq(links)
      end

      it 'defaults to an empty list if no links are specified' do
        list = new_instance
        expect(list.links).to eq([])
      end
    end

  end
end
