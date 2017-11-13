class UpdateCodeJob < ApplicationJob
  queue_as :default
  require 'open-uri'
  require 'nokogiri'

  def perform(*args)
    End.destroy_all
	#scrapp data

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
			e.position=i+1
			puts id[i]["data-product-id"]
			puts id[i]["data-product-imgurl"]
			puts id[i]["data-product-breadcrumb-family"]
			e.img = id[i]["data-product-imgurl"]
			e.family = id[i]["data-product-breadcrumb-family"]
			e.product_id=id[i]["data-product-id"]
			puts "Produkt na #{a} stronie dobrych okazji"
			e.product_page = a
			e.save
		end
	end
	puts "work!"
 end
end

