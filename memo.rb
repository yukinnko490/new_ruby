require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

#memo_type = gets.to_s ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
memo_type = gets.chomp.to_s



if memo_type === "1"
  puts "----メモ新規作成----"
  puts "ーーー拡張子を除いたファイルを入力して下さいーーーー"
  memo_title = gets.chomp.to_s
  
  puts "ーーーメモ内容を入力してくださいーーー"
  memo_text = gets.chomp.to_s
  CSV.open("#{memo_title}.csv",'w') do |csv|
    csv << [memo_text]
  end
  
elsif memo_type === "2"
  puts "----メモ編集----"
  Dir.foreach('.') do |item|
    next if item == '.' or item == '..'
    puts item
  end
  puts "ーーー上記のcsvファイルから、編集したいファイルを拡張子を除いて入力してくださいーーー"
  memo_title = gets.chomp.to_s
  
  CSV.open("#{memo_title}.csv",'a') do |csv|
    puts "ーーー#{memo_title}.csvに追記しますーーー"
    memo_add = gets.chomp.to_s
    csv << [memo_add]
  end
 

else 
  puts "Error !!  正しい番号を入力してください"
end