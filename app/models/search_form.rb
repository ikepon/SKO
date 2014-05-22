# coding : utf-8

class SearchForm
  # extend ActiveModel::Naming
  # include ActiveModel::Conversion
  include ActiveModel::Model

  attr_accessor :q, :male, :female, :grade

  def initialize(params)
    self.q = params[:q] if params
  end

  def persisted?
    false
  end
end