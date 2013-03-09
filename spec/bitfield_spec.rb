require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Bloom
  describe Bitfield do
    let(:bitfield) { Bitfield.new }

    describe '#initialize' do
      it 'should initialize as empty' do
        Bitfield.new.binary.should be_zero
      end
    end

    describe '#get' do
      b = Bitfield.new(11)
      b.get(0).should == true
      b.get(1).should == true
      b.get(2).should == false
      b.get(3).should == true
    end

    describe '#set' do
      it 'should set a bit at the given radix' do
        bitfield.set(0)
        bitfield.binary.should == 0x0000000000000001

        bitfield.set(3)
        bitfield.binary.should == 0x0000000000000009

        bitfield.set(31)
        bitfield.binary.should == 0x0000000080000009

        bitfield.set(63)
        bitfield.binary.should == 0x8000000080000009
      end

      it 'should be able to handle obscenely high radixes' do
        bitfield.set(123456)
        bitfield.binary.should == (2 ** 123456)
      end
    end

  end
end
