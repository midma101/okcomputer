module OkComputer
  class CheckCollectionPresenter

    def initialize(check_collection)
      @check_collection = check_collection
    end

    def list
      {
        status: @check_collection.success? ? "pass" : "fail",
        description: "Checks run - #{@check_collection.check_names.to_s}",
        details: @check_collection.checks.reduce({}) { |memo, check|
          memo[check.registrant_name] = OkComputer::CheckPresenter.new(check).show
          memo
        }
      }
    end
  end
end