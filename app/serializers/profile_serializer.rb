# frozen_string_literal: true
class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name
end
