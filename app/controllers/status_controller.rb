class StatusController < ApplicationController
  before_action :run_checks

  class << self
    def commit
      @commit ||= begin
        head = File.read '.git/HEAD'
        ref = head.match(/^ref: (.+)/)[1]
        File.read(".git/#{ref}").strip
      rescue
        'unknown'
      end
    end
  end

  def check
    render json: { commit: self.class.commit, errors: errors }, status: status
  end

  private

  def run_checks
    check_mongodb
  end

  def check_mongodb
    error :database, 'Data missing' if Mongoid::Clients.default.collections.nil?
  rescue
    error :database, 'Database unavailable'
  end

  def error(key, value)
    errors[key] = value
  end

  def errors
    @errors ||= {}
  end

  def status
    errors.empty? ? :ok : :service_unavailable
  end
end
