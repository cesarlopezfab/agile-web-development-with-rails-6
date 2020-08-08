require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products 

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "negative product price is invalid" do 
    product = new_product price: -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]
  end

  test "0 product price is invalid" do 
    product = new_product price: 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]
  end

  test "possitive product price is valid" do 
    product = new_product price: 1
    assert product.valid?
  end

  test "valid image urls" do
    urls = %w{ fred.gif fred.jpg fred.png FRED.JPG Fred.Jpg }
    urls.each { |image_url|
      assert new_product(image_url: image_url).valid?, "#{image_url} shouldn't be invalid"
    }
  end
    
  test "invalid image urls" do
    urls = %w{ fred.txt fred.jpg/more fred.png.more }
    urls.each { |image_url|
      assert new_product(image_url: image_url).invalid?, "#{image_url} shouldn't be valid"
    }
  end

  test "product is not valid without a unique title i18n" do
    product = new_product(title: products(:ruby).title)
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
  end

  private def new_product(args)
    Product.new(
      title: args[:title] || "My book title",
      description: "any description",
      image_url: args[:image_url] || "any.jpg",
      price: args[:price] || 3
    )
  end
  
end
