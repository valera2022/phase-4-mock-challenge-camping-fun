class CamperSerializer < ActiveModel::Serializer
  attributes :id,:name,:age
  # has_many :activites
end
