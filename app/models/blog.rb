class Blog < ApplicationRecord
    enum status: {drafts: 0 , published: 1}
end
