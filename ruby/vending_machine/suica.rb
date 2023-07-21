# Suiceクラス
class Suica
  # 500円がデフォルトでチャージされる
  def initialize
    @balance = 500
  end

  # 100円以上の任意の金額をチャージする
  def charge(amount)
    raise 'チャージは100円以上です' if amount < 100

    @balance += amount
  end

  # 任意の金額を支払う
  def pay(amount)
    @balance -= amount
  end

  private

  # 残高を取得する
  def balance
    @balance
  end
end
