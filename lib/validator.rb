class TheValidator
  attr_accessor :name, :email

  def initialize(attributes = {name: "", email: ""})
    @name = attributes[:name]
    @email = attributes[:email]
    @errors = {name_err: "", email_err: ""}
  end

  def validate_all
    case
    when validate_name? == true && validate_email? == true
      return "All params are valid"
    when validate_name? == true && validate_email? == false
      return "#{@errors[:email_err]}"
    when validate_name? == false && validate_email? == true
      return "#{@errors[:name_err]}"
    when validate_name? ==false && validate_email? == false
      return "#{@errors[:name_err]}\n#{@errors[:email_err]}"
    end
  end

  def validate_name?
    case
    when @name.empty?
      @errors[:name_err] = "Name is empty"
      return false
    when @name.match(/^[a-z ,.'-]+$/i)
      return true
    else
      @errors[:name_err] = "Name is not valid"
      return false
    end
  end

  def validate_email?
    case
    when @email.empty?
      @errors[:email_err] = "Email is empty"
      return false
    when @email.match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i)
      return true
    else
      @errors[:email_err] = "Email is not valid"
      return false
    end
  end
  
end

