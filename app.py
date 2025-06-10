from flask import Flask

def create_app():
    app = Flask('splitpickles')

    @app.route('/')
    def index():
        return app.name
    
    @app.route('/favicon.ico')
    def favicon():
        return app.send_static_file('favicon.ico')

    return app
