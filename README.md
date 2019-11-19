This repository demonstrate problem with [Yancy::Plugin::Auth::Password](https://metacpan.org/pod/Yancy::Plugin::Auth::Password)

Steps to reproduce the problem

1. `docker-compose up db`

wait ~1 min, until `[Note] mysqld: ready for connections` string in log

2. `docker-compose up app`, you must see `Server available at http://127.0.0.1:3000`

3. go to http://127.0.0.1:3010/yancy/auth/password

4. input `admin-admin` as login-pass

5. got `Login failed: User or password incorrect! ` error despite that default user `admin` [is created](https://github.com/pavelsr/yancy_passw_auth_problem/blob/master/sql/01_users.sql#L10)

you can check that user was created by 

```
docker exec -it yancy_passw_auth_problem_app_1 mysql -u root -p123qwe -h db yancy
MariaDB [yancy]> SELECT * FROM users;
+----+----------+-----------------+------------------------------+---------------------+
| id | username | email           | password                     | created             |
+----+----------+-----------------+------------------------------+---------------------+
|  1 | admin    | admin@localhost | 0DPiKuNIrrVmD8IUCuw1hQxNqZc= | 2019-11-19 17:23:00 |
+----+----------+-----------------+------------------------------+---------------------+
1 row in set (0.001 sec)
```

