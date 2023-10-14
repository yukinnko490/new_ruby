require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i #ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。




if memo_type == 1
  puts "ーーー拡張子を除いたファイルを入力して下さいーーーー"
  memo_title = gets.chomp
  
  puts "ーーーメモ内容を入力してくださいーーー"
  puts "完了したらCtrl + Dを押します"
  memo = STDIN.read
  CSV.open("#{memo_title}.csv",'w') do |csv|
    csv << [memo]
  end
  
elsif memo_type == 2
  puts "----既存のメモを編集します。ファイルを入力してください----"
  memo_title = gets.chomp
  puts "メモしたい内容を記入してください"
  puts "完了したらCtrl + Dを押します"
  memo = STDIN.read
  CSV.open("#{memo_title}.csv",'a') do |csv|
    csv << [memo]
  end
 

else 
  puts "Error !!  正しい番号を入力してください"
end