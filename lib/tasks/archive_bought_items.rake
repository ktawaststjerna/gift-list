namespace :archive_bought_items do
  desc 'Archives all bought items'
  task archive_items: :environment do
    Item.where.not(bought_by: nil).each do |item|
      item.update!(archived: true)
      pp "Archived Item ID: #{item.id}"
    end
  end
end
