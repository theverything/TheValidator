TheValidator
============

A simple validator class.

Usage
-----

Initialize TheValidator and get the results

    params = TheValidator.new( name: "Foo Bar", email: "foo@bar.com" )
    results = params.validate_all

The return results will be in a hash

If the params are valid then the returned hash will look like

    { :valid => true, :form_params => { :name => "Foo Bar", :email => "foo@bar.com" } }

If the params are not valid the the hash with be returned with the corresponding errors and will look like

    { :valid => false, :form_params => { :name_err => "Name is not valid", :email_err => "Email is not valid" } }

It is super basic right now and I am actively working on cleaning up the code and adding more validations.

To-Do List
----------

* Add more validations (phone number, message, address)
* Fix tests
* Make it easier to use which ever validations you choose

