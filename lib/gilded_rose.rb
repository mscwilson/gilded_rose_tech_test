# frozen_string_literal: true

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_all
    @items.each do |item|
      update_quality(item)
      update_sell_in(item)
    end
  end

  private #---------------------------------------------

  def type(item)
    item_types = { brie: "Aged Brie",
                  sulfuras: "Sulfuras, Hand of Ragnaros",
                  passes: "Backstage passes to a TAFKAL80ETC concert",
                  conjured: "Conjured Mana Cake"
                  }
    item_types.key(item.name) || :normal
  end

  def update_sell_in(item)
    item.sell_in -= (type(item) == :sulfuras ? 0 : 1)
  end

  def update_quality(item)
    case type(item)
    when :normal
      quality_adjust_normal(item)
    when :brie
      quality_adjust_brie(item)
    when :passes
      quality_adjust_passes(item)
    when :conjured
      quality_adjust_conjured(item)
    end
  end

  def quality_adjust_normal(item)
    return if item.quality == 0

    item.quality -= (item.sell_in >= 0 ? 1 : 2)
    item.quality = 0 if item.quality < 0
  end

  def quality_adjust_brie(item)
    return if item.quality == 50

    item.quality += 1
  end

  def quality_adjust_passes(item)
    return if (item.quality == 50 && item.sell_in > 0) || item.quality == 0

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

  def quality_adjust_conjured(item)
    return if item.quality == 0

    item.quality -= (item.sell_in >= 0 ? 2 : 4)
    item.quality = 0 if item.quality < 0
  end
end
