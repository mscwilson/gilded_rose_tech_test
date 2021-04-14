# frozen_string_literal: true

require "gilded_rose"

describe GildedRose do
  # describe "#update_quality" do
  #   xit "does not change the name" do
  #     items = [Item.new("foo", 0, 0)]
  #     GildedRose.new(items).update_quality()
  #     expect(items[0].name).to eq "fixme"
  #   end
  # end

  describe "#update_single_item" do
    describe "for normal items" do
      before do
        @normal = double(:normal_item,
                          name: "vest",
                          sell_in: 10,
                          quality: 20,
                          :sell_in= => 9,
                          :quality= => 19)
        # allow(@normal).to receive(:quality=).with(@normal.quality - 1).and_return(@normal.quality - 1)
        # allow(@normal).to receive(:sell_in=)

        @shop = GildedRose.new([@normal])
      end

      it "reduces quality by 1" do
        expect(@shop.update_single_item(@normal)).to eq @normal
      end

    end

  end

  # describe "#update_quality" do
  #   describe "for normal items" do
  #     before do
  #       @normal = double(:normal_item, name: "vest", sell_in: 10, quality: 20)
  #       allow(@normal).to receive(:quality=).with(@normal.quality - 1).and_return(@normal.quality - 1)
  #       allow(@normal).to receive(:sell_in=)

  #       @shop = GildedRose.new([@normal])
  #     end

    #   it "reduces sell_in by 1" do
    #     @shop.update_quality
    #     # expect(@normal).to have_received(:sell_in=).with(@normal.sell_in - 1)
    #     expect(@normal.quality).to eq 19
    #   end

    #   it "reduces quality by 1" do
    #     @shop.update_quality
    #     expect(@normal).to have_received(:quality=).with(@normal.quality - 1)
    #   end

    #   it "doesn't reduce quality beyond 0" do
    #     allow(@normal).to receive(:quality).and_return(0)
    #     @shop.update_quality
    #     expect(@normal).not_to have_received(:quality=)
    #   end

    #   it "reduces quality by 2 if past sell by date" do
    #     allow(@normal).to receive(:sell_in).and_return(-1)
    #     @shop.update_quality
    #     expect(@normal).to have_received(:quality=).with(@normal.quality - 1).twice
    #   end

    #   it "reduces quality by 1 if last day of sale" do
    #     allow(@normal).to receive(:sell_in).and_return(0)
    #     @shop.update_quality
    #     expect(@normal).to have_received(:quality=).with(@normal.quality - 1)
    #   end
    # end

    # # describe "for aged brie" do
    # #   before do
    # #     @brie = double(:brie_item, name: "Aged Brie", sell_in: 2, quality: 0)
    # #     allow(@brie).to receive(:quality=)
    # #     allow(@brie).to receive(:sell_in=)

    # #     @shop = GildedRose.new([@brie])
    # #   end

    # #   it "reduces sell_in by 1" do
    # #     @shop.update_quality
    # #     expect(@brie).to have_received(:sell_in=).with(@brie.sell_in - 1)
    # #   end

    # #   it "increases quality by 1" do
    # #     @shop.update_quality
    # #     expect(@brie).to have_received(:quality=).with(@brie.quality + 1)
    # #   end

    # #   it "doesn't increase quality beyond 50" do
    # #     allow(@brie).to receive(:quality).and_return(50)
    # #     @shop.update_quality
    # #     expect(@brie).not_to have_received(:quality=)
    # #   end
    # # end

    # # describe "for sulfuras" do
    # #   before do
    # #     @sulfuras = double(:sulfuras_item, name: "Sulfuras", sell_in: 0, quality: 80)
    # #     allow(@sulfuras).to receive(:quality=)
    # #     allow(@sulfuras).to receive(:sell_in=)

    # #     @shop = GildedRose.new([@sulfuras])
    # #   end

    # #   it "does not change sell_in" do
    # #     @shop.update_quality
    # #     expect(@sulfuras).not_to have_received(:sell_in=)
    # #   end

    # #   it "does not change quality" do
    # #     @shop.update_quality
    # #     expect(@sulfuras).not_to have_received(:quality=)
    # #   end

    # #   it "doesn't increase quality beyond 50" do
    # #     allow(@sulfuras).to receive(:quality).and_return(50)
    # #     @shop.update_quality
    # #     expect(@sulfuras).not_to have_received(:quality=)
    # #   end
    # # end

  # end
end
