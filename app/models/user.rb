class User < ApplicationRecord
    has_many :offers
    has_many :requests
end
