# frozen_string_literal: true

require "gilded_rose"

describe GildedRose do
  describe "#update_all" do
    describe "for normal items" do
      before do
        @normal = Item.new("normal item", DEFAULT_SELL_IN, DEFAULT_QUALITY)
        @shop = GildedRose.new([@normal])
      end

      it "reduces sell_in by 1" do
        expect { @shop.update_all }.to change { @normal.sell_in }.by(-1)
      end

      it "reduces quality by 1" do
        expect { @shop.update_all }.to change { @normal.quality }.by(-1)
      end

      it "doesn't reduce quality beyond 0" do
        (DEFAULT_QUALITY + 1).times { @shop.update_all }
        expect(@normal.quality).to eq 0
      end

      it "reduces quality by 2 if past sell by date" do
        normal_past_date = Item.new("normal", NEGATIVE_SELL_IN, DEFAULT_QUALITY)
        shop = GildedRose.new([normal_past_date])
        expect { shop.update_all }.to change { normal_past_date.quality }.by(-2)
      end
    end

    describe "for aged brie" do
      before do
        @brie = Item.new("Aged Brie", DEFAULT_SELL_IN, DEFAULT_QUALITY)
        @shop = GildedRose.new([@brie])
      end

      it "reduces sell_in by 1" do
        expect { @shop.update_all }.to change { @brie.sell_in }.by(-1)
      end

      it "increases quality by 1" do
        expect { @shop.update_all }.to change { @brie.quality }.by 1
      end

      it "doesn't increase quality beyond 50" do
        brie_high_quality = Item.new("Aged Brie", DEFAULT_SELL_IN, MAXIMUM_QUALITY)
        shop = GildedRose.new([brie_high_quality])
        expect { shop.update_all }.not_to change { brie_high_quality.quality }
      end
    end

    describe "for sulfuras" do
      before do
        @sulfuras = Item.new("Sulfuras, Hand of Ragnaros", DEFAULT_SELL_IN, SULFURAS_QUALITY)
        @shop = GildedRose.new([@sulfuras])
      end

      it "does not change sell_in" do
        expect { @shop.update_all }.not_to change { @sulfuras.sell_in }
      end

      it "does not change quality" do
        expect { @shop.update_all }.not_to change { @sulfuras.quality }
        expect(@sulfuras.quality).to eq SULFURAS_QUALITY
      end
    end

    describe "for backstage passes" do
      before do
        @pass = Item.new("Backstage passes to a TAFKAL80ETC concert", DEFAULT_SELL_IN, DEFAULT_QUALITY)
        @shop = GildedRose.new([@pass])
      end

      it "reduces sell_in by 1" do
        expect { @shop.update_all }.to change { @pass.sell_in }.by(-1)
      end

      it "increases quality by 1 if sell_in more than 10" do
        expect { @shop.update_all }.to change { @pass.quality }.by 1
      end

      it "increases quality by 2 if sell_in between 10 and 6" do
        pass = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, DEFAULT_QUALITY)
        shop = GildedRose.new([pass])
        expect { shop.update_all }.to change { pass.quality }.by 2
      end

      it "increases quality by 3 if sell_in between 5 and 1" do
        pass = Item.new("Backstage passes to a TAFKAL80ETC concert", 1, DEFAULT_QUALITY)
        shop = GildedRose.new([pass])
        expect { shop.update_all }.to change { pass.quality }.by 3
      end

      it "sets quality to 0 if sell_in is 0 or less" do
        pass = Item.new("Backstage passes to a TAFKAL80ETC concert", NEGATIVE_SELL_IN, DEFAULT_QUALITY)
        shop = GildedRose.new([pass])
        shop.update_all
        expect(pass.quality).to eq 0
      end

      it "has maximum quality of 50" do
        pass = Item.new("Backstage passes to a TAFKAL80ETC concert", DEFAULT_SELL_IN, MAXIMUM_QUALITY)
        shop = GildedRose.new([pass])
        expect { shop.update_all }.not_to change { pass.quality }
      end
    end

    describe "for conjured" do
      before do
        @conjured = Item.new("Conjured Mana Cake", DEFAULT_SELL_IN, DEFAULT_QUALITY)
        @shop = GildedRose.new([@conjured])
      end

      it "reduces sell_in by 1" do
        expect { @shop.update_all }.to change { @conjured.sell_in }.by(-1)
      end

      it "reduces quality by 1" do
        expect { @shop.update_all }.to change { @conjured.quality }.by(-2)
      end

      it "doesn't reduce quality beyond 0" do
        (DEFAULT_QUALITY + 1).times { @shop.update_all }
        expect(@conjured.quality).to eq 0
      end

      it "reduces quality by 2 if past sell by date" do
        conjured_past_date = Item.new("Conjured Mana Cake", NEGATIVE_SELL_IN, DEFAULT_QUALITY)
        shop = GildedRose.new([conjured_past_date])
        expect { shop.update_all }.to change { conjured_past_date.quality }.by(-4)
      end
    end
  end
end
