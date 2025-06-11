from flask import current_app
import mariadb

class Db:
    def __init__(self):
        try:
            self.db = mariadb.connect(**current_app.config['DB'])
        except mariadb.Error as e:
            print(f"Error connecting to MariaDB Platform: {e}")
