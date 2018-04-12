module OkComputer
  class CheckPresenter

    def initialize(check)
      @check = check
    end

    def show
      {
        "componentType": @check.registrant_name,
        "metric_value": @check.time,
        "metric_unit": "ms",
        "status": @check.failure_occurred ? "fail" : "pass",
        "time": Time.now.utc,
      }
    end
  end
end