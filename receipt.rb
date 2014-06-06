class Item
	attr_accessor :name, :quantity, :price, :exempt, :import

	def initialize(name, quantity, price, exempt, import)
		@name = name
		@quantity = quantity
		@price = price
		@exempt = exempt
		@import = import
	end 

	def exempt
		if :exempt == true
			@price
		else
			@price *= 1.1
			@price
		end
	end

	def import
		if :import == true
			@price *= 1.05
			@price
		else
			@price = @price
			@price
		end
	end

	def both
		@price *= 1.15 
		@price
	end

end

# Input One
book = Item.new("book", 1, 12.49, true, false)
cd = Item.new("music CD", 1, 14.99, false, false)
choc = Item.new("chocolate bar", 1, 0.85, true, false)

#Output One
puts "#{book.quantity} #{book.name}: #{book.price}"
puts "#{cd.quantity} #{cd.name}: " + cd.exempt.round(2).to_s
puts "#{choc.quantity} #{choc.name}: #{choc.price}"
puts "Sales taxes: " + (cd.price - 14.99).round(2).to_s.concat("0")
puts "Total: " + (cd.price.round(2) + book.price.round(2) + choc.price.round(2)).to_s
puts

#Input Two
box_choc = Item.new("imported box of chocolates", 1, 10.00, true, true)
perfume = Item.new("imported bottle of perfume", 1, 47.50, false, true)

box_choc.import
#Output Two 
puts "#{box_choc.quantity} #{box_choc.name}: " + box_choc.price.to_s #import not calculating correctly, why?
puts "#{perfume.quantity} #{perfume.name}: #{perfume.price}".concat("0") 
#At this point concatenating 0 is getting repetitive, not sure why rounding to 1 decimal place is happening. Let's come back to this and try to refactor.
puts



#Input Three
perfume_2 = Item.new("imported bottle of perfume", 1, 27.99, false, true)
perfume_3 = Item.new("bottle of perfume", 1, 18.99, false, false)
pills = Item.new("packet of headache pills", 1, 9.75, false, false)
box_choc_2 = Item.new("box of chocolate", 1, 11.25, false, true)

#Output Three
perfume_2.import
# puts "#{perfume_2.quantity} #{perfume_2.name}: " + perfume_2.price.to_s


