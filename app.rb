require 'sinatra'

get '/' do
  erb :index
end


#設計図（メゾットの定義）

def show_message
  <<~TEXT
  <div style="text-align: center;">
     じゃんけんの手を選んでください<br>
     最初はグー、じゃんけん<br>
     ぽん！<br>
     TEXT
end

def jankens
  hands = ["[0]グー", "[1]チョキ", "[2]パー"]
  hands.each do |hand|
  puts hand
end
end


def computer_hand 
  ["グー", "チョキ", "パー"].sample  
end


def judge_result(hand, computer_hand)
  if hand == computer_hand
     "あいこ"

  elsif(hand == "グー" && computer_hand == "チョキ") ||
       (hand == "チョキ" && computer_hand == "パー") ||
       (hand == "パー" && computer_hand == "グー") 

     "勝ち"

  else
     "負け"
  end

end

#実行する流れ

show_message

get '/result' do
  @hand = params[:hand]
  @computer_hand = computer_hand
  @result = judge_result(@hand, @computer_hand)

  erb :result
end





  #連続で勝ったら、おぴよのえプレゼント
  #できればぐー、ちょきーぱーも絵にしたい
  #連続にかったらにするか、勝てば絵をランダムにプレゼントして、集めていける方式にするか


