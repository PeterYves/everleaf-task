## Tables that will be used
1.Users table
  1.id: integer
  2.name: text
  3.email: text
  4.password:string

2.Tasks table
  1. id: integer
  2. name: string
  3. content: text
  4. user_id: integer
  5. status: string
  6. priority: integer
  7. start_date: timedate
  8. end_date: timedate

  Users | Tasks
------------ | -------------
id: integer | id: integer
name: text | name: text
email: text | content: text
password:string | user_id: integer
                | status: string
                | priority: integer
                | start_date: timedate
                | end_date: timedate

  user
-----
id: integer
name: text