require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Bloom
  describe "Bloom" do
    it 'should have defaults' do
      DEFAULTS[:m].should_not be_nil
      DEFAULTS[:k].should_not be_nil
    end
  end
end
