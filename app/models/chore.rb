class Chore < ApplicationRecord
    # Relationships
    belongs_to :child
    belongs_to :task

    #Validations
    validates_date :due_on

    #Scopes
    scope :by_task, -> {joins(:task).order('name') }
    scope :chronological, -> { order('due_on ASC', 'completed') }
    scope :upcoming, -> { where('due_on >= ?',  Date.current )}
    scope :past, -> { where('due_on < ?', Date.current )}
    scope :done, -> { where(completed: true)}
    scope :pending, -> { where(completed: false)}

    #Methods

    def status
        if completed
            return 'Completed'
         
        else
            'Pending'
        end
    end
end
