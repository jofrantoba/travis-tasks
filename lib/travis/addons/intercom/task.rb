module Travis
  module Addons
    module Intercom

      class Task < Travis::Task
        require 'travis/addons/intercom/client'

        def process(timeout)
          return unless user_id && build
          intercom = Client.new(user_id)
          intercom.report_last_build build.finished_at
        end

        def user_id
          payload[:owner][:id]
        end

        def build
          payload[:build]
        end

      end

    end
  end
end
