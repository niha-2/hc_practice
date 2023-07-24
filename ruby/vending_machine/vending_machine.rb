# 自動販売機クラス
class VendingMachine
  def initialize
    @sale_amount = 0
    @inventory = {
      'ペプシ' => 5,
      'モンスター' => 5,
      'いろはす' => 5
    }
  end

  # ドリンクリストを取得する
  def inventory
    @inventory.keys
  end

  # 在庫を追加する
  def add_inventory(juice, quantity)
    @inventory[juice.name] += quantity
  end

  # ジューズを購入できるかどうかを取得する
  def can_purchase_juice?(juice)
    @inventory[juice.name].positive?
  end

  # ジュースを購入する
  def purchase(juice, suica)
    raise '在庫がありません' if @inventory[juice.name].zero?
    raise 'チャージ残高が足りません' if suica.balance < juice.price

    @inventory[juice] -= 1
    @sales_amount += juice.price
    suica.pay(juice.price)
  end

  private

  # 売り上げ金額を取得する
  def sales_amount
    @sales_amount
  end
end
