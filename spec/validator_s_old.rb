require 'minitest/spec'
require 'minitest/autorun'

require_relative "../lib/validator"

describe TheValidator do
  before do
    @subj_empty = TheValidator.new
    @subj_correct = TheValidator.new( name: "Jeff Horn", email: "jeff@jeffreyhorn.com" )
    @subj_incorrect_name = TheValidator.new( name: "1234", email: "jeff@jeffreyhorn.com" )
    @subj_incorrect_email = TheValidator.new( name: "Jeff Horn", email: "1234&.com" )
    @subj_incorrect_both = TheValidator.new( name: "1234", email: "1234&.com" )
    @subj_empty_name = TheValidator.new( name: "", email: "1234&.com" )
    @subj_empty_email = TheValidator.new( name: "1234", email: "" )

  end

  describe "when TheValidator is initialized" do

    it "must be an instance of 'TheValidator'" do
      @subj_empty.must_be_instance_of TheValidator
    end

    it "must start with an empty name" do
      @subj_empty.name.must_be_empty
    end

    it "must start with an empty email" do
      @subj_empty.email.must_be_empty
    end

  end

  describe "when validating a name" do

    it "must equal true when given 'Jeff Horn' " do
      @subj_correct.validate_name?.must_equal true
    end

    it "must equal false when given '1234' " do
      @subj_incorrect_name.validate_name?.must_equal false
    end

    it "must equal false when given '' " do
      @subj_empty.validate_name?.must_equal false
    end

  end

  describe "when validating an email" do

    it "must equal true when given 'jeff@jeffreyhorn.com' " do
      @subj_correct.validate_email?.must_equal true
    end

    it "must equal false when given '1234&.com' " do
      @subj_incorrect_email.validate_email?.must_equal false
    end

    it "must equal false when given '' " do
      @subj_empty.validate_email?.must_equal false
    end

  end

  describe "when validating all" do

    it "must equal 'All params are valid' when given 'Jeff Horn' and 'jeff@jeffreyhorn.com'" do
      @subj_correct.validate_all.must_equal "All params are valid"
    end

    it "must equal 'Name is not valid' when given '1234'" do
      @subj_incorrect_name.validate_all.must_equal "Name is not valid"
    end

    it "must equal 'Email is not valid' when given '1234&.com'" do
      @subj_incorrect_email.validate_all.must_equal "Email is not valid"
    end

    it "must equal 'Name is not valid Email is not valid' when given '1234' and '1234&.com'" do
      @subj_incorrect_both.validate_all.must_equal "Name is not valid\nEmail is not valid"
    end
    it "must equal 'Name is empty Email is empty' when given '' and ''" do
      @subj_empty.validate_all.must_equal "Name is empty\nEmail is empty"
    end

    it "must equal 'Name is empty Email is not valid' when given '' and '1234&.com'" do
      @subj_empty_name.validate_all.must_equal "Name is empty\nEmail is not valid"
    end

    it "must equal 'Name is not valid Email is empty' when given '1234' and ''" do
      @subj_empty_email.validate_all.must_equal "Name is not valid\nEmail is empty"
    end

  end

end

