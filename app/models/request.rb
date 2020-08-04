class Request < ApplicationRecord
  def finish!
    self.update(finished_at: Time.current)
    self.save!
  end
end
