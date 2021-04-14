# frozen_string_literal: true

require "item"

describe Item do
  it "shows the Item's details nicely"do
    item = Item.new("+5 Dexterity Vest", 0, 20)
    expect(item.to_s).to eq "+5 Dexterity Vest, 0, 20"
  end
end
