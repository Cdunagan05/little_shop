FactoryGirl.define do
  factory :item do
    sequence(:title) { |n| "Jersey #{n}" }
    sequence(:description) { |n| "This is a cool jersey, #{n}" }
    price 100.00
    image 'image_url'
    status 0

    factory :item_with_orders do
      transient do
        order_count 2
      end

      after(:create) do |item, evaluator|
        create_list(:order, evaluator.order_count, items: [item])
      end
    end
  end

  factory :user do
    sequence(:username) { |n| "user#{n}" }
    password 'password'
    role 0
    name 'Billybob Thorton'
    address '123 Fake St'
  end

  factory :category do
    sequence(:name) { |n| "Jersey#{n}" }

    factory :category_with_items do
      transient do
        item_count 2
      end

      after(:create) do |category, evaluator|
        create_list(:item, evaluator.item_count, categories: [category])
      end
    end
  end

  factory :order do
    status 0
    user

    factory :order_for_user do
      user

      factory :order_with_user_and_items do
        transient do
          item_count 2
        end

        after(:create) do |order, evaluator|
          create_list(
            :item_with_orders,
            evaluator.item_count,
            orders: [order]
          )
        end
      end
    end
  end
end
