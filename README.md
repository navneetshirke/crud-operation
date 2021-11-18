Add other users in seed file same as albert einstine



index = curl -X GET http://localhost:3000/api/users
show = curl -X GET http://localhost:3000/api/user/1
destroy = curl -X DELETE http://localhost:3000/api/user/1
update = curl -X PUT http://localhost:3000/api/user/2/firstName=abc
search = curl -X GET http://localhost:3800/api/typeahead/abc
create = curl -v -H "Content-type: application/json" -X POST -d '{"firstName":"firstname","lastName":"lastname","email":"email@email.com"}' http://localhost:3000/api/user
