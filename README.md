## Gilded Rose Tech Test
My attempt at the [Gilded Rose](https://github.com/emilybache/GildedRose-Refactoring-Kata) code kata, in Ruby. It's a kata based on refactoring: terrible legacy code is provided, the goal is to improve it and then add a new feature.

### Description
The specification can be found [here](https://github.com/emilybache/GildedRose-Refactoring-Kata/blob/master/GildedRoseRequirements.txt). The code belongs to a magical inn, the Gilded Rose. It relates to inventory and item sell by dates. It starts with two classes, Item, and GildedRose. The Item class mustn't be edited.

I started by writing tests to cover all the existing functionality. Next, I ran the linter and code formatter [Rubocop](https://github.com/rubocop/rubocop) (with autocorrection), which improved the readability of the legacy code. I then wrote private methods to individually handle the changes needed for each type of Item. Because the functionality was fully tested (100% test coverage), I could be sure I wasn't breaking anything when I started replacing the old code with new private methods. I ran `rspec` after each change.

[This](original_method.md) is what the original method looked like.  
[This](post_rubocop.md) is how it looked after Rubocop's help.

This is how the main method looks now:
```ruby
def update_all
  @items.each do |item|
    update_quality(item)
    update_sell_in(item)
  end
end
```
I decided to change the name to `update_all`, since the original name `update_quality` was misleading: it updates Items' sell_in attribute as well.
  
### Installation and Usage
To try out this code, you will need Ruby, ideally 3.0.0 which is specified in the Gemfile.
* Clone this repo
* Navigate to the cloned folder
* The legacy codebase included code to check that the results looked right. Run `ruby texttest_fixture.rb` to see the results. You can change how many times the `GildedRose.update_all` method is called on line 21.
* Otherwise, use the Ruby REPL irb to interact with the code: `irb -r ./lib/gilded_rose`
* To run the tests: `rspec`

