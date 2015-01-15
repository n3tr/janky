module Janky
  module Notifier
    class ChatService
      def self.completed(build)
        status = build.green? ? "was successful" : "failed"
        color = build.green? ? "green" : "red"

        message = "Build #%s (%s) of %s/%s %s (%ss) by %s \n- %s" % [
          build.number,
          build.short_sha1,
          build.repo_name,
          build.branch_name,
          status,
          build.duration,
          build.commit_author,
          build.web_url
        ]

        ::Janky::ChatService.speak(message, build.room_id, {:color => color, :build => build})
      end
    end
  end
end
