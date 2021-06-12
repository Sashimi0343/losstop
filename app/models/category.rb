class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'お肉' },
    { id: 2, name: 'お魚' },
    { id: 3, name: 'お菓子' },
    { id: 4, name: '乾麺' },
    { id: 5, name: 'カップ麺' },
    { id: 6, name: 'お酒' },
    { id: 7, name: '調味料' },
    { id: 8, name: 'ドライフルーツ' },
    { id: 9, name: '冷凍食品' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :bazaars
end
