# simple_api
Веб-приложение на основе фреймворка sinatra
Sinatra выбран из-за того, что создан для небольших веб-приложений, он не генерирует большую структуру папок и представляет
необходимые решения, т.е. создание обработчиков get и post запросов.
В качестве базы данных для приложения была выбрана GNU dbm, которая представляет собой простую локальную бд, которая
хранит только пары ключ-значение и в целом является хэшом, что также подходит для поставленной задачи.
На мой взгляд это и обеспечивает то, что данные не будут не сохранены при перезапуске сервера.
