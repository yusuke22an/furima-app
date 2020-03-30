crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", user_path
  parent :root 
end

crumb :itemshow do |item|
  link "#{item.name}", item_path
  parent :root
end