require 'gilded_rose'

describe GildedRose do

  # describe "#update_quality" do
  #   xit "does not change the name" do
  #     items = [Item.new("foo", 0, 0)]
  #     GildedRose.new(items).update_quality()
  #     expect(items[0].name).to eq "fixme"
  #   end
  # end

  describe "#update_quality v2" do

    describe "works with normal items"

    it "reduces sell_in by 1" do
      normal = double(:normal_item, name: "vest", sell_in: 10, quality: 20)
      allow(normal).to receive(:quality).and_return(20, 19)
      allow(normal).to receive(:quality=)
      allow(normal).to receive(:sell_in).and_return(10, 9)
      allow(normal).to receive(:sell_in=)
      grose = GildedRose.new([normal])
      expect{ grose.update_quality }.to change { normal.sell_in }.by -1
    end

  end

end
