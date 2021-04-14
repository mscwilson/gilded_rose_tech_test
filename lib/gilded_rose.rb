# frozen_string_literal: true

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      # p type(item)
      if (item.name != "Aged Brie") && (item.name != "Backstage passes to a TAFKAL80ETC concert")
        item.quality -= 1 if item.quality > (0) && (item.name != "Sulfuras, Hand of Ragnaros")
      elsif item.quality < 50
        item.quality = item.quality + 1
        if item.name == "Backstage passes to a TAFKAL80ETC concert"
          item.quality += 1 if item.sell_in < (11) && (item.quality < 50)
          item.quality += 1 if item.sell_in < (6) && (item.quality < 50)
        end
      end

      item.sell_in -= sell_in_change(item)

      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            item.quality = item.quality - 1 if item.quality > (0) && (item.name != "Sulfuras, Hand of Ragnaros")
          else
            item.quality = item.quality - item.quality
          end
        elsif item.quality < 50
          item.quality = item.quality + 1
        end
      end
    end
  end

  private #---------------------------------------------

  def type(item)
    item_types = { brie: "Aged Brie",
                  sulfuras: "Sulfuras, Hand of Ragnaros",
                  passes: "Backstage passes to a TAFKAL80ETC concert",
                  }
    item_types.key(item.name) ? item_types.key(item.name) : :normal
  end

  def sell_in_change(item)
    type(item) == :sulfuras ? 0 : 1
  end

end
