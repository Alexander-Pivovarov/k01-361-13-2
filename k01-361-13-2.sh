#!/bin/bash
clear
echo 'Программа для git разработчика'
echo 'Скрипт облегчает использование git'
echo 'Разработчик: Пивоваров Александр'
echo 'Начать выполнение? (y/n): '
while [ true ];	do
	read choice
	if [ $choice = 'y' ]
		then
		clear
		echo 'Выберете тип действия: '
		echo '	Показать статус репозитория(status)'
		echo '	Отправить коммит(commit)'
		echo '	Добавить файл в репозиторий(add)'
		read action
		if [ $action = 'status' ]
			then
			clear
			git status
		elif [ $action = 'commit' ]
			then
			clear
			echo 'Введите текст для commit'
			read comm
			git commit -m "$comm"
			echo "Введите имя репозитория"
			read rep
			echo "Введите логин на GitHub"
			read log
			git remote add origin https://github.com/$log/$rep.git
			git push -u origin master
		elif [ $action = 'add' ]
			then
			clear
			echo 'Введите путь к файлу: '
			read path
			while ! [ -d $path ]
			do
				echo 'Такой директории не существует. Повторить? (y/n): '
				read choice
				if [ $choice = 'y' ]
				then
					clear
					echo 'Введите путь к файлу: '
					read path
				elif [ $choice = 'n' ]
				then
					clear
					exit 0
				fi
			done
			cd $path
			echo 'Введите имя файла: '
			read name
			while ! [ -f $name ]
			do
				echo 'Такого файла не существует. Повторить? (y/n): '
				read choice
				if [ $choice = 'y' ]
				then
					clear
					echo 'Имя файла: '
					read name
				elif [ $choice = 'n' ]
				then
					clear
					exit 0
				fi
			done
			touch $name
			if ! [ -d $path/.git ]
			then
				git init
			fi
			git add $name
			echo "Введите имя репозитория"
			read rep
			echo "Введите логин на GitHub"
			read log
			git commit -m 'commit'
			git remote add origin https://github.com/$log/$rep.git
			git push -u origin master
		fi
		echo 'Повторить? y/n: '
	elif [ $choice = 'n' ]
		then
		echo 'Выполнение программы завершено'
		echo 'k01-361-2012'
		echo 'Разработчик: Пивоваров Александр'
		exit
	elif ! [ $choice = 'y' -o $choice = 'n' ]
		then
		echo 'Ошибка ввода. Введите y/n: '
	fi
done
echo 'Разработчик: Пивоваров Александр'
