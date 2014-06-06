class Item
	attr_writer :price
	attr_accessor :name, :quantity, :exempt, :import

	def initialize(name, quantity, price, exempt, import)
		@name = name
		@quantity = quantity
		@price = price
		@exempt = exempt
		@import = import
	end 

	def exempt
		if @exempt == true
			@price
		else
			@price * 1.1
		end
	end

	def import_tax
		if @import == true
			@price * 1.05
		else
			@price
		end
	end

	def price
		@price.round(2)
	end

	def both
		if @import == true && @exempt == false
			@price * 1.15
		end
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
puts "Sales taxes: " + (cd.exempt - cd.price).round(2).to_s.concat("0")
puts "Total: " + (cd.price + book.price + choc.price).round(2).to_s
puts

#Input Two
box_choc = Item.new("imported box of chocolates", 1, 10.00, true, true)
perfume = Item.new("imported bottle of perfume", 1, 47.50, false, true)


#Output Two 
puts "#{box_choc.quantity} #{box_choc.name}: " + box_choc.import_tax.to_s.concat("0") 
puts "#{perfume.quantity} #{perfume.name}: #{perfume.price}".concat("0") 
#At this point concatenating 0 is getting repetitive, not sure why rounding to 1 decimal place is happening. Let's come back to this and try to refactor.
puts



#Input Three
perfume_2 = Item.new("imported bottle of perfume", 1, 27.99, false, true)
perfume_3 = Item.new("bottle of perfume", 1, 18.99, false, false)
pills = Item.new("packet of headache pills", 1, 9.75, true, false)
box_choc_2 = Item.new("imported box of chocolate", 1, 11.25, false, true)

#Output Three
puts "#{perfume_2.quantity} #{perfume_2.name}: " + perfume_2.both.round(2).to_s
puts "#{perfume_3.quantity} #{perfume_3.name}: " + perfume_3.exempt.round(2).to_s
puts "#{pills.quantity} #{pills.name}: " + pills.exempt.round(2).to_s
puts "#{box_choc_2.quantity} #{box_choc_2.name}: " + box_choc_2.import_tax.round(2).to_s
puts "Sales taxes: " + ((perfume_2.exempt - perfume_2.price) + (perfume_3.exempt - perfume_3.price)).round(2).to_s
puts "Total: " + (perfume_2.both + perfume_3.exempt + pills.exempt + box_choc_2.import_tax).round(2).to_s
