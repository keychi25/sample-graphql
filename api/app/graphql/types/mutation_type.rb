module Types
  class MutationType < Types::BaseObject
    # TODO: remove me  
    field :create_book, mutation: Mutations::CreateBook
    field :update_book, mutation: Mutations::UpdateBook
  end
end
