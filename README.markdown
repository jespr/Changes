Changes
============================================================

Changes is a gem that logs the changes in your models after you update the values. Let's say you do a

    @model = MyModel.create(:amount => 99)
    
Then after

    @model.update_attribute(:amount => 100)
    
Then you can see the changes

    @model.show_changes
    
Which will return

    ["Amount changed from 99.0 to 100.0\n"]

Requirements
------------

* Rails 3.x (Not tested with Rails 3.1)

Installation
------------

In your gemfile:

    gem 'changes'

After running a 'bundle install' you need to generate the migrations file

    rails generate changes

License
-------

This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License

Usage
=====

In the model where you wish to log the changes, when updating. You add

    has_changes
    
Then after an update you can do

    @updated_model.show_changes
    
And the changes will be listed with before and after values

