class TheValidator
  attr_reader :name, :email

  def initialize(attributes = {})
    @name = attributes[:name] || ""
    @email = attributes[:email] || ""
    @errors = {}
  end

  def validate_all
    validation_passed = true

    validations = ['validate_name?', 'validate_email?']
    validations.each do |validation_method_name|
      if !self.send(validation_method_name.to_sym)
        validation_passed = false
      end
    end

    if validation_passed
      return { valid: true, errors: @errors }
    else
      return { valid: false, errors: @errors }
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

