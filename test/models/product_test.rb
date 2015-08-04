require 'test_helper'

class ProductTest < ActiveSupport::TestCase

	test "product attribute must not be empty" do 
		product = Product.new
		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:description].any?
		assert product.errors[:image_url].any?
		assert product.errors[:price].any?
	end

	test "product price must be greater than 0" do
		product = Product.new({
			title: 'Product title',
			description: 'xxx',
			image_url: 'xxx.jpg',
			})
		product.price = -1
		assert product.invalid?

		product.price = 0
		assert product.invalid?

		product.price = 1
		assert product.valid?
	end

	def new_product(image_url)
		Product.new({title: 'My book title',
			description: 'xxx',
			image_url: image_url,
			price: 19.95})
	end
	test "image url" do
		ok = %w{fred.gif fred.jpg fred.png FRED.JPG http://a.b.c/x/y/z/fred.gif}
		bad = %w{fred.doc}

		ok.each do |name|
			assert new_product(name).valid?
		end
		bad.each do |name|
			assert new_product(name).invalid?
		end
	end
	test "uniq name" do
		product = Product.new({
															title: products(:Ruby).title,
															description: 'xxxxx',
															image_url: 'image.jpg',
															price: 19.95
													})
		assert product.invalid?

	end
	end