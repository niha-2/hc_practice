# ポケモンクラスとプレイヤークラスの共通部分を切り出してNameServiceクラスを作成
# 他言語でいうところの抽象クラス/インターフェースのようなもの
class NameService
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def change_name(new_name)
    if new_name == 'うんこ'
      puts 'うんこはだめです'
      return
    end
    @name = new_name
  end
end

# ポケモンクラス（NameServiceクラスを継承）
class Pokemon < NameService
  attr_reader :type1, :type2, :hp

  def initialize(name, type1, type2, hp)
    super(name)
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    puts "#{@name}のこうげき！"
  end
end

# ピカチュウクラス
# ポケモンの子クラス
class Pikachu < Pokemon
  def initialize(name, type1, type2, hp)
    super
  end

  def attack
    super
    puts "#{@name}の10万ボルト！"
  end
end

# プレイヤークラス（NameServiceクラスを継承）
class Player < NameService
  def initialize(name)
    super
  end
end

# 実行
# ポケモン
pika = Pikachu.new('ピカチュウ', 'でんき', '', 100)
puts pika.name
puts pika.attack

pika.change_name('テキセツ')
puts pika.name

pika.change_name('うんこ')
puts pika.name

# プレイヤー
baseball_player = Player.new('イチロー')
puts baseball_player.name

baseball_player.change_name('テキセツ')
puts baseball_player.name

baseball_player.change_name('うんこ')
puts baseball_player.name
