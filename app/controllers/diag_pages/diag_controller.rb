require_dependency "diag_pages/application_controller"

module DiagPages
  class DiagController < ApplicationController

    def index

      if params[:test].present? && params[:test] != "all"

        @tests = DiagPages.configuration.combined_tests.select { |test| test[:link] == params[:test] }

      elsif params[:test].present? && params[:test] == "all"

        @tests = DiagPages.configuration.combined_tests
      end

      Rails.logger.debug "one offz"
      Rails.logger.debug @tests.inspect

      if @tests.present?
        @tests.each do |test|
          time = Benchmark.realtime do
            test[:status] = test[:block].call
          end
          test[:time] = time
        end
      end
    end
  end
end
