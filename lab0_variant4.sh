#!/bin/bash
#Лабораторная работа 1, вариант 4

cd ~
git init

mkdir lab0
cd ~/lab0

mkdir claude_monet
mkdir claude_monet/kitchen
mkdir claude_monet/chef_office
mkdir claude_monet/tasting_room
mkdir arcobaleno
mkdir arcobaleno/kitchen
mkdir arcobaleno/office
mkdir arcobaleno/archive

echo -e "Утиная ножка от Виктора Баринова\nЛуковый суп Claude Monet\nФирменный салат от шефа\nДесерт Луи с карамелью" > claude_monet/kitchen/old_menu

echo -e "Подготовить утиную ножку\nДобавить овощи и соус от Баринова\nПеред подачей проверить температуру" > claude_monet/kitchen/duck_recipe

echo -e "Не повторять блюда конкурентов\nКатю допустить к общей дегустации\nЛёва записывает замечания шефа\nПоследнее решение принимает Баринов" > claude_monet/chef_office/barinov_notes

echo -e "Блюдо Баринова получило девять баллов\nПаста Кати получила восемь баллов\nДесерт Луи получил десять баллов" > claude_monet/tasting_room/tasting_scores

echo -e "Лёва проверил порядок подачи блюд\nМеню обоих ресторанов готово к сравнению\nРезультаты переданы Виктору Петровичу" > claude_monet/tasting_room/leva_comment

echo -e "Домашняя паста от Елены Павловны\nРизотто с белыми грибами\nИтальянский рыбный суп\nДесерт по рецепту Кати" > arcobaleno/kitchen/italian_menu

echo -e "Катя приготовила молекулярную закуску\nДля блюда использованы знакомые продукты\nЕлена Павловна одобрила новую подачу" > arcobaleno/kitchen/katya_recipe

echo -e "Елена Павловна встречает критика\nКатя представляет новое блюдо\nКоманда Arcobaleno готовит итальянское меню" > arcobaleno/office/elena_plan

echo -e "Критик похвалил пасту в прошлый визит\nГости отметили спокойную работу кухни\nЕлена сохранила отзыв для нового меню" > arcobaleno/archive/review_archive

echo -e "Ресторанный критик посетит оба ресторана\nСначала он зайдёт в Claude Monet\nПосле этого отправится в Arcobaleno" > critic_visit

chmod u=rwx,g=rx,o=rx claude_monet
chmod 750 claude_monet/kitchen
chmod 644 claude_monet/kitchen/old_menu
chmod u=rw,g=r,o= claude_monet/kitchen/duck_recipe
chmod 710 claude_monet/chef_office
chmod 600 claude_monet/chef_office/barinov_notes
chmod u=rwx,g=rwx,o= claude_monet/tasting_room
chmod 640 claude_monet/tasting_room/tasting_scores
chmod u=r,g=r,o= claude_monet/tasting_room/leva_comment
chmod 755 arcobaleno
chmod u=rwx,g=rx,o= arcobaleno/kitchen
chmod 644 arcobaleno/kitchen/italian_menu
chmod u=rw,g=r,o= arcobaleno/kitchen/katya_recipe
chmod 750 arcobaleno/office
chmod u=r,g=r,o= arcobaleno/office/elena_plan
chmod u=rwx,g=rx,o= arcobaleno/archive
chmod 640 arcobaleno/archive/review_archive
chmod u=rw,g=r,o=r critic_visit

cd ~
git status
git add lab0

GIT_AUTHOR_NAME="Anfisari" \
GIT_AUTHOR_EMAIL="209837999+Anfisari@users.noreply.github.com" \
GIT_COMMITTER_NAME="Anfisari" \
GIT_COMMITTER_EMAIL="209837999+Anfisari@users.noreply.github.com" \
git commit -m "Часть 1: создание структуры и настройка прав доступа"

git push https://github.com/Anfisari/avs_lab0_variant4.git HEAD:main

cd ~/lab0

cp arcobaleno/kitchen/katya_recipe claude_monet/kitchen/new_recipe
cp -r arcobaleno/archive claude_monet/chef_office/reviews_copy
ln -s ../kitchen/katya_recipe arcobaleno/office/chef_recipe
ln -s arcobaleno/kitchen rival_kitchen
ln critic_visit claude_monet/tasting_room/critic_copy

cat claude_monet/kitchen/old_menu arcobaleno/kitchen/italian_menu > claude_monet/tasting_room/menu_comparison

cat claude_monet/tasting_room/leva_comment >> critic_visit

mv claude_monet/chef_office/barinov_notes claude_monet/tasting_room/chef_verdict

cd ~
git status
git add lab0

GIT_AUTHOR_NAME="Anfisari" \
GIT_AUTHOR_EMAIL="209837999+Anfisari@users.noreply.github.com" \
GIT_COMMITTER_NAME="Anfisari" \
GIT_COMMITTER_EMAIL="209837999+Anfisari@users.noreply.github.com" \
git commit -m "Часть 2: копирование, создание ссылок и перемещение"

git push https://github.com/Anfisari/avs_lab0_variant4.git HEAD:main

cd ~/lab0

ls -lR | grep '^-' | grep -v 'copy' | sort -k5,5nr | head -n 5

grep -rihE 'баринов|катя' claude_monet arcobaleno | grep -vi 'десерт' | sort | head -n 6

grep -li 'блюд' claude_monet/kitchen/* arcobaleno/kitchen/* | wc -l

tail -q -n 2 claude_monet/kitchen/*_menu arcobaleno/kitchen/*_menu | grep -iE 'десерт|суп' | sort -r

grep -vi 'десерт' claude_monet/tasting_room/menu_comparison | sort -r | head -n 4 | wc -w

ls -liR | grep -E '^[[:space:]]*[0-9]+ -[^ ]+[[:space:]]+2[[:space:]]' | sort -n -k1,1

grep -rihE 'гост|меню' claude_monet/chef_office/reviews_copy | grep -vi 'Елена' | sort | wc -l

rm arcobaleno/kitchen/katya_recipe
rm arcobaleno/office/chef_recipe
rm rival_kitchen
rm critic_visit
rm claude_monet/tasting_room/critic_copy
rm arcobaleno/archive/review_archive
rmdir arcobaleno/archive
rm -r claude_monet/chef_office/reviews_copy

ls -R

cd ~
git status
git add lab0

GIT_AUTHOR_NAME="Anfisari" \
GIT_AUTHOR_EMAIL="209837999+Anfisari@users.noreply.github.com" \
GIT_COMMITTER_NAME="Anfisari" \
GIT_COMMITTER_EMAIL="209837999+Anfisari@users.noreply.github.com" \
git commit -m "Часть 3: поиск, фильтрация и удаление"

git push https://github.com/Anfisari/avs_lab0_variant4.git HEAD:main

git log --oneline
