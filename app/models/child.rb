class Child < ApplicationRecord
    #Validations
    has_many :chores
    has_many :tasks, through :chores

    
end
