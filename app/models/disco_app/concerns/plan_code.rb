module DiscoApp::Concerns::PlanCode
  extend ActiveSupport::Concern

  included do

    belongs_to :disco_app_plan

    validates_presence_of :code
    validates_presence_of :amount

  end

end
