Ответы на вопросы:
1.  Команда apt update обновляет локальный кэш списка доступных пакетов из репозиториев, а команда apt upgrade устанавливает доступные обновления для уже установленных пакетов
2.  telnet -host -port
3.  ping, ipconfig, tracerout, nslookup

# Задание 1:
![](https://github.com/Hoaxlt/foraton/blob/zil/Screenshot_2.png)
![](https://github.com/Hoaxlt/foraton/blob/zil/Screenshot_3.png)


# Задание 2:
Напишите простой .gitlab-ci.yml файл
Сценарий:
Этап test должен запускать проверку наличия установленного nginx:
bash
Copy
Edit
which nginx && nginx -v Ожидаемый результат:
Корректный файл .gitlab-ci.yml с минимальным пайплайном
Комментарии внутри объясняют, что делает каждая стадия

![решение](https://github.com/Hoaxlt/foraton/blob/zil/.gitlab-ci.yml)

# Задание 3
Работа с Docker (по желанию, но желательно):
Напишите Dockerfile, который собирает образ с nginx и выводит “Hello from DevOps!” на главной
странице
Ожидаемый результат:
Рабочий Dockerfile
Контейнер поднимается и отвечает на curl localhost или через браузер

![решение](https://github.com/Hoaxlt/foraton/blob/zil/Dockerfile)

курл:
![](https://github.com/Hoaxlt/foraton/blob/zil/Screenshot_1.png)
# Задание 4
(На выбор) Мини-задание по YAML / Kubernetes:
Напишите простейший deployment.yaml, который запускает nginx в 1 реплике
Ожидаемый результат:
Корректный YAML-файл, описывающий Deployment
Используется nginx:stable
Указаны replicas, containers, ports

![решение](https://github.com/Hoaxlt/foraton/edit/zil/deployment.yaml)

![](https://github.com/Hoaxlt/foraton/blob/zil/Screenshot_4.png)
