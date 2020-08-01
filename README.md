# API Postagens authenticadas
## Descrição
API para postagens de conteudo (texto) com categorias e usuarios autenticados

### Pre requesitos
* ruby: 2.5.8
* rails: 2.5.8
* database: postgres
    * username: root
    * password: 123

### Para configurar a api
```
rails db:create && rails db:migrate
```

### Para executar projeto
```
rails s
```

# Endpoints
## Autenticação
### signup
[POST] http://localhost:300/signup
body:
```
{
    "user": {
        "email": "autor@autor.com",
        "password": "123"
    }
}
```
### login
[POST] http://localhost:300/login
body:
```
{
    "user": {
        "email": "autor@autor.com",
        "password": "123"
    }
}
```
com o Authentication da request, voce faz chamadas autenticadas
```
Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI1ZmZlOWM1Ni00MmJhLTRiNWUtYjE4NC0wMmQzYTI3NGJjOTMiLCJzdWIiOiIyIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNTk2MzIzNjkyLCJleHAiOjE1OTY0MTAwOTJ9.4NP0sttudZcQiZwz-NRxe04sPaRdrkwMFDy02khVuP4
```

## Categorias
cada endpoint da api tem por padrão o **C**reate, **R**ead, **U**pdate e **D**elete (CRUD)
### Create
[POST] http://localhost:300/categories
header:
```
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI1ZmZlOWM1Ni00MmJhLTRiNWUtYjE4NC0wMmQzYTI3NGJjOTMiLCJzdWIiOiIyIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNTk2MzIzNjkyLCJleHAiOjE1OTY0MTAwOTJ9.4NP0sttudZcQiZwz-NRxe04sPaRdrkwMFDy02khVuP4
```
body:
```
{
	"data": {
		"type": "category",
		"attributes": {
			"name": "Tecnologia"
		}
	}
}
```
### Create
[GET] http://localhost:300/categories
header:
```
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI1ZmZlOWM1Ni00MmJhLTRiNWUtYjE4NC0wMmQzYTI3NGJjOTMiLCJzdWIiOiIyIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNTk2MzIzNjkyLCJleHAiOjE1OTY0MTAwOTJ9.4NP0sttudZcQiZwz-NRxe04sPaRdrkwMFDy02khVuP4
```