require 'spec_helper'
require 'pry'

describe "CuisineType" do

  describe "#new" do 
    CuisineType.all.clear
    it "initializes with a name and an empty collection of restaurants" do
      italian = CuisineType.new("Italian")
      expect{CuisineType.new("Italian")}.to_not raise_error
      expect(italian.instance_variable_get(:@restaurants)).to eq([])
    end
  end

  describe "#name" do 
    CuisineType.all.clear
    Restaurant.all.clear

    it "has a name" do 
      greek = CuisineType.new("Greek") 
      expect(greek.name).to eq("Greek")
    end
  end

  describe "#add_restaurant" do 
    CuisineType.all.clear
    Restaurant.all.clear

    it "adds a new restaurant to the cuisine type's @restaurants array and tells that restaurant that it belongs to the cuisine type" do 
      mexican = CuisineType.new("Mexican")
      chipotle = Restaurant.new("Chipotle")
      mexican.add_restaurant(chipotle)
      
      expect(mexican.instance_variable_get(:@restaurants)).to include(chipotle)
      expect(chipotle.cuisine_type).to eq(mexican)
    end
  end

     # THIS TEST NOT PASSING: GETTING 2X COUNT FOR EACH RESTAURANT
  describe "#restaurants" do 
    CuisineType.all.clear
    Restaurant.all.clear
    it "has many restaurants" do
      japanese = CuisineType.new("Japanese")
      nobu = Restaurant.new("Nobu")
      kumo = Restaurant.new("Kumo")
      mara = Restaurant.new("Mara")
      japanese.add_restaurant(nobu) 
      japanese.add_restaurant(kumo) 
      japanese.add_restaurant(mara) 

      expect(japanese.restaurants.count).to eq(3)
    end
  end
  
  end