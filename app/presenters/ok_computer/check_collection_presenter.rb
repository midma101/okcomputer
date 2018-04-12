module OkComputer
  class CheckCollectionPresenter

    def initialize(check_collection)
      @check_collection = check_collection
    end

    def list
      {
        status: @check_collection.success? ? "pass" : "fail",
        details: @check_collection.checks.map{ |check| OkComputer::CheckPresenter.new(check).show },
      }
    end
  end
end