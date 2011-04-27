class Project < ActiveRecord::Base
  has_many :iterations
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def self.permit?(role, action)
    case action
      when :create
        return (role == 'admin' or role == 'developer' ? true : false)
      when :update
        return (role == 'admin' or role == 'developer' ? true : false)
      when :destroy
        return (role == 'admin' ? true : false)
    end
  end
  
end
