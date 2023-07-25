# Suiceクラス
class Suica
  DEFAULT_BALANCE = 500
  # 500円がデフォルトでチャージされる
  def initialize
    @balance = DEFAULT_BALANCE
  end

  # 100円以上の任意の金額をチャージする
  def charge(amount)
    raise 'チャージは100円以上です' if amount < 100

    @balance += amount
  end

  # 任意の金額を支払う
  def pay(amount)
    raise '残高が足りません' if amount > @balance

    @balance -= amount
  end

  private

  # 残高を取得する
  def balance
    @balance
  end
end
