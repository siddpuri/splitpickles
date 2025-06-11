from flask import Flask, request, render_template
from db import Db
from state import State

def create_app():
    app = Flask('splitpickles')
    app.app_context().push()

    app.config.from_mapping(
        SECRET_KEY='dev',
        DB={
            'host': 'localhost',
            'user': 'splitpickles',
            'password': 'splitpickles',
            'database': 'splitpickles',
        }
    )

    db = Db()
    state = State(db)

    @app.route('/')
    def index():
        return render_template('landing.html', state = state)
    
    @app.route('/favicon.ico')
    def favicon():
        return app.send_static_file('favicon.ico')

    return app
