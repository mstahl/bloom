require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Bloom
  describe "Filter" do
    let(:filter) { Filter.new }

    describe '#<<' do
      it 'should change the binary representation of the filter' do
        filter << 1234567
        filter.bitfield.binary.should_not be_zero
      end

    end

    describe '#include?' do
      it 'should return false if an item is not in the filter, always' do
        filter << 'foo'
        filter << 'bar'
        filter << 'baz'
        filter.should_not include('quux')
      end

      it 'should return true if an item is in the filter, sometimes' do
        filter << 'foo'
        filter << 'bar'
        filter << 'baz'
        filter.should include('foo')
        filter.should include('bar')
        filter.should include('baz')
      end
    end

  end
end
