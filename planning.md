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
