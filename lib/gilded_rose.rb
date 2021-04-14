# frozen_string_literal: true

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      # p type(item)
      if type(item) == :normal
        item.quality -= 1 if item.quality > (0)
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
          if item.name != "Backstage passes to a TAFKAL80ETC concert" && (item.name != "Sulfuras, Hand of Ragnaros")
            item.quality = item.quality - 1 if item.quality > (0)
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

  def quality_adjust_normal(item)
    return if item.quality == 0

    if item.sell_in >= 0
      item.quality -= 1
    else
      item.quality -= 2
    end
    item.quality = 0 if item.quality < 0
  end

  def quality_adjust_brie(item)
    return if item.quality == 50
    item.quality += 1
  end

  def quality_adjust_passes(item)
    return if item.quality == 50
    if item.sell_in > 10
      item.quality += 1
    elsif (6..10).include?(item.sell_in)
      item.quality += 2
    elsif (1..5).include?(item.sell_in)
      item.quality += 3
    else
      item.quality = 0
    end
    item.quality = 50 if item.quality > 50
  end

end
