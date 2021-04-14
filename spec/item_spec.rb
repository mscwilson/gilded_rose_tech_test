# frozen_string_literal: true

require "item"

describe Item do
  it "shows the Item's details nicely"do
    item = Item.new("+5 Dexterity Vest", DEFAULT_SELL_IN, DEFAULT_QUALITY)
    expect(item.to_s).to eq "+5 Dexterity Vest, #{DEFAULT_SELL_IN}, #{DEFAULT_QUALITY}"
  end
end
