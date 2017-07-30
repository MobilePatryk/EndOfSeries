namespace :ending	 do
	desc "Log the db, delete the db, then update the db"
	task :update_codes => :environment do 
	# log the db

	# delete the db
	End.destroy_all
	#scrapp data
	require 'open-uri'
	require 'nokogiri'


	(1..20).each do |a|

		page = Nokogiri::HTML(open("https://www.decathlon.pl/C-394910-dobre-okazje/I-Page" + "#{a}" + "_40"))

		pis = page.css(".old-price-percentage")

		pis.to_ary

		bis = []
		lis = []


		pis.each_with_index do |p,i|
			bis[i] = pis[i].text
		end


		bis.each_with_index do |p,i|
			if bis[i].empty?
				puts i
				lis.push(i)
			end
		end

		id = page.css('.new-product-thumbnail')

		lis.each do |i|
			e=End.new
			puts id[i]["data-product-id"]
			e.product_id=id[i]["data-product-id"]
			puts "Produkt na #{a} stronie dobrych okazji"
			e.product_page = a
			e.save
		end
	end
	puts "work!"
 end
end