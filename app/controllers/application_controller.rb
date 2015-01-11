class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render_json_error('Record not found', status: :not_found)
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    render_json_error('Object is invalid',
                      status: :unprocessable_entity,
                      type: :record_invalid,
                      details: exception.record.errors)
  end

  rescue_from ActionController::ParameterMissing do |exception|
    render_json_error('Root element is missing')
  end

  private

  def render_json_error(msg, options={})
    error_json = {
      message: msg,
      type: options[:type] || :general
    }
    error_json[:details] = options[:details] if options[:details]

    render(
      json: error_json,
      status: options[:status] || :bad_request
    )
  end
end
