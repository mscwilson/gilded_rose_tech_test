# Gilded Rose Tech Test
My attempt at the [Gilded Rose](https://github.com/emilybache/GildedRose-Refactoring-Kata) code kata, in Ruby. It's a kata based on refactoring: terrible legacy code is provided, the goal is to improve it and then add a new feature.

# Specification/Story
The specification can be found [here](https://github.com/emilybache/GildedRose-Refactoring-Kata/blob/master/GildedRoseRequirements.txt). The code belongs to a magical inn, and relates to inventory and item sell by dates. One of the existing classes mustn't be edited.


Classes
Item
---
name
sell_in
quality
---
to_s (ie string representation)


GildedRose
---
items - given as arg, a list of Items
---
update_quality


Types of item and o/n changes
normal:
    sell by - 1
    quality - 1
    if sell by == -1, quality - 2
    if quality == 0, no change
aged brie:
    sell by - 1
    quality + 1
    if quality == 50, no change
sulfuras:
    sell by no change
    quality no change, always 80
backstage pass:
    sell by - 1
    if sell by > 10, quality + 1
    if sell by in (6..10), quality + 2
    if sell by in (0..5), quality + 3
    if sell by == -1, quality = 0
(conjured):
    sell by - 1
    quality - 2
    if sell by == -1, quality - 4
    if quality == 0, no change
