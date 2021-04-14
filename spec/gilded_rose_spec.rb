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

  describe "#update_quality" do
    describe "for normal items" do
      before do
        @normal = Item.new("normal item", 10, 20)
        @shop = GildedRose.new([@normal])
      end

      it "reduces sell_in by 1" do
        expect { @shop.update_quality }.to change{@normal.sell_in}.by -1
      end

      it "reduces quality by 1" do
        expect { @shop.update_quality }.to change{@normal.quality}.by -1
      end

      it "doesn't reduce quality beyond 0" do
        21.times { @shop.update_quality }
        expect(@normal.quality).to eq 0
      end

      it "reduces quality by 2 if past sell by date" do
        normal_past_date = Item.new("normal", -5, 20)
        shop = GildedRose.new([normal_past_date])
        expect { shop.update_quality }.to change{normal_past_date.quality}.by -2
      end
    end

    describe "for aged brie" do
      before do
        @brie = Item.new(name = "Aged Brie", sell_in = 2, quality = 0)
        @shop = GildedRose.new([@brie])
      end

      it "reduces sell_in by 1" do
        expect { @shop.update_quality }.to change{@brie.sell_in}.by -1
      end

      it "increases quality by 1" do
        expect { @shop.update_quality }.to change{@brie.quality}.by 1
      end

      it "doesn't increase quality beyond 50" do
        brie_high_quality = Item.new(name = "Aged Brie", sell_in = 2, quality = 50)
        shop = GildedRose.new([brie_high_quality])
        expect { shop.update_quality }.not_to change{brie_high_quality.quality}
      end
    end

    describe "for sulfuras" do
      before do
        @sulfuras = Item.new(name = "Sulfuras, Hand of Ragnaros", sell_in = 0, quality = 80)
        @shop = GildedRose.new([@sulfuras])
      end

      it "does not change sell_in" do
        expect { @shop.update_quality }.not_to change{@sulfuras.sell_in}
      end

      it "does not change quality" do
        expect { @shop.update_quality }.not_to change{@sulfuras.quality}
        expect(@sulfuras.quality).to eq 80
      end
    end

    describe "for backstage passes" do
      before do
        @pass = Item.new(name = "Backstage passes to a TAFKAL80ETC concert", sell_in = 15, quality = 20)
        @shop = GildedRose.new([@pass])
      end

      it "reduces sell_in by 1" do
        expect { @shop.update_quality }.to change{@pass.sell_in}.by -1
      end

      it "increases quality by 1 if sell_in more than 10" do
        expect { @shop.update_quality }.to change{@pass.quality}.by 1
      end

      it "increases quality by 2 if sell_in between 10 and 6" do
        pass = Item.new(name = "Backstage passes to a TAFKAL80ETC concert", sell_in = 10, quality = 20)
        shop = GildedRose.new([pass])
        expect { shop.update_quality }.to change{pass.quality}.by 2
      end

      it "increases quality by 3 if sell_in between 5 and 1" do
        pass = Item.new(name = "Backstage passes to a TAFKAL80ETC concert", sell_in = 1, quality = 20)
        shop = GildedRose.new([pass])
        expect { shop.update_quality }.to change{pass.quality}.by 3
      end

      it "sets quality to 0 if sell_in is 0 or less" do
        pass = Item.new(name = "Backstage passes to a TAFKAL80ETC concert", sell_in = 0, quality = 20)
        shop = GildedRose.new([pass])
        shop.update_quality
        expect(pass.quality).to eq 0
      end

      it "has maximum quality of 50" do
        pass = Item.new(name = "Backstage passes to a TAFKAL80ETC concert", sell_in = 1, quality = 49)
        shop = GildedRose.new([pass])
        expect { shop.update_quality }.to change{pass.quality}.to 50
      end
    end

  end
end
