module TokenConcerns
  extend ActiveSupport::Concern

  private

  def generate_token
    create_token
  end
end
