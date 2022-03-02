module ProductModule
 		def discount(items)
 			products = Product.all
	    items.uniq.inject(0) do |sum, item|
	      price = products.find_by_code(item).price.to_i
	      count = items.count(item)
	      sum += price * count
	      sum -=((price * 30).to_f / 100) * count if count >= 3 && item == 'TSHIRT'
	      sum -= price if count > 1 && item == 'MUG'
	      sum
	    end
		end
end
