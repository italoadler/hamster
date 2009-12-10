require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Hamster::List do

  describe "#each" do

    describe "on a really big list" do

      before do
        @list = Hamster.interval(0, 100000)
      end

      it "doesn't run out of stack space" do
        @list.each {}
      end

    end

    [
      [],
      ["A"],
      ["A", "B", "C"],
    ].each do |values|

      describe "on #{values.inspect}" do

        before do
          @list = Hamster.list(*values)
        end

        describe "with a block" do

          it "iterates over the items in order" do
            items = []
            @list.each { |value| items << value }
            items.should == values
          end

          it "returns nil" do
            @list.each {}.should be_nil
          end

        end

        describe "without a block" do

          it "returns self" do
            @list.each.should equal(@list)
          end

        end

      end

    end

  end

end