# 自動販売機クラス
class VendingMachine
  def initialize
    @sale_amount = 0
    @inventory = {
      Juice.new('ペプシ', 150) => 5,
      Juice.new('モンスター', 230) => 5,
      Juice.new('いろはず', 120) => 5
    }
  end

  # 在庫を取得する
  def inventory
    @inventory
  end

  # 在庫を追加する
  def add_inventory(juice, quantity)
    @inventory[juice] += quantity
  end

  # ジューズを購入できるかどうかを取得する
  def can_purchase_juice?(juice)
    @inventory[juice].positive?
  end

  # ジュースを購入する
  def purchase(juice, suica)
    raise '在庫がありません' if @inventory[juice].zero?
    raise 'チャージ残高が足りません' if suica.obtaine_balance < juice.price

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
