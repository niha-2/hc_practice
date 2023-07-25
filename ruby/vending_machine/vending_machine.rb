# 自動販売機クラス
class VendingMachine
  DEAULT_INVENTORY_NUM = 5
  DEFAULT_DRINK_LIST = {
    'ペプシ' => 150,
    'モンスター' => 230,
    'いろはす' => 120
  }

  def initialize
    @sale_amount = 0
    DEFAULT_DRINK_LIST.each do |name, price|
      DEAULT_INVENTORY_NUM.times do
        @inventory << Juice.new(name, price)
      end
    end
  end

  # 購入可能なドリンクリストを取得する
  def purchasable_drink_list
    @inventory.keys.uniq
  end

  # 在庫を追加する
  def add_inventory(juice)
    @inventory << juice
  end

  # ジューズを購入できるかどうかを取得する
  def can_purchase_juice?(juice_name)
    purchasable_drink_list.include?(juice_name)
  end

  # ジュースを購入する
  def purchase(juice_name, suica)
    raise '在庫が足りません' unless can_purchase_juice?(juice_name)
    raise 'チャージ残高が足りません' if suica.balance < DEFAULT_DRINK_LIST[juice_name]

    @inventory.delete_at(@inventory.find_index { |juice| juice.name == juice_name })
    @sales_amount += DEFAULT_DRINK_LIST[juice_name]
    suica.pay(DEFAULT_DRINK_LIST[juice_name])
  end

  private

  # 売り上げ金額を取得する
  def sales_amount
    @sales_amount
  end
end
